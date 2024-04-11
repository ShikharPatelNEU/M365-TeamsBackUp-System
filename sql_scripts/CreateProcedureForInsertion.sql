USE teams;
GO

-- Create master key if it does not exist
IF NOT EXISTS (SELECT * FROM sys.symmetric_keys WHERE name = '##MS_DatabaseMasterKey##')
BEGIN
    CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'DreamBig@123';
    PRINT 'Master Key created successfully.';
END

-- Drop key and certificate for insertOrg procedure
IF EXISTS (SELECT * FROM sys.symmetric_keys WHERE name = 'OrgKey')
BEGIN
    DROP SYMMETRIC KEY OrgKey;
    PRINT 'Symmetric Key OrgKey dropped successfully.';
END

IF EXISTS (SELECT * FROM sys.certificates WHERE name = 'OrgCert')
BEGIN
    DROP CERTIFICATE OrgCert;
    PRINT 'Certificate OrgCert dropped successfully.';
END

-- Drop key and certificate for insertMessage procedure
IF EXISTS (SELECT * FROM sys.symmetric_keys WHERE name = 'MessageKey')
BEGIN
    DROP SYMMETRIC KEY MessageKey;
    PRINT 'Symmetric Key MessageKey dropped successfully.';
END

IF EXISTS (SELECT * FROM sys.certificates WHERE name = 'MessageCert')
BEGIN
    DROP CERTIFICATE MessageCert;
    PRINT 'Certificate MessageCert dropped successfully.';
END

-- Drop key and certificate for insertUser procedure
IF EXISTS (SELECT * FROM sys.symmetric_keys WHERE name = 'UserKey')
BEGIN
    DROP SYMMETRIC KEY UserKey;
    PRINT 'Symmetric Key UserKey dropped successfully.';
END

IF EXISTS (SELECT * FROM sys.certificates WHERE name = 'UserCert')
BEGIN
    DROP CERTIFICATE UserCert;
    PRINT 'Certificate UserCert dropped successfully.';
END

-- Drop insertOrg procedure if exist
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'InsertOrganization')
BEGIN
    DROP PROCEDURE InsertOrganization;
    PRINT 'Procedure InsertOrganization dropped successfully.';
END

-- Drop insertMessage procedure if exist
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'InsertMessage')
BEGIN
    DROP PROCEDURE InsertMessage;
    PRINT 'Procedure InsertMessage dropped successfully.';
END
GO

-- create key and certificate for InsertOrganization Procedure
-- Create certificate if it does not exist
IF NOT EXISTS (SELECT * FROM sys.certificates WHERE name = 'OrgCert')
BEGIN
    CREATE CERTIFICATE OrgCert WITH SUBJECT = 'OrgSecret';
    PRINT 'Certificate OrgCert created successfully.';
END

-- Create symmetric key if it does not exist
IF NOT EXISTS (SELECT * FROM sys.symmetric_keys WHERE name = 'OrgKey')
BEGIN
    CREATE SYMMETRIC KEY OrgKey
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE OrgCert;
    PRINT 'Symmetric Key OrgKey created successfully.';
END

-- create key and certificate for InsertMessage Procedure
-- Create certificate for encryption if it does not exist
IF NOT EXISTS (SELECT * FROM sys.certificates WHERE name = 'MessageCert')
BEGIN
    CREATE CERTIFICATE MessageCert WITH SUBJECT = 'MessageSecret';
    PRINT 'Certificate MessageCert created successfully.';
END

-- Create symmetric key for encryption if it does not exist
IF NOT EXISTS (SELECT * FROM sys.symmetric_keys WHERE name = 'MessageKey')
BEGIN
    CREATE SYMMETRIC KEY MessageKey
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE MessageCert;
    PRINT 'Symmetric Key MessageKey created successfully.';
END
GO

-- create key and certificate for InsertUser Procedure
-- Create certificate for encryption if it does not exist
IF NOT EXISTS (SELECT * FROM sys.certificates WHERE name = 'UserCert')
BEGIN
    CREATE CERTIFICATE UserCert WITH SUBJECT = 'UserSecret';
    PRINT 'Certificate UserCert created successfully.';
END

-- Create symmetric key for encryption if it does not exist
IF NOT EXISTS (SELECT * FROM sys.symmetric_keys WHERE name = 'UserKey')
BEGIN
    CREATE SYMMETRIC KEY UserKey
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE UserCert;
    PRINT 'Symmetric Key UserKey created successfully.';
END
GO

-- Create Stored procedure for inserting data into Organization table
CREATE PROCEDURE InsertOrganization
    @org_id INT,
    @org_name VARCHAR(255),
    @org_admin_email NVARCHAR(400),
    @message VARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @encryptionKey NVARCHAR(128);
    SET @encryptionKey = N'DreamBig@123'; -- Ensure passphrase is prefixed with N for Unicode support

    BEGIN TRY
        DECLARE @encryptedEmail VARBINARY(MAX);

        -- Encrypt the admin email
        IF @org_admin_email IS NOT NULL
        BEGIN
            OPEN SYMMETRIC KEY OrgKey
            DECRYPTION BY CERTIFICATE OrgCert;
            SET @encryptedEmail = ENCRYPTBYKEY(KEY_GUID('OrgKey'), convert(varbinary,@org_admin_email));
            CLOSE SYMMETRIC KEY OrgKey;
        END

        -- Insert encrypted email into Organization table
        INSERT INTO Organization (org_id, org_name, org_admin_email)
        VALUES (@org_id, @org_name, @encryptedEmail);

        SET @message = CONCAT('Organization "', @org_name, '" (ID: ', @org_id, ') inserted successfully.');
    END TRY
    BEGIN CATCH
        SET @message = 'Error inserting into Organization table: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


-- Create Stored procedure for inserting data into User table
CREATE OR ALTER PROCEDURE InsertUser
    @user_id INT,
    @user_first_name VARCHAR(255),
    @user_last_name VARCHAR(255),
    @user_email VARCHAR(255),
    @org_id INT,
    @message VARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        DECLARE @encryptedEmail VARBINARY(MAX);

        -- Encrypt the message text
        IF @user_email IS NOT NULL
        BEGIN
            OPEN SYMMETRIC KEY UserKey
            DECRYPTION BY CERTIFICATE UserCert;
            SET @encryptedEmail = ENCRYPTBYKEY(KEY_GUID('UserKey'), @user_email);
            CLOSE SYMMETRIC KEY UserKey;
        END

        -- Insert the user into the Users table
        INSERT INTO Users (user_id, user_first_name, user_last_name, user_email, org_id)
        VALUES (@user_id, @user_first_name, @user_last_name, @EncryptedEmail, @org_id);

        SET @message = CONCAT('User with ID ', @user_id, ' inserted successfully.');
    END TRY
    BEGIN CATCH
        SET @message = 'Error inserting user: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

-- Create procedure to insert data into AddTeamMember table
CREATE OR ALTER PROCEDURE AddTeamMember
    @team_id INT,
    @user_id INT,
    @joining_date DATE,
    @role VARCHAR(255),
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        -- Check if the user is a member of the same organization as the team
        IF EXISTS (SELECT 1 FROM Users U INNER JOIN Teams T ON U.org_id = T.org_id WHERE T.team_id = @team_id AND U.user_id = @user_id)
        BEGIN
            -- Insert member into TeamMembers table
            INSERT INTO TeamMembers (team_id, user_id, joining_date, role)
            VALUES (@team_id, @user_id, @joining_date, @role);

            SET @message = 'Team member added successfully.';
        END
        ELSE
        BEGIN
            SET @message = 'Error: User does not belong to the same organization as the team.';
        END
    END TRY
    BEGIN CATCH
        SET @message = 'Error adding team member: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

-- Create procedure to insert data into AddChannelMember table
CREATE OR ALTER PROCEDURE AddChannelMember
    @channel_id INT,
    @user_id INT,
    @joining_date DATE,
    @role VARCHAR(255),
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Teams AS t
        INNER JOIN Channels AS c ON t.team_id = c.team_id
        INNER JOIN Users AS u ON t.org_id = u.org_id
        WHERE c.channel_id = @channel_id
            AND u.user_id = @user_id
    )
    BEGIN
        BEGIN TRY
            INSERT INTO ChannelMembers (channel_id, user_id, joining_date, role)
            VALUES (@channel_id, @user_id, @joining_date, @role);
            SET @message = 'Channel member added successfully.';
        END TRY
        BEGIN CATCH
            SET @message = 'Error adding channel member: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE
    BEGIN
        SET @message = 'Error: User does not belong to the team associated with the channel.';
    END
END;
GO


-- Create Stored procedure for inserting data into Messages table
CREATE OR ALTER PROCEDURE InsertMessage
    @message_id INT,
    @user_id INT,
    @channel_id INT,
    @message_text NVARCHAR(MAX),
    @creation_date DATE,
    @last_modified_date DATE,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        DECLARE @encryptedMessage VARBINARY(MAX);

        -- Check if the user is a member of the channel
        IF EXISTS (SELECT 1 FROM ChannelMembers WHERE channel_id = @channel_id AND user_id = @user_id)
        BEGIN
            -- Encrypt the message text
            IF @message_text IS NOT NULL
            BEGIN
                OPEN SYMMETRIC KEY MessageKey
                DECRYPTION BY CERTIFICATE MessageCert;
                SET @encryptedMessage = ENCRYPTBYKEY(KEY_GUID('MessageKey'), @message_text);
                CLOSE SYMMETRIC KEY MessageKey;
            END

            -- Insert encrypted message into Messages table
            INSERT INTO Messages (message_id, user_id, channel_id, message_text, creation_date, last_modified_date)
            VALUES (@message_id, @user_id, @channel_id, @encryptedMessage, @creation_date, @last_modified_date);

            SET @message = CONCAT('Message with ID ', @message_id, ' inserted successfully.');
        END
        ELSE
        BEGIN
            SET @message = 'Error: The user is not a member of the specified channel.';
        END
    END TRY
    BEGIN CATCH
        SET @message = 'Error inserting message: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

-- Create procedure to insert data into Reactions table
CREATE OR ALTER PROCEDURE InsertReaction
    @reaction_id INT,
    @message_id INT,
    @user_id INT,
    @reaction_type VARCHAR(255),
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        -- Check if the user is a member of the channel associated with the message
        IF EXISTS (SELECT 1 FROM ChannelMembers CM INNER JOIN Messages M ON CM.channel_id = M.channel_id WHERE M.message_id = @message_id AND CM.user_id = @user_id)
        BEGIN
            -- Insert reaction into Reactions table
            INSERT INTO Reactions (reaction_id, message_id, user_id, reaction_type)
            VALUES (@reaction_id, @message_id, @user_id, @reaction_type);

            SET @message = 'Reaction added successfully.';
        END
        ELSE
        BEGIN
            SET @message = 'Error: User is not a member of the channel for the specified message.';
        END
    END TRY
    BEGIN CATCH
        SET @message = 'Error inserting reaction: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

-- Create procedure to insert data into InsertFile table
CREATE OR ALTER PROCEDURE InsertFile
    @file_id INT,
    @channel_id INT,
    @user_id INT,
    @file_name VARCHAR(255),
    @file_size INT,
    @upload_date DATE,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM ChannelMembers WHERE channel_id = @channel_id AND user_id = @user_id)
    BEGIN
        BEGIN TRY
            INSERT INTO Files (file_id, channel_id, user_id, file_name, file_size, upload_date)
            VALUES (@file_id, @channel_id, @user_id, @file_name, @file_size, @upload_date);
            SET @message = 'File inserted successfully.';
        END TRY
        BEGIN CATCH
            SET @message = 'Error inserting file: ' + ERROR_MESSAGE();
        END CATCH
    END
    ELSE
    BEGIN
        SET @message = 'Error: User is not a member of the specified channel.';
    END
END;
GO


SELECT 
    name AS KeyName,
    symmetric_key_id AS KeyID,
    key_length AS KeyLength,
    algorithm_desc AS KeyAlgorithm
FROM 
    sys.symmetric_keys;

SELECT name AS CertificateName,
       certificate_id AS CertificateID,
       principal_id AS PrincipalID,
       pvt_key_encryption_type_desc AS EncryptionType
FROM sys.certificates;

SELECT OBJECT_SCHEMA_NAME(object_id) AS SchemaName,
       name AS ProcedureName,
       create_date AS CreateDate,
       modify_date AS ModifyDate
FROM sys.procedures;
