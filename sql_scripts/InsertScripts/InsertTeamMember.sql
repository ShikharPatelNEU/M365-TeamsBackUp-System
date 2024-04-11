-- Insert Team Members Data
DECLARE @output_message NVARCHAR(255);

-- Organization 1, Team 1 
EXEC AddTeamMember @team_id = 1, @user_id = 1, @joining_date = '2024-01-02', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 1, @user_id = 2, @joining_date = '2024-01-03', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 1, Team 2 
EXEC AddTeamMember @team_id = 2, @user_id = 3, @joining_date = '2024-01-04', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 2, @user_id = 4, @joining_date = '2024-01-05', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 1, Team 3 
EXEC AddTeamMember @team_id = 3, @user_id = 4, @joining_date = '2024-01-06', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 3, @user_id = 5, @joining_date = '2024-01-07', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 2, Team 4 
EXEC AddTeamMember @team_id = 4, @user_id = 6, @joining_date = '2024-01-08', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 4, @user_id = 7, @joining_date = '2024-01-09', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 2, Team 5 
EXEC AddTeamMember @team_id = 5, @user_id = 8, @joining_date = '2024-01-10', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 5, @user_id = 9, @joining_date = '2024-01-11', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 2, Team 6 
EXEC AddTeamMember @team_id = 6, @user_id = 9, @joining_date = '2024-01-12', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 6, @user_id = 10, @joining_date = '2024-01-13', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 3, Team 7 
EXEC AddTeamMember @team_id = 7, @user_id = 11, @joining_date = '2024-01-14', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 7, @user_id = 12, @joining_date = '2024-01-15', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 3, Team 8 
EXEC AddTeamMember @team_id = 8, @user_id = 13, @joining_date = '2024-01-16', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 8, @user_id = 14, @joining_date = '2024-01-17', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 3, Team 9 
EXEC AddTeamMember @team_id = 9, @user_id = 14, @joining_date = '2024-01-18', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 9, @user_id = 15, @joining_date = '2024-01-19', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 4, Team 10 
EXEC AddTeamMember @team_id = 10, @user_id = 16, @joining_date = '2024-01-20', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 10, @user_id = 17, @joining_date = '2024-01-21', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 4, Team 11 
EXEC AddTeamMember @team_id = 11, @user_id = 18, @joining_date = '2024-01-22', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 11, @user_id = 19, @joining_date = '2024-01-23', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 4, Team 12 
EXEC AddTeamMember @team_id = 12, @user_id = 19, @joining_date = '2024-01-24', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 12, @user_id = 20, @joining_date = '2024-01-25', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 5, Team 13 
EXEC AddTeamMember @team_id = 13, @user_id = 21, @joining_date = '2024-01-26', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 13, @user_id = 22, @joining_date = '2024-01-27', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 5, Team 14
EXEC AddTeamMember @team_id = 14, @user_id = 23, @joining_date = '2024-01-28', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 14, @user_id = 24, @joining_date = '2024-01-29', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 5, Team 15 
EXEC AddTeamMember @team_id = 15, @user_id = 24, @joining_date = '2024-01-30', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 15, @user_id = 25, @joining_date = '2024-01-31', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 6, Team 16 
EXEC AddTeamMember @team_id = 16, @user_id = 26, @joining_date = '2024-02-02', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 16, @user_id = 27, @joining_date = '2024-02-03', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 6, Team 17
EXEC AddTeamMember @team_id = 17, @user_id = 28, @joining_date = '2024-02-04', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 17, @user_id = 29, @joining_date = '2024-02-05', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 6, Team 18 
EXEC AddTeamMember @team_id = 18, @user_id = 29, @joining_date = '2024-02-06', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 18, @user_id = 30, @joining_date = '2024-02-07', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 7, Team 19 
EXEC AddTeamMember @team_id = 19, @user_id = 31, @joining_date = '2024-02-08', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 19, @user_id = 32, @joining_date = '2024-02-09', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 7, Team 20 
EXEC AddTeamMember @team_id = 20, @user_id = 33, @joining_date = '2024-02-10', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 20, @user_id = 34, @joining_date = '2024-02-11', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 7, Team 21 
EXEC AddTeamMember @team_id = 21, @user_id = 34, @joining_date = '2024-02-12', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 21, @user_id = 35, @joining_date = '2024-02-13', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 8, Team 22 
EXEC AddTeamMember @team_id = 22, @user_id = 36, @joining_date = '2024-02-14', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 22, @user_id = 37, @joining_date = '2024-02-15', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 8, Team 23 
EXEC AddTeamMember @team_id = 23, @user_id = 38, @joining_date = '2024-02-16', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 23, @user_id = 39, @joining_date = '2024-02-17', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 8, Team 24 
EXEC AddTeamMember @team_id = 24, @user_id = 39, @joining_date = '2024-02-18', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 24, @user_id = 40, @joining_date = '2024-02-19', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 9, Team 25 
EXEC AddTeamMember @team_id = 25, @user_id = 41, @joining_date = '2024-02-20', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 25, @user_id = 42, @joining_date = '2024-02-21', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 9, Team 26 
EXEC AddTeamMember @team_id = 26, @user_id = 43, @joining_date = '2024-02-22', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 26, @user_id = 44, @joining_date = '2024-02-23', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 9, Team 27 
EXEC AddTeamMember @team_id = 27, @user_id = 44, @joining_date = '2024-02-24', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 27, @user_id = 45, @joining_date = '2024-02-25', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 10, Team 28 
EXEC AddTeamMember @team_id = 28, @user_id = 46, @joining_date = '2024-02-26', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 28, @user_id = 47, @joining_date = '2024-02-27', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 10, Team 29 
EXEC AddTeamMember @team_id = 29, @user_id = 48, @joining_date = '2024-02-28', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 29, @user_id = 49, @joining_date = '2024-03-01', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;

-- Organization 10, Team 30 
EXEC AddTeamMember @team_id = 30, @user_id = 49, @joining_date = '2024-03-02', @role = 'Owner', @message = @output_message OUTPUT;
PRINT @output_message;
EXEC AddTeamMember @team_id = 30, @user_id = 50, @joining_date = '2024-03-02', @role = 'Member', @message = @output_message OUTPUT;
PRINT @output_message;


-- select * from TeamMembers;