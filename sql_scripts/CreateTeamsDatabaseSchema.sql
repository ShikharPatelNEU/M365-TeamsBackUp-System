USE master
GO

IF OBJECT_ID('DropDatabaseWithKill', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE DropDatabaseWithKill;
    PRINT 'Procedure DropDatabaseWithKill dropped successfully.';
END
ELSE
BEGIN
    PRINT 'Procedure DropDatabaseWithKill does not exist.';
END
GO

CREATE PROCEDURE DropDatabaseWithKill
    @dbName NVARCHAR(128),
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @errorMessage NVARCHAR(4000);

    -- Check if the database exists
    IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = @dbName)
    BEGIN
        SET @message = 'Error: Database does not exist.';
        RETURN;
    END

    -- Disconnect active connections
    DECLARE @killQuery NVARCHAR(MAX) = '';
    SELECT @killQuery = @killQuery + 'kill ' + CAST(spid AS NVARCHAR(5)) + ';'
    FROM sys.sysprocesses 
    WHERE DB_NAME(dbid) = @dbName;

    IF @killQuery <> ''
    BEGIN
        BEGIN TRY
            EXEC sp_executesql @killQuery;
        END TRY
        BEGIN CATCH
            SET @errorMessage = ERROR_MESSAGE();
            SET @message = 'Error: Unable to disconnect active connections. ' + @errorMessage;
            RETURN;
        END CATCH
    END

    -- Set the database to single-user mode
    BEGIN TRY
        EXEC('ALTER DATABASE [' + @dbName + '] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;');
    END TRY
    BEGIN CATCH
        SET @errorMessage = ERROR_MESSAGE();
        SET @message = 'Error: Unable to set the database to single-user mode. ' + @errorMessage;
        RETURN;
    END CATCH

    -- Drop the database
    BEGIN TRY
        EXEC('DROP DATABASE [' + @dbName + '];');
        SET @message = 'Success: Database ' + @dbName + ' dropped successfully.';
    END TRY
    BEGIN CATCH
        SET @errorMessage = ERROR_MESSAGE();
        SET @message = 'Error: Unable to drop the database. ' + @errorMessage;
    END CATCH
END;
GO

DECLARE @message NVARCHAR(255);
EXEC DropDatabaseWithKill @dbName = 'teams', @message = @message OUTPUT;
PRINT @message;

-- Create teams database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'teams')
BEGIN
    CREATE DATABASE [teams]
END
GO

USE [teams]
GO

-- Create Organization table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Organization')
BEGIN
    CREATE TABLE Organization (
        org_id INT PRIMARY KEY,
        org_name VARCHAR(255),
        org_admin_email VARBINARY(400)
    );
END
GO

-- Create SubscriptionPeriod table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'SubscriptionPeriod')
BEGIN
    CREATE TABLE SubscriptionPeriod (
        period_id INT PRIMARY KEY,
        period_name VARCHAR(50)
    );
END
GO

-- Create SubscriptionPlan table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'SubscriptionPlan')
BEGIN
    CREATE TABLE SubscriptionPlan (
        plan_id INT PRIMARY KEY,
        plan_name VARCHAR(255),
        price DECIMAL(10, 2),
        subscription_period_id INT,
        storage_limit INT,
        CONSTRAINT CHK_Price CHECK (price > 0),
        CONSTRAINT CHK_StorageLimit CHECK (storage_limit >= 0),
        FOREIGN KEY (subscription_period_id) REFERENCES SubscriptionPeriod (period_id)
    );
END
GO

-- Create OrgPlan_Map table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'OrgPlan_Map')
BEGIN
    CREATE TABLE OrgPlan_Map (
        org_plan_id INT PRIMARY KEY,
        org_id INT,
        plan_id INT,
        plan_start_date DATE,
        plan_end_date DATE,
        CONSTRAINT CHK_PlanEndDate CHECK (plan_end_date > plan_start_date), 
        FOREIGN KEY (org_id) REFERENCES Organization(org_id),
        CONSTRAINT FK_SubPlan FOREIGN KEY (plan_id) REFERENCES SubscriptionPlan(plan_id)
    );
END
GO

-- Create BackupSettings table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'BackupSettings')
BEGIN
    CREATE TABLE BackupSettings (
        backup_settings_id INT PRIMARY KEY,
        org_plan_id INT,
        retention_policy_days INT,
        backup_frequency INT,
        CONSTRAINT FK_OrgPlan FOREIGN KEY (org_plan_id) REFERENCES OrgPlan_Map(org_plan_id),
        CONSTRAINT CHK_RetentionPolicy CHECK (retention_policy_days > 0 AND retention_policy_days <= 365),
        CONSTRAINT CHK_BackupFrequency CHECK (backup_frequency > 0 AND backup_frequency <= 5) 
    );
END
GO

-- Create Sites table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Sites')
BEGIN
    CREATE TABLE Sites (
        site_id INT PRIMARY KEY,
        msft_site_id VARCHAR(225),
        site_name VARCHAR(255),
        site_description TEXT,
        creation_date DATE,
        city VARCHAR(50),
        country VARCHAR(50),
    );
END
GO



-- Create TeamSettings table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TeamSettings')
BEGIN
    CREATE TABLE TeamSettings (
        team_settings_id INT PRIMARY KEY,
        allow_create_update_channels BIT,
        allow_create_private_channels BIT,
        allow_delete_channels BIT,
        allow_user_edit_messages BIT,
        allow_user_delete_messages BIT
    );
END
GO

-- Create Teams table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Teams')
BEGIN
    CREATE TABLE Teams (
        team_id INT PRIMARY KEY,
        org_id INT,
        site_id INT,
        team_settings_id INT,
        display_name VARCHAR(255),
        msft_team_id VARCHAR(225),
        team_description TEXT,
        creation_date DATE,
        FOREIGN KEY (org_id) REFERENCES Organization(org_id),
        FOREIGN KEY (site_id) REFERENCES Sites(site_id),
        FOREIGN KEY (team_settings_id) REFERENCES TeamSettings(team_settings_id)
    );
END
GO

-- Create Apps table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Apps')
BEGIN
    CREATE TABLE Apps (
        app_id INT PRIMARY KEY,
        team_id INT, 
        app_name VARCHAR(255),
        app_description TEXT,
        installed_date DATE,
        FOREIGN KEY (team_id) REFERENCES Teams(team_id)
    );
END
GO

-- Create Users table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Users')
BEGIN
    CREATE TABLE Users (
        user_id INT PRIMARY KEY,
        user_first_name VARCHAR(255),
        user_last_name VARCHAR(255),
        user_email VARBINARY(400),
        org_id INT,
        FOREIGN KEY (org_id) REFERENCES Organization(org_id)
    );
END
GO


-- Create TeamMembers table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TeamMembers')
BEGIN
    CREATE TABLE TeamMembers (
        team_id INT,
        user_id INT,
        joining_date DATE,
        role VARCHAR(255),
        PRIMARY KEY (team_id, user_id),
        FOREIGN KEY (team_id) REFERENCES Teams(team_id),
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
    );
END
GO

-- Create Channels table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Channels')
BEGIN
    CREATE TABLE Channels (
        channel_id INT PRIMARY KEY,
        team_id INT,
        channel_name VARCHAR(255),
        channel_type VARCHAR(255),
        description TEXT,
        created_date DATE,
        FOREIGN KEY (team_id) REFERENCES Teams(team_id)
    );
END
GO

-- Create Messages table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Messages')
BEGIN
    CREATE TABLE Messages (
        message_id INT PRIMARY KEY,
        user_id INT,
        channel_id INT,
        message_text NVARCHAR(MAX),
        creation_date DATE,
        last_modified_date DATE,
        CONSTRAINT CHK_ModifiedDate CHECK (last_modified_date >= creation_date), 
        FOREIGN KEY (user_id) REFERENCES Users(user_id),
        FOREIGN KEY (channel_id) REFERENCES Channels(channel_id)
    );
END
GO

-- Create Reactions table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Reactions')
BEGIN
    CREATE TABLE Reactions (
        reaction_id INT PRIMARY KEY,
        message_id INT,
        user_id INT,
        reaction_type VARCHAR(255) DEFAULT 'like',
        FOREIGN KEY (message_id) REFERENCES Messages(message_id),
        FOREIGN KEY (user_id) REFERENCES Users(user_id),
        CONSTRAINT CK_ReactionType CHECK (reaction_type IN ('like', 'love', 'haha', 'wow', 'sad', 'angry'))
    );
END
GO


-- Create Files table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Files')
BEGIN
    CREATE TABLE Files (
        file_id INT PRIMARY KEY,
        channel_id INT,
        user_id INT,
        file_name VARCHAR(255),
        file_size INT,
        upload_date DATE,
        CONSTRAINT CHK_Size CHECK (file_size >= 0),
        CONSTRAINT CHK_UploadDate CHECK (upload_date <= GETDATE()),
        FOREIGN KEY (channel_id) REFERENCES Channels(channel_id),
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
    );
END
GO

-- Create ChannelMembers table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ChannelMembers')
BEGIN
    CREATE TABLE ChannelMembers (
        channel_id INT,
        user_id INT,
        joining_date DATE,
        role VARCHAR(255),
        PRIMARY KEY (channel_id, user_id),
        FOREIGN KEY (channel_id) REFERENCES Channels(channel_id),
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
    );
END
GO
