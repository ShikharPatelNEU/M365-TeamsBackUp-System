USE teams;
GO

CREATE PROCEDURE ChannelMessageCount
    @org_id INT
AS
BEGIN
    SELECT 
        c.channel_id,
        c.channel_name,
        COUNT(m.message_id) AS message_count
    FROM 
        Channels c
    LEFT JOIN 
        Messages m ON c.channel_id = m.channel_id
    INNER JOIN 
        Teams t ON c.team_id = t.team_id
    WHERE 
        t.org_id = @org_id
    GROUP BY 
        c.channel_id,
        c.channel_name;
END;
GO

CREATE PROCEDURE ChannelFileStats
    @org_id INT
AS
BEGIN
    SELECT 
        c.channel_id,
        c.channel_name,
        COALESCE(COUNT(f.file_id), 0) AS file_count,
        COALESCE(SUM(f.file_size) / 1024, 0) AS total_file_size_MB
    FROM 
        Channels c
    LEFT JOIN 
        Files f ON c.channel_id = f.channel_id
    INNER JOIN 
        Teams t ON c.team_id = t.team_id
    WHERE 
        t.org_id = @org_id
    GROUP BY 
        c.channel_id,
        c.channel_name;
END;
GO

CREATE PROCEDURE PendingStorageForOrg
    @org_id INT
AS
BEGIN
    DECLARE @org_storage_limit INT;
    DECLARE @org_used_storage INT;

    -- Calculate organization's storage limit based on their plan
    SELECT @org_storage_limit = ISNULL(SUM(sp.storage_limit), 0)
    FROM OrgPlan_Map opm
    INNER JOIN SubscriptionPlan sp ON opm.plan_id = sp.plan_id
    WHERE opm.org_id = @org_id;

    -- Calculate organization's used storage
    SELECT @org_used_storage = ISNULL(SUM(f.file_size)/ (1024), 0)
    FROM Files f
    INNER JOIN Channels c ON f.channel_id = c.channel_id
    INNER JOIN Teams t ON c.team_id = t.team_id
    WHERE t.org_id = @org_id;

    -- Calculate pending storage
    DECLARE @pending_storage INT;
    SET @pending_storage = (@org_storage_limit*1024) - @org_used_storage;

    -- Return pending storage
    SELECT
        @org_id AS org_id, 
        @org_storage_limit AS org_storage_limit_GB,
        @org_used_storage AS org_used_storage_MB,
        CASE 
            WHEN @pending_storage < 0 THEN 0
            ELSE @pending_storage
        END AS pending_storage_MB;
END;
GO

-- Create Stored procedure for updating data in the Messages table
CREATE OR ALTER PROCEDURE UpdateMessage
    @message_id INT,
    @user_id INT,
    @new_message_text NVARCHAR(MAX),
    @last_modified_date DATE,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        DECLARE @encryptedMessage VARBINARY(MAX);

        -- Check if the user has permission to update the message
        IF EXISTS (SELECT 1 FROM Messages WHERE message_id = @message_id AND user_id = @user_id)
        BEGIN
            -- Encrypt the new message text
            IF @new_message_text IS NOT NULL
            BEGIN
                OPEN SYMMETRIC KEY MessageKey
                DECRYPTION BY CERTIFICATE MessageCert;
                SET @encryptedMessage = ENCRYPTBYKEY(KEY_GUID('MessageKey'), @new_message_text);
                CLOSE SYMMETRIC KEY MessageKey;
            END

            -- Update message text and last modified date
            UPDATE Messages
            SET message_text = @encryptedMessage,
                last_modified_date = @last_modified_date
            WHERE message_id = @message_id;

            SET @message = CONCAT('Message with ID ', @message_id, ' updated successfully.');
        END
        ELSE
        BEGIN
            SET @message = 'Error: You do not have permission to update this message.';
        END
    END TRY
    BEGIN CATCH
        SET @message = 'Error updating message: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

CREATE PROCEDURE DecryptMessageByID
    @message_id INT
AS
BEGIN
    -- Declare a variable to hold the decrypted message
    DECLARE @decryptedMessage NVARCHAR(MAX);
    
    -- Open the symmetric key for decryption
    OPEN SYMMETRIC KEY MessageKey
    DECRYPTION BY CERTIFICATE MessageCert;

    -- Decrypt the message
    SELECT @decryptedMessage = CONVERT(NVARCHAR(MAX), DECRYPTBYKEY(message_text))
    FROM Messages
    WHERE message_id = @message_id;

    -- Close the symmetric key
    CLOSE SYMMETRIC KEY MessageKey;

    -- Output the decrypted message
    IF @decryptedMessage IS NOT NULL
    BEGIN
        -- Return the decrypted message as a result set
        SELECT @decryptedMessage AS DecryptedMessage;
    END
    ELSE
    BEGIN
        -- If message not found, return a message
        SELECT '' AS DecryptedMessage;
    END
END;

GO

-- DROP PROCEDURE DecryptMessageByID;

GO

-- DECLARE @message_id INT = 10;
-- EXEC DecryptMessageByID @message_id;

GO

-- EXEC ChannelMessageCount 1;
-- EXEC ChannelFileStats 5;
-- EXEC PendingStorageForOrg 1;

-- drop PROCEDURE PendingStorageForOrg;
GO

-- drop procedure DecryptOrganizationEmailByID;
GO

CREATE PROCEDURE DecryptOrganizationEmailByID
    @org_id INT
AS
BEGIN
    DECLARE @decryptedEmail VARCHAR(4000);
    
    -- Open the symmetric key for decryption
    OPEN SYMMETRIC KEY OrgKey
    DECRYPTION BY CERTIFICATE OrgCert;

    -- Decrypt the organization email
    SELECT @decryptedEmail = CONVERT(VARCHAR(4000), DECRYPTBYKEY(org_admin_email))
    FROM Organization
    WHERE org_id = @org_id;

    -- Close the symmetric key
    CLOSE SYMMETRIC KEY OrgKey;

    -- Return the decrypted email
    IF @decryptedEmail IS NOT NULL
    BEGIN
        SELECT @decryptedEmail AS DecryptedEmail;
    END
    ELSE
    BEGIN
        SELECT 'No email' AS DecryptedEmail;
    END
END;
GO

-- DECLARE @org_id INT = 1; 
-- EXEC DecryptOrganizationEmailByID @org_id;

GO

CREATE PROCEDURE DecryptUserEmailByID
    @user_id INT
AS
BEGIN
    -- Declare a variable to hold the decrypted email
    DECLARE @decryptedEmail VARCHAR(4000);
    
    -- Open the symmetric key for decryption
    OPEN SYMMETRIC KEY UserKey
    DECRYPTION BY CERTIFICATE UserCert;

    -- Decrypt the user email
    SELECT @decryptedEmail = CONVERT(VARCHAR(4000), DECRYPTBYKEY(user_email))
    FROM Users
    WHERE user_id = @user_id;

    -- Close the symmetric key
    CLOSE SYMMETRIC KEY UserKey;

    -- Output the decrypted email
    IF @decryptedEmail IS NOT NULL
    BEGIN
        -- Return the decrypted email as a result set
        SELECT @decryptedEmail AS DecryptedEmail;
    END
    ELSE
    BEGIN
        -- If no email found, return a message
        SELECT 'No email.' AS DecryptedEmail;
    END
END;

GO

-- DECLARE @user_id INT = 10;
-- EXEC DecryptUserEmailByID @user_id;

GO
-- DROP procedure DecryptUserEmailByID;
GO

SELECT OBJECT_SCHEMA_NAME(object_id) AS SchemaName,
       name AS ProcedureName,
       create_date AS CreateDate,
       modify_date AS ModifyDate
FROM sys.procedures;