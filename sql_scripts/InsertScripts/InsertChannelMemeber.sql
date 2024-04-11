USE teams;
GO

DECLARE @message NVARCHAR(255);

-- Organisation 1 Channel Members
EXEC AddChannelMember 1, 1, '2022-01-15', 'Member', @message OUTPUT;
EXEC AddChannelMember 1, 2, '2022-01-15', 'Member', @message OUTPUT;
EXEC AddChannelMember 2, 1, '2022-01-20', 'Owner', @message OUTPUT;
EXEC AddChannelMember 2, 2, '2022-01-20', 'Member', @message OUTPUT;

EXEC AddChannelMember 3, 3, '2022-02-20', 'Member', @message OUTPUT;
EXEC AddChannelMember 3, 4, '2022-02-20', 'Member', @message OUTPUT;
EXEC AddChannelMember 4, 3, '2022-02-25', 'Owner', @message OUTPUT;
EXEC AddChannelMember 4, 4, '2022-02-25', 'Member', @message OUTPUT;

EXEC AddChannelMember 5, 4, '2022-03-25', 'Member', @message OUTPUT;
EXEC AddChannelMember 5, 5, '2022-03-25', 'Member', @message OUTPUT;
EXEC AddChannelMember 6, 4, '2022-03-30', 'Owner', @message OUTPUT;
EXEC AddChannelMember 6, 5, '2022-03-30', 'Member', @message OUTPUT;

-- Organisation 2 Channel Members
EXEC AddChannelMember 7, 6, '2022-04-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 7, 7, '2022-04-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 8, 6, '2022-05-05', 'Owner', @message OUTPUT;
EXEC AddChannelMember 8, 7, '2022-05-05', 'Member', @message OUTPUT;

EXEC AddChannelMember 9, 8, '2022-06-10', 'Member', @message OUTPUT;
EXEC AddChannelMember 9, 9, '2022-06-10', 'Member', @message OUTPUT;
EXEC AddChannelMember 10, 8, '2022-07-15', 'Owner', @message OUTPUT;
EXEC AddChannelMember 10, 9, '2022-07-15', 'Member', @message OUTPUT;

EXEC AddChannelMember 11, 9, '2022-08-20', 'Member', @message OUTPUT;
EXEC AddChannelMember 11, 10, '2022-08-20', 'Member', @message OUTPUT;
EXEC AddChannelMember 12, 9, '2022-09-25', 'Owner', @message OUTPUT;
EXEC AddChannelMember 12, 10, '2022-09-25', 'Member', @message OUTPUT;

-- Organisation 3 Channel Members
EXEC AddChannelMember 13, 11, '2022-10-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 13, 12, '2022-10-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 14, 11, '2022-11-30', 'Owner', @message OUTPUT;
EXEC AddChannelMember 14, 12, '2022-11-30', 'Member', @message OUTPUT;

EXEC AddChannelMember 15, 13, '2022-12-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 15, 14, '2022-12-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 16, 13, '2023-01-30', 'Owner', @message OUTPUT;
EXEC AddChannelMember 16, 14, '2023-01-30', 'Member', @message OUTPUT;

EXEC AddChannelMember 17, 14, '2023-02-28', 'Member', @message OUTPUT;
EXEC AddChannelMember 17, 15, '2023-02-28', 'Member', @message OUTPUT;
EXEC AddChannelMember 18, 14, '2023-03-31', 'Owner', @message OUTPUT;
EXEC AddChannelMember 18, 15, '2023-03-31', 'Member', @message OUTPUT;

-- Organisation 4 Channel Members
EXEC AddChannelMember 19, 16, '2023-04-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 19, 17, '2023-04-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 20, 16, '2023-05-31', 'Owner', @message OUTPUT;
EXEC AddChannelMember 20, 17, '2023-05-31', 'Member', @message OUTPUT;

EXEC AddChannelMember 21, 18, '2023-06-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 21, 19, '2023-06-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 22, 18, '2023-07-31', 'Owner', @message OUTPUT;
EXEC AddChannelMember 22, 19, '2023-07-31', 'Member', @message OUTPUT;

EXEC AddChannelMember 23, 19, '2023-08-31', 'Member', @message OUTPUT;
EXEC AddChannelMember 23, 20, '2023-08-31', 'Member', @message OUTPUT;
EXEC AddChannelMember 24, 19, '2023-09-30', 'Owner', @message OUTPUT;
EXEC AddChannelMember 24, 20, '2023-09-30', 'Member', @message OUTPUT;

-- Organisation 5 Channel Members
EXEC AddChannelMember 25, 21, '2023-10-01', 'Member', @message OUTPUT;
EXEC AddChannelMember 25, 22, '2023-10-02', 'Member', @message OUTPUT;
EXEC AddChannelMember 26, 21, '2023-11-03', 'Owner', @message OUTPUT;
EXEC AddChannelMember 26, 22, '2023-11-04', 'Member', @message OUTPUT;

EXEC AddChannelMember 27, 23, '2023-12-05', 'Member', @message OUTPUT;
EXEC AddChannelMember 27, 24, '2023-12-06', 'Member', @message OUTPUT;
EXEC AddChannelMember 28, 23, '2024-01-07', 'Owner', @message OUTPUT;
EXEC AddChannelMember 28, 24, '2024-01-08', 'Member', @message OUTPUT;

EXEC AddChannelMember 29, 24, '2024-02-09', 'Member', @message OUTPUT;
EXEC AddChannelMember 29, 25, '2024-02-10', 'Member', @message OUTPUT;
EXEC AddChannelMember 30, 24, '2024-03-11', 'Owner', @message OUTPUT;
EXEC AddChannelMember 30, 25, '2024-03-12', 'Member', @message OUTPUT;

-- Organisation 6 Channel Members
EXEC AddChannelMember 31, 26, '2024-04-01', 'Member', @message OUTPUT;
EXEC AddChannelMember 31, 27, '2024-04-02', 'Member', @message OUTPUT;
EXEC AddChannelMember 32, 26, '2024-04-03', 'Owner', @message OUTPUT;
EXEC AddChannelMember 32, 27, '2024-04-04', 'Member', @message OUTPUT;

EXEC AddChannelMember 33, 28, '2024-04-05', 'Member', @message OUTPUT;
EXEC AddChannelMember 33, 29, '2024-04-06', 'Member', @message OUTPUT;
EXEC AddChannelMember 34, 28, '2024-04-07', 'Owner', @message OUTPUT;
EXEC AddChannelMember 34, 29, '2024-03-08', 'Member', @message OUTPUT;

EXEC AddChannelMember 35, 29, '2024-03-09', 'Member', @message OUTPUT;
EXEC AddChannelMember 35, 30, '2024-03-10', 'Member', @message OUTPUT;
EXEC AddChannelMember 36, 29, '2024-03-11', 'Owner', @message OUTPUT;
EXEC AddChannelMember 36, 30, '2024-03-12', 'Member', @message OUTPUT;


-- Organisation 7 Channel Members
EXEC AddChannelMember 37, 31, '2023-10-15', 'Member', @message OUTPUT;
EXEC AddChannelMember 37, 32, '2023-10-16', 'Member', @message OUTPUT;
EXEC AddChannelMember 38, 31, '2023-11-17', 'Owner', @message OUTPUT;
EXEC AddChannelMember 38, 32, '2023-11-18', 'Member', @message OUTPUT;

EXEC AddChannelMember 39, 33, '2023-12-19', 'Member', @message OUTPUT;
EXEC AddChannelMember 39, 34, '2023-12-20', 'Member', @message OUTPUT;
EXEC AddChannelMember 40, 33, '2024-01-21', 'Owner', @message OUTPUT;
EXEC AddChannelMember 40, 34, '2024-01-22', 'Member', @message OUTPUT;

EXEC AddChannelMember 41, 34, '2024-02-23', 'Member', @message OUTPUT;
EXEC AddChannelMember 41, 35, '2024-02-24', 'Member', @message OUTPUT;
EXEC AddChannelMember 42, 34, '2024-03-25', 'Owner', @message OUTPUT;
EXEC AddChannelMember 42, 35, '2024-03-26', 'Member', @message OUTPUT;

-- Organisation 8 Channel Members
EXEC AddChannelMember 43, 36, '2024-04-27', 'Member', @message OUTPUT;
EXEC AddChannelMember 43, 37, '2024-04-28', 'Member', @message OUTPUT;
EXEC AddChannelMember 44, 36, '2024-05-29', 'Owner', @message OUTPUT;
EXEC AddChannelMember 44, 37, '2024-05-30', 'Member', @message OUTPUT;

EXEC AddChannelMember 45, 38, '2024-06-11', 'Member', @message OUTPUT;
EXEC AddChannelMember 45, 39, '2024-06-12', 'Member', @message OUTPUT;
EXEC AddChannelMember 46, 38, '2024-07-13', 'Owner', @message OUTPUT;
EXEC AddChannelMember 46, 39, '2024-07-14', 'Member', @message OUTPUT;

EXEC AddChannelMember 47, 39, '2024-08-15', 'Member', @message OUTPUT;
EXEC AddChannelMember 47, 40, '2024-08-16', 'Member', @message OUTPUT;
EXEC AddChannelMember 48, 39, '2024-09-17', 'Owner', @message OUTPUT;
EXEC AddChannelMember 48, 40, '2024-09-18', 'Member', @message OUTPUT;


-- Organisation 9 Channel Members
EXEC AddChannelMember 49, 41, '2024-10-31', 'Member', @message OUTPUT;
EXEC AddChannelMember 49, 42, '2024-10-31', 'Member', @message OUTPUT;
EXEC AddChannelMember 50, 41, '2024-11-30', 'Owner', @message OUTPUT;
EXEC AddChannelMember 50, 42, '2024-11-30', 'Member', @message OUTPUT;

EXEC AddChannelMember 51, 43, '2024-12-31', 'Member', @message OUTPUT;
EXEC AddChannelMember 51, 44, '2024-12-31', 'Member', @message OUTPUT;
EXEC AddChannelMember 52, 43, '2024-10-31', 'Owner', @message OUTPUT;
EXEC AddChannelMember 52, 44, '2024-10-31', 'Member', @message OUTPUT;

EXEC AddChannelMember 53, 44, '2024-11-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 53, 45, '2024-11-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 54, 44, '2024-12-31', 'Owner', @message OUTPUT;
EXEC AddChannelMember 54, 45, '2024-12-31', 'Member', @message OUTPUT;

-- Organisation 10 Channel Members
EXEC AddChannelMember 55, 46, '2024-04-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 55, 47, '2024-04-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 56, 46, '2024-05-31', 'Owner', @message OUTPUT;
EXEC AddChannelMember 56, 47, '2024-05-31', 'Member', @message OUTPUT;

EXEC AddChannelMember 57, 48, '2024-06-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 57, 49, '2024-06-30', 'Member', @message OUTPUT;
EXEC AddChannelMember 58, 48, '2024-07-31', 'Owner', @message OUTPUT;
EXEC AddChannelMember 58, 49, '2024-07-31', 'Member', @message OUTPUT;

EXEC AddChannelMember 59, 49, '2024-08-31', 'Member', @message OUTPUT;
EXEC AddChannelMember 59, 50, '2024-08-31', 'Member', @message OUTPUT;
EXEC AddChannelMember 60, 49, '2024-09-30', 'Owner', @message OUTPUT;
EXEC AddChannelMember 60, 50, '2024-09-30', 'Member', @message OUTPUT;

-- SELECT * FROM ChannelMembers;