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
        PRINT 'Decrypted Message:';
        PRINT @decryptedMessage;
    END
    ELSE
    BEGIN
        PRINT 'Message not found for the given message ID.';
    END
END;
GO

-- EXEC DecryptMessageByID 3
-- DECLARE @message NVARCHAR(255)
-- EXEC UpdateMessage 1,1, 'hey bro', '2022-02-25', @message OUTPUT;
-- PRINT @message

GO

-- EXEC ChannelMessageCount 1;
-- EXEC ChannelFileStats 5;
-- EXEC PendingStorageForOrg 1;

-- drop PROCEDURE PendingStorageForOrg;

SELECT OBJECT_SCHEMA_NAME(object_id) AS SchemaName,
       name AS ProcedureName,
       create_date AS CreateDate,
       modify_date AS ModifyDate
FROM sys.procedures;