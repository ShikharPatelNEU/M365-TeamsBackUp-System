USE teams;
GO

-- Create Audit table for Messages
CREATE TABLE OldMessages (
    old_message_id INT PRIMARY KEY IDENTITY(1,1),
    message_id INT,
    old_text_message NVARCHAR(MAX),
    change_date DATETIME,
    type_of_action NVARCHAR(50)
);

-- Create Audit table for TeamSettings
CREATE TABLE OldTeamSettings (
    old_team_settings_id INT PRIMARY KEY IDENTITY(1,1),
    team_settings_id INT,
    old_allow_create_update_channels BIT,
    old_allow_create_private_channels BIT,
    old_allow_delete_channels BIT,
    old_allow_user_edit_messages BIT,
    old_allow_user_delete_messages BIT,
    change_date DATETIME,
    type_of_action NVARCHAR(50)
);
GO

-- Trigger for updating Messages
CREATE OR ALTER TRIGGER tr_MessageUpdateAudit
ON dbo.Messages
AFTER UPDATE
AS
BEGIN
    INSERT INTO OldMessages (message_id, old_text_message, change_date, type_of_action)
    SELECT d.message_id, d.message_text, GETDATE(), 'UPDATE'
    FROM deleted d
    JOIN inserted i ON d.message_id = i.message_id;
END;
GO

-- Trigger for deleting Messages
CREATE OR ALTER TRIGGER tr_MessageDeleteAudit
ON dbo.Messages
AFTER DELETE
AS
BEGIN
    INSERT INTO OldMessages (message_id, old_text_message, change_date, type_of_action)
    SELECT d.message_id, d.message_text, GETDATE(), 'DELETE'
    FROM deleted d;
END;
GO

-- Trigger for updating TeamSettings
CREATE OR ALTER TRIGGER tr_TeamSettingsUpdateAudit
ON dbo.TeamSettings
AFTER UPDATE
AS
BEGIN
    INSERT INTO OldTeamSettings (team_settings_id, old_allow_create_update_channels, old_allow_create_private_channels, old_allow_delete_channels, old_allow_user_edit_messages, old_allow_user_delete_messages, change_date, type_of_action)
    SELECT d.team_settings_id, d.allow_create_update_channels, d.allow_create_private_channels, d.allow_delete_channels, d.allow_user_edit_messages, d.allow_user_delete_messages, GETDATE(), 'UPDATE'
    FROM deleted d
    JOIN inserted i ON d.team_settings_id = i.team_settings_id;
END;
GO

-- Trigger for deleting TeamSettings
CREATE OR ALTER TRIGGER tr_TeamSettingsDeleteAudit
ON dbo.TeamSettings
AFTER DELETE
AS
BEGIN
    INSERT INTO OldTeamSettings (team_settings_id, old_allow_create_update_channels, old_allow_create_private_channels, old_allow_delete_channels, old_allow_user_edit_messages, old_allow_user_delete_messages, change_date, type_of_action)
    SELECT d.team_settings_id, d.allow_create_update_channels, d.allow_create_private_channels, d.allow_delete_channels, d.allow_user_edit_messages, d.allow_user_delete_messages, GETDATE(), 'DELETE'
    FROM deleted d;
END;
GO


-- delete from messages where message_id = 2;

-- select * from messages where message_id = 35;

-- select * from OldMessages;

-- DECLARE @message NVARCHAR(255)
-- EXEC UpdateMessage 1,1, 'hey bro', '2022-02-25', @message OUTPUT;
-- PRINT @message
