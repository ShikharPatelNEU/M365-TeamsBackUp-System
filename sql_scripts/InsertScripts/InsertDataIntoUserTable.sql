USE teams;
GO

DECLARE @output_message VARCHAR(255);

-- Organization 1 Users
EXEC InsertUser @user_id = 1, @user_first_name = 'Ella', @user_last_name = 'Henderson', @user_email = 'ella.henderson@example.com', @org_id = 1, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 2, @user_first_name = 'Oliver', @user_last_name = 'Smith', @user_email = 'oliver.smith@example.com', @org_id = 1, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 3, @user_first_name = 'Ava', @user_last_name = 'Davis', @user_email = 'ava.davis@example.com', @org_id = 1, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 4, @user_first_name = 'Liam', @user_last_name = 'Brown', @user_email = 'liam.brown@example.com', @org_id = 1, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 5, @user_first_name = 'Mia', @user_last_name = 'Johnson', @user_email = 'mia.johnson@example.com', @org_id = 1, @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 2 Users
EXEC InsertUser @user_id = 6, @user_first_name = 'Noah', @user_last_name = 'Miller', @user_email = 'noah.miller@example.com', @org_id = 2, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 7, @user_first_name = 'Zoe', @user_last_name = 'Taylor', @user_email = 'zoe.taylor@example.com', @org_id = 2, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 8, @user_first_name = 'Ethan', @user_last_name = 'Anderson', @user_email = 'ethan.anderson@example.com', @org_id = 2, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 9, @user_first_name = 'Sophia', @user_last_name = 'Thomas', @user_email = 'sophia.thomas@example.com', @org_id = 2, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 10, @user_first_name = 'Jacob', @user_last_name = 'Moore', @user_email = 'jacob.moore@example.com', @org_id = 2, @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 3 Users
EXEC InsertUser @user_id = 11, @user_first_name = 'Emily', @user_last_name = 'Jackson', @user_email = 'emily.jackson@example.com', @org_id = 3, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 12, @user_first_name = 'Daniel', @user_last_name = 'Martin', @user_email = 'daniel.martin@example.com', @org_id = 3, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 13, @user_first_name = 'Isabella', @user_last_name = 'Garcia', @user_email = 'isabella.garcia@example.com', @org_id = 3, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 14, @user_first_name = 'Michael', @user_last_name = 'Lee', @user_email = 'michael.lee@example.com', @org_id = 3, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 15, @user_first_name = 'Grace', @user_last_name = 'Harris', @user_email = 'grace.harris@example.com', @org_id = 3, @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 4 Users
EXEC InsertUser @user_id = 16, @user_first_name = 'Lucas', @user_last_name = 'Clark', @user_email = 'lucas.clark@example.com', @org_id = 4, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 17, @user_first_name = 'Emma', @user_last_name = 'Robinson', @user_email = 'emma.robinson@example.com', @org_id = 4, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 18, @user_first_name = 'Alexander', @user_last_name = 'Walker', @user_email = 'alexander.walker@example.com', @org_id = 4, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 19, @user_first_name = 'Olivia', @user_last_name = 'Perez', @user_email = 'olivia.perez@example.com', @org_id = 4, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 20, @user_first_name = 'Matthew', @user_last_name = 'Young', @user_email = 'matthew.young@example.com', @org_id = 4, @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 5 Users
EXEC InsertUser @user_id = 21, @user_first_name = 'Nathan', @user_last_name = 'Wright', @user_email = 'nathan.wright@org5.com', @org_id = 5, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 22, @user_first_name = 'Julia', @user_last_name = 'King', @user_email = 'julia.king@org5.com', @org_id = 5, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 23, @user_first_name = 'Samuel', @user_last_name = 'Scott', @user_email = 'samuel.scott@org5.com', @org_id = 5, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 24, @user_first_name = 'Brooke', @user_last_name = 'Green', @user_email = 'brooke.green@org5.com', @org_id = 5, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 25, @user_first_name = 'Gabriel', @user_last_name = 'Adams', @user_email = 'gabriel.adams@org5.com', @org_id = 5, @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 6 Users
EXEC InsertUser @user_id = 26, @user_first_name = 'Sophie', @user_last_name = 'Nelson', @user_email = 'sophie.nelson@org6.com', @org_id = 6, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 27, @user_first_name = 'Dylan', @user_last_name = 'Carter', @user_email = 'dylan.carter@org6.com', @org_id = 6, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 28, @user_first_name = 'Hailey', @user_last_name = 'Mitchell', @user_email = 'hailey.mitchell@org6.com', @org_id = 6, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 29, @user_first_name = 'Evan', @user_last_name = 'Roberts', @user_email = 'evan.roberts@org6.com', @org_id = 6, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 30, @user_first_name = 'Leah', @user_last_name = 'Campbell', @user_email = 'leah.campbell@org6.com', @org_id = 6, @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 7 Users
EXEC InsertUser @user_id = 31, @user_first_name = 'Isaac', @user_last_name = 'Phillips', @user_email = 'isaac.phillips@org7.com', @org_id = 7, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 32, @user_first_name = 'Madeline', @user_last_name = 'Evans', @user_email = 'madeline.evans@org7.com', @org_id = 7, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 33, @user_first_name = 'Joshua', @user_last_name = 'Turner', @user_email = 'joshua.turner@org7.com', @org_id = 7, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 34, @user_first_name = 'Vanessa', @user_last_name = 'Diaz', @user_email = 'vanessa.diaz@org7.com', @org_id = 7, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 35, @user_first_name = 'Brandon', @user_last_name = 'Parker', @user_email = 'brandon.parker@org7.com', @org_id = 7, @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 8 Users
EXEC InsertUser @user_id = 36, @user_first_name = 'Chloe', @user_last_name = 'Edwards', @user_email = 'chloe.edwards@org8.com', @org_id = 8, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 37, @user_first_name = 'Ryan', @user_last_name = 'Collins', @user_email = 'ryan.collins@org8.com', @org_id = 8, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 38, @user_first_name = 'Zoe', @user_last_name = 'Stewart', @user_email = 'zoe.stewart@org8.com', @org_id = 8, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 39, @user_first_name = 'Justin', @user_last_name = 'Morris', @user_email = 'justin.morris@org8.com', @org_id = 8, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 40, @user_first_name = 'Alyssa', @user_last_name = 'Rogers', @user_email = 'alyssa.rogers@org8.com', @org_id = 8, @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 9 Users
EXEC InsertUser @user_id = 41, @user_first_name = 'Cameron', @user_last_name = 'Reed', @user_email = 'cameron.reed@org9.com', @org_id = 9, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 42, @user_first_name = 'Kayla', @user_last_name = 'Cook', @user_email = 'kayla.cook@org9.com', @org_id = 9, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 43, @user_first_name = 'Nathan', @user_last_name = 'Morgan', @user_email = 'nathan.morgan@org9.com', @org_id = 9, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 44, @user_first_name = 'Kaitlyn', @user_last_name = 'Bell', @user_email = 'kaitlyn.bell@org9.com', @org_id = 9, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 45, @user_first_name = 'Jordan', @user_last_name = 'Murphy', @user_email = 'jordan.murphy@org9.com', @org_id = 9, @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 10 Users
EXEC InsertUser @user_id = 46, @user_first_name = 'Lily', @user_last_name = 'Bailey', @user_email = 'lily.bailey@org10.com', @org_id = 10, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 47, @user_first_name = 'Adrian', @user_last_name = 'Rivera', @user_email = 'adrian.rivera@org10.com', @org_id = 10, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 48, @user_first_name = 'Jade', @user_last_name = 'Cooper', @user_email = 'jade.cooper@org10.com', @org_id = 10, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 49, @user_first_name = 'Connor', @user_last_name = 'Richardson', @user_email = 'connor.richardson@org10.com', @org_id = 10, @message = @output_message OUTPUT;
PRINT @output_message;
EXEC InsertUser @user_id = 50, @user_first_name = 'Maya', @user_last_name = 'Cox', @user_email = 'maya.cox@org10.com', @org_id = 10, @message = @output_message OUTPUT;
PRINT @output_message;


-- SELECT * FROM Users;
