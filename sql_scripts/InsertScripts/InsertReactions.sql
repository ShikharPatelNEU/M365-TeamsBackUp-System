USE teams;
GO

DECLARE @message_id INT;
DECLARE @user_id INT;
DECLARE @reaction_type VARCHAR(255);
DECLARE @channel_id INT;
DECLARE @reaction_id INT = 1;
DECLARE @reaction_count INT;
DECLARE @max_reaction_count INT = 3;
DECLARE @min_reaction_count INT = 0;
DECLARE @insert_success BIT;

DECLARE @all_messages TABLE (
    message_id INT
);

-- Store all message IDs
INSERT INTO @all_messages (message_id)
SELECT message_id FROM Messages;

-- Iterate through all messages
DECLARE message_cursor CURSOR FOR
SELECT message_id FROM @all_messages;

OPEN message_cursor;

FETCH NEXT FROM message_cursor INTO @message_id;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Get channel ID of the message
    SET @channel_id = (SELECT channel_id FROM Messages WHERE message_id = @message_id);

    -- Select users who are members of the channel
    DECLARE @channel_users TABLE (
        user_id INT
    );
    INSERT INTO @channel_users (user_id)
    SELECT user_id FROM ChannelMembers WHERE channel_id = @channel_id;

    -- SELECT * FROM @channel_users;

    -- Determine the number of reactions for this message
    SET @reaction_count = CAST(RAND() * (@max_reaction_count - @min_reaction_count + 1) + @min_reaction_count AS INT);

    -- Insert reactions for the message
    WHILE @reaction_count > 0
    BEGIN
        -- Select a random user from the channel
        SET @user_id = (SELECT TOP 1 user_id FROM @channel_users ORDER BY NEWID());
        print @user_id

        -- Select a random reaction type
        SET @reaction_type = (SELECT TOP 1 reaction_type FROM (VALUES ('like'), ('love'), ('haha'), ('wow'), ('sad'), ('angry')) AS ReactionTypes(reaction_type) ORDER BY NEWID());

        -- Insert the reaction using the stored procedure
        DECLARE @message NVARCHAR(255);
        EXEC InsertReaction 
            @reaction_id = @reaction_id, 
            @message_id = @message_id, 
            @user_id = @user_id, 
            @reaction_type = @reaction_type, 
            @message = @message OUTPUT;

        -- Check if the insertion was successful
        IF @message = 'Reaction added successfully.'
        BEGIN
            SET @reaction_id = @reaction_id + 1;
            SET @insert_success = 1;
        END
        ELSE
        BEGIN
            SET @insert_success = 0;
            print @user_id;
            print @message_id;
            PRINT @message; -- Print the error message
        END

        -- Decrement reaction count if insertion was successful
        IF @insert_success = 1
        BEGIN
            SET @reaction_count = @reaction_count - 1;
        END
    END

    DELETE FROM @channel_users;

    FETCH NEXT FROM message_cursor INTO @message_id;
END

CLOSE message_cursor;
DEALLOCATE message_cursor;



-- SELECT * FROM Reactions;
