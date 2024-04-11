USE teams;
GO


CREATE FUNCTION GetIndexesForDatabase (@dbName NVARCHAR(128))
RETURNS TABLE
AS
RETURN
(
    SELECT 
        OBJECT_SCHEMA_NAME(i.object_id) AS SchemaName,
        OBJECT_NAME(i.object_id) AS TableName,
        i.name AS IndexName,
        i.type_desc AS IndexType,
        i.is_unique AS IsUnique,
        c.name AS ColumnName,
        ic.index_column_id AS ColumnOrder
    FROM 
        sys.indexes i
    INNER JOIN 
        sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
    INNER JOIN 
        sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
    INNER JOIN 
        sys.tables t ON i.object_id = t.object_id
    INNER JOIN 
        sys.schemas s ON t.schema_id = s.schema_id
    WHERE 
        DB_NAME() = @dbName
        AND i.type_desc <> 'HEAP' -- Exclude heaps
);

GO
-- SELECT * FROM GetIndexesForDatabase('teams') ORDER BY SchemaName, TableName, IndexName, ColumnOrder;

GO
CREATE FUNCTION GetTotalMessagesSentByUser (@user_id INT)
RETURNS INT
AS
BEGIN
    DECLARE @totalMessagesSent INT;

    -- Initialize total messages sent to 0
    SET @totalMessagesSent = 0;

    -- Check if the user exists
    IF EXISTS (SELECT 1 FROM Users WHERE user_id = @user_id)
    BEGIN
        -- Retrieve total messages sent by the user
        SELECT @totalMessagesSent = COUNT(*)
        FROM Messages
        WHERE user_id = @user_id;
    END
    ELSE
    BEGIN
        -- User does not exist, set total messages sent to -1 (indicating user not found)
        SET @totalMessagesSent = -1;
    END

    RETURN @totalMessagesSent;
END;

GO

-- DECLARE @user_id INT = 2;

-- DECLARE @totalMessagesSent INT;
-- SET @totalMessagesSent = dbo.GetTotalMessagesSentByUser(@user_id);

-- IF @totalMessagesSent >= 0
-- BEGIN
--     PRINT 'Total messages sent by User ID ' + CAST(@user_id AS VARCHAR) + ': ' + CAST(@totalMessagesSent AS VARCHAR);
-- END
-- ELSE
-- BEGIN
--     PRINT 'User ID ' + CAST(@user_id AS VARCHAR) + ' not found.';
-- END;

GO

CREATE FUNCTION GetTotalReactionsByUser (@user_id INT)
RETURNS INT
AS
BEGIN
    DECLARE @totalReactions INT;

    -- Initialize total reactions to 0
    SET @totalReactions = 0;

    -- Check if the user exists
    IF EXISTS (SELECT 1 FROM Users WHERE user_id = @user_id)
    BEGIN
        -- Retrieve total reactions by the user
        SELECT @totalReactions = COUNT(*)
        FROM Reactions
        WHERE user_id = @user_id;
    END
    ELSE
    BEGIN
        -- User does not exist, set total reactions to -1 (indicating user not found)
        SET @totalReactions = -1;
    END

    RETURN @totalReactions;
END;
GO

-- DECLARE @user_id INT = 1; 

-- DECLARE @totalReactions INT;
-- SET @totalReactions = dbo.GetTotalReactionsByUser(@user_id);

-- IF @totalReactions >= 0
-- BEGIN
--     PRINT 'Total reactions by User ID ' + CAST(@user_id AS VARCHAR) + ': ' + CAST(@totalReactions AS VARCHAR);
-- END
-- ELSE
-- BEGIN
--     PRINT 'User ID ' + CAST(@user_id AS VARCHAR) + ' not found.';
-- END;

GO

CREATE FUNCTION GetTeamWithMaxUsers (@org_id INT)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 1 WITH TIES
           team_id,
           COUNT(user_id) AS total_users
    FROM TeamMembers
    WHERE team_id IN (SELECT team_id FROM Teams WHERE org_id = @org_id)
    GROUP BY team_id
    ORDER BY total_users DESC
);
GO

-- DECLARE @org_id INT = 7; 

-- SELECT *
-- FROM dbo.GetTeamWithMaxUsers(@org_id);

GO

CREATE FUNCTION GetTeamWithMaxChannels (@org_id INT)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 1 WITH TIES
           team_id,
           COUNT(channel_id) AS total_channels
    FROM Channels
    WHERE team_id IN (SELECT team_id FROM Teams WHERE org_id = @org_id)
    GROUP BY team_id
    ORDER BY total_channels DESC
);
GO

-- DECLARE @org_id INT = 7; 

-- SELECT *
-- FROM dbo.GetTeamWithMaxChannels(@org_id);

GO

CREATE FUNCTION GetTeamWithMaxApps (@org_id INT)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 1 WITH TIES
           team_id,
           COUNT(app_id) AS total_apps
    FROM Apps
    WHERE team_id IN (SELECT team_id FROM Teams WHERE org_id = @org_id)
    GROUP BY team_id
    ORDER BY total_apps DESC
);
GO

-- DECLARE @org_id INT = 7; 

-- SELECT *
-- FROM dbo.GetTeamWithMaxApps(@org_id);

GO
-- CREATE FUNCTION GetTeamWithMaxStorageUsed (@org_id INT)
-- RETURNS TABLE
-- AS
-- RETURN
-- (
--     SELECT TOP 1 WITH TIES
--            team_id,
--            SUM(file_size)/1024 AS total_storage_used_in_MB
--     FROM Files
--     WHERE channel_id IN (SELECT channel_id FROM Channels WHERE team_id IN (SELECT team_id FROM Teams WHERE org_id = @org_id))
--     GROUP BY team_id
--     ORDER BY total_storage_used_in_MB DESC
-- );
-- GO

-- DECLARE @org_id INT = 7; 

-- SELECT *
-- FROM dbo.GetTeamWithMaxStorageUsed(@org_id);

