USE teams;
GO

DECLARE @message NVARCHAR(255);

-- Channel 1
EXEC InsertMessage 1, 1, 1, 'Message 1 from User 1 in Channel 1', '2022-01-15', '2022-01-15', @message OUTPUT;
EXEC InsertMessage 2, 2, 1, 'Message 1 from User 2 in Channel 1', '2022-01-15', '2022-01-15', @message OUTPUT;

-- Channel 2
EXEC InsertMessage 3, 1, 2, 'Message 1 from User 1 in Channel 2', '2022-01-20', '2022-01-20', @message OUTPUT;
EXEC InsertMessage 4, 2, 2, 'Message 1 from User 2 in Channel 2', '2022-01-20', '2022-01-20', @message OUTPUT;

-- Channel 3
EXEC InsertMessage 5, 3, 3, 'Message 1 from User 3 in Channel 3', '2022-02-20', '2022-02-20', @message OUTPUT;
EXEC InsertMessage 6, 4, 3, 'Message 1 from User 4 in Channel 3', '2022-02-20', '2022-02-20', @message OUTPUT;

-- Channel 4
EXEC InsertMessage 7, 3, 4, 'Message 1 from User 3 in Channel 4', '2022-02-25', '2022-02-25', @message OUTPUT;
EXEC InsertMessage 8, 4, 4, 'Message 1 from User 4 in Channel 4', '2022-02-25', '2022-02-25', @message OUTPUT;

-- Channel 5
EXEC InsertMessage 9, 4, 5, 'Message 1 from User 4 in Channel 5', '2022-03-25', '2022-03-25', @message OUTPUT;
EXEC InsertMessage 10, 5, 5, 'Message 1 from User 5 in Channel 5', '2022-03-25', '2022-03-25', @message OUTPUT;

-- Channel 6
EXEC InsertMessage 11, 4, 6, 'Message 1 from User 4 in Channel 6', '2022-03-30', '2022-03-30', @message OUTPUT;
EXEC InsertMessage 12, 5, 6, 'Message 1 from User 5 in Channel 6', '2022-03-30', '2022-03-30', @message OUTPUT;

-- Channel 7
EXEC InsertMessage 13, 6, 7, 'Message 1 from User 6 in Channel 7', '2022-04-30', '2022-04-30', @message OUTPUT;
EXEC InsertMessage 14, 7, 7, 'Message 1 from User 7 in Channel 7', '2022-04-30', '2022-04-30', @message OUTPUT;

-- Channel 8
EXEC InsertMessage 15, 6, 8, 'Message 1 from User 6 in Channel 8', '2022-05-05', '2022-05-05', @message OUTPUT;
EXEC InsertMessage 16, 7, 8, 'Message 1 from User 7 in Channel 8', '2022-05-05', '2022-05-05', @message OUTPUT;

-- Channel 9
EXEC InsertMessage 17, 8, 9, 'Message 1 from User 8 in Channel 9', '2022-06-10', '2022-06-10', @message OUTPUT;
EXEC InsertMessage 18, 9, 9, 'Message 1 from User 9 in Channel 9', '2022-06-10', '2022-06-10', @message OUTPUT;

-- Channel 10
EXEC InsertMessage 19, 8, 10, 'Message 1 from User 8 in Channel 10', '2022-07-15', '2022-07-15', @message OUTPUT;
EXEC InsertMessage 20, 9, 10, 'Message 1 from User 9 in Channel 10', '2022-07-15', '2022-07-15', @message OUTPUT;

-- Channel 11
EXEC InsertMessage 21, 9, 11, 'Message 1 from User 9 in Channel 11', '2022-08-20', '2022-08-20', @message OUTPUT;
EXEC InsertMessage 22, 10, 11, 'Message 1 from User 10 in Channel 11', '2022-08-20', '2022-08-20', @message OUTPUT;

-- Channel 12
EXEC InsertMessage 23, 9, 12, 'Message 1 from User 9 in Channel 12', '2022-09-25', '2022-09-25', @message OUTPUT;
EXEC InsertMessage 24, 10, 12, 'Message 1 from User 10 in Channel 12', '2022-09-25', '2022-09-25', @message OUTPUT;

-- Channel 13
EXEC InsertMessage 25, 11, 13, 'Message 1 from User 11 in Channel 13', '2022-10-30', '2022-10-30', @message OUTPUT;
EXEC InsertMessage 26, 12, 13, 'Message 1 from User 12 in Channel 13', '2022-10-30', '2022-10-30', @message OUTPUT;

-- Channel 14
EXEC InsertMessage 27, 11, 14, 'Message 1 from User 11 in Channel 14', '2022-11-30', '2022-11-30', @message OUTPUT;
EXEC InsertMessage 28, 12, 14, 'Message 1 from User 12 in Channel 14', '2022-11-30', '2022-11-30', @message OUTPUT;

-- Channel 15
EXEC InsertMessage 29, 13, 15, 'Message 1 from User 13 in Channel 15', '2022-12-30', '2022-12-30', @message OUTPUT;
EXEC InsertMessage 30, 14, 15, 'Message 1 from User 14 in Channel 15', '2022-12-30', '2022-12-30', @message OUTPUT;

-- Channel 16
EXEC InsertMessage 31, 13, 16, 'Message 1 from User 13 in Channel 16', '2023-01-30', '2023-01-30', @message OUTPUT;
EXEC InsertMessage 32, 14, 16, 'Message 1 from User 14 in Channel 16', '2023-01-30', '2023-01-30', @message OUTPUT;

-- Channel 17
EXEC InsertMessage 33, 14, 17, 'Message 1 from User 14 in Channel 17', '2023-02-28', '2023-02-28', @message OUTPUT;
EXEC InsertMessage 34, 15, 17, 'Message 1 from User 15 in Channel 17', '2023-02-28', '2023-02-28', @message OUTPUT;

-- Channel 18
EXEC InsertMessage 35, 14, 18, 'Message 1 from User 14 in Channel 18', '2023-03-31', '2023-03-31', @message OUTPUT;
EXEC InsertMessage 36, 15, 18, 'Message 1 from User 15 in Channel 18', '2023-03-31', '2023-03-31', @message OUTPUT;

-- Channel 19
EXEC InsertMessage 37, 16, 19, 'Message 1 from User 16 in Channel 19', '2023-04-30', '2023-04-30', @message OUTPUT;
EXEC InsertMessage 38, 17, 19, 'Message 1 from User 17 in Channel 19', '2023-04-30', '2023-04-30', @message OUTPUT;

-- Channel 20
EXEC InsertMessage 39, 16, 20, 'Message 1 from User 16 in Channel 20', '2023-05-31', '2023-05-31', @message OUTPUT;
EXEC InsertMessage 40, 17, 20, 'Message 1 from User 17 in Channel 20', '2023-05-31', '2023-05-31', @message OUTPUT;

-- Channel 21
EXEC InsertMessage 41, 18, 21, 'Message 1 from User 18 in Channel 21', '2023-06-30', '2023-06-30', @message OUTPUT;
EXEC InsertMessage 42, 19, 21, 'Message 1 from User 19 in Channel 21', '2023-06-30', '2023-06-30', @message OUTPUT;

-- Channel 22
EXEC InsertMessage 43, 18, 22, 'Message 1 from User 18 in Channel 22', '2023-07-31', '2023-07-31', @message OUTPUT;
EXEC InsertMessage 44, 19, 22, 'Message 1 from User 19 in Channel 22', '2023-07-31', '2023-07-31', @message OUTPUT;

-- Channel 23
EXEC InsertMessage 45, 19, 23, 'Message 1 from User 19 in Channel 23', '2023-08-31', '2023-08-31', @message OUTPUT;
EXEC InsertMessage 46, 20, 23, 'Message 1 from User 20 in Channel 23', '2023-08-31', '2023-08-31', @message OUTPUT;

-- Channel 24
EXEC InsertMessage 47, 19, 24, 'Message 1 from User 19 in Channel 24', '2023-09-30', '2023-09-30', @message OUTPUT;
EXEC InsertMessage 48, 20, 24, 'Message 1 from User 20 in Channel 24', '2023-09-30', '2023-09-30', @message OUTPUT;

-- Channel 25
EXEC InsertMessage 49, 21, 25, 'Message 1 from User 21 in Channel 25', '2023-10-01', '2023-10-01', @message OUTPUT;
EXEC InsertMessage 50, 22, 25, 'Message 1 from User 22 in Channel 25', '2023-10-02', '2023-10-02', @message OUTPUT;

-- Channel 26
EXEC InsertMessage 51, 21, 26, 'Message 1 from User 21 in Channel 26', '2023-11-03', '2023-11-03', @message OUTPUT;
EXEC InsertMessage 52, 22, 26, 'Message 1 from User 22 in Channel 26', '2023-11-04', '2023-11-04', @message OUTPUT;

-- Channel 27
EXEC InsertMessage 53, 23, 27, 'Message 1 from User 23 in Channel 27', '2023-12-05', '2023-12-05', @message OUTPUT;
EXEC InsertMessage 54, 24, 27, 'Message 1 from User 24 in Channel 27', '2023-12-06', '2023-12-06', @message OUTPUT;

-- Channel 28
EXEC InsertMessage 55, 23, 28, 'Message 1 from User 23 in Channel 28', '2023-01-07', '2023-01-07', @message OUTPUT;
EXEC InsertMessage 56, 24, 28, 'Message 1 from User 24 in Channel 28', '2023-01-08', '2023-01-08', @message OUTPUT;

-- Channel 29
EXEC InsertMessage 57, 24, 29, 'Message 1 from User 24 in Channel 29', '2023-02-09', '2023-02-09', @message OUTPUT;
EXEC InsertMessage 58, 25, 29, 'Message 1 from User 25 in Channel 29', '2023-02-10', '2023-02-10', @message OUTPUT;

-- Channel 30
EXEC InsertMessage 59, 24, 30, 'Message 1 from User 24 in Channel 30', '2023-03-11', '2023-03-11', @message OUTPUT;
EXEC InsertMessage 60, 25, 30, 'Message 1 from User 25 in Channel 30', '2023-03-12', '2023-03-12', @message OUTPUT;

-- Channel 31
EXEC InsertMessage 61, 26, 31, 'Message 1 from User 26 in Channel 31', '2023-04-01', '2023-04-01', @message OUTPUT;
EXEC InsertMessage 62, 27, 31, 'Message 1 from User 27 in Channel 31', '2023-04-02', '2023-04-02', @message OUTPUT;

-- Channel 32
EXEC InsertMessage 63, 26, 32, 'Message 1 from User 26 in Channel 32', '2023-04-03', '2023-04-03', @message OUTPUT;
EXEC InsertMessage 64, 27, 32, 'Message 1 from User 27 in Channel 32', '2023-04-04', '2023-04-04', @message OUTPUT;

-- Channel 33
EXEC InsertMessage 65, 28, 33, 'Message 1 from User 28 in Channel 33', '2023-04-05', '2023-04-05', @message OUTPUT;
EXEC InsertMessage 66, 29, 33, 'Message 1 from User 29 in Channel 33', '2023-04-06', '2023-04-06', @message OUTPUT;

-- Channel 34
EXEC InsertMessage 67, 28, 34, 'Message 1 from User 28 in Channel 34', '2023-04-07', '2023-04-07', @message OUTPUT;
EXEC InsertMessage 68, 29, 34, 'Message 1 from User 29 in Channel 34', '2023-03-08', '2023-03-08', @message OUTPUT;

-- Channel 35
EXEC InsertMessage 69, 29, 35, 'Message 1 from User 29 in Channel 35', '2023-03-09', '2023-03-09', @message OUTPUT;
EXEC InsertMessage 70, 30, 35, 'Message 1 from User 30 in Channel 35', '2023-03-10', '2023-03-10', @message OUTPUT;

-- Channel 36
EXEC InsertMessage 71, 29, 36, 'Message 1 from User 29 in Channel 36', '2023-03-11', '2023-03-11', @message OUTPUT;
EXEC InsertMessage 72, 30, 36, 'Message 1 from User 30 in Channel 36', '2023-03-12', '2023-03-12', @message OUTPUT;

-- Channel 37
EXEC InsertMessage 73, 31, 37, 'Message 1 from User 31 in Channel 37', '2023-10-15', '2023-10-15', @message OUTPUT;
EXEC InsertMessage 74, 32, 37, 'Message 1 from User 32 in Channel 37', '2023-10-16', '2023-10-16', @message OUTPUT;

-- Channel 38
EXEC InsertMessage 75, 31, 38, 'Message 1 from User 31 in Channel 38', '2023-11-17', '2023-11-17', @message OUTPUT;
EXEC InsertMessage 76, 32, 38, 'Message 1 from User 32 in Channel 38', '2023-11-18', '2023-11-18', @message OUTPUT;

-- Channel 39
EXEC InsertMessage 77, 33, 39, 'Message 1 from User 33 in Channel 39', '2023-12-19', '2023-12-19', @message OUTPUT;
EXEC InsertMessage 78, 34, 39, 'Message 1 from User 34 in Channel 39', '2023-12-20', '2023-12-20', @message OUTPUT;

-- Channel 40
EXEC InsertMessage 79, 33, 40, 'Message 1 from User 33 in Channel 40', '2023-01-21', '2023-01-21', @message OUTPUT;
EXEC InsertMessage 80, 34, 40, 'Message 1 from User 34 in Channel 40', '2023-01-22', '2023-01-22', @message OUTPUT;

-- Channel 41
EXEC InsertMessage 81, 34, 41, 'Message 1 from User 34 in Channel 41', '2023-02-23', '2023-02-23', @message OUTPUT;
EXEC InsertMessage 82, 35, 41, 'Message 1 from User 35 in Channel 41', '2023-02-24', '2023-02-24', @message OUTPUT;

-- Channel 42
EXEC InsertMessage 83, 34, 42, 'Message 1 from User 34 in Channel 42', '2023-03-25', '2023-03-25', @message OUTPUT;
EXEC InsertMessage 84, 35, 42, 'Message 1 from User 35 in Channel 42', '2023-03-26', '2023-03-26', @message OUTPUT;

-- Channel 43
EXEC InsertMessage 85, 36, 43, 'Message 1 from User 36 in Channel 43', '2023-04-27', '2023-04-27', @message OUTPUT;
EXEC InsertMessage 86, 37, 43, 'Message 1 from User 37 in Channel 43', '2023-04-28', '2023-04-28', @message OUTPUT;

-- Channel 44
EXEC InsertMessage 87, 36, 44, 'Message 1 from User 36 in Channel 44', '2023-05-29', '2023-05-29', @message OUTPUT;
EXEC InsertMessage 88, 37, 44, 'Message 1 from User 37 in Channel 44', '2023-05-30', '2023-05-30', @message OUTPUT;

-- Channel 45
EXEC InsertMessage 89, 38, 45, 'Message 1 from User 38 in Channel 45', '2023-06-11', '2023-06-11', @message OUTPUT;
EXEC InsertMessage 90, 39, 45, 'Message 1 from User 39 in Channel 45', '2023-06-12', '2023-06-12', @message OUTPUT;

-- Channel 46
EXEC InsertMessage 91, 38, 46, 'Message 1 from User 38 in Channel 46', '2023-07-13', '2023-07-13', @message OUTPUT;
EXEC InsertMessage 92, 39, 46, 'Message 1 from User 39 in Channel 46', '2023-07-14', '2023-07-14', @message OUTPUT;

-- Channel 47
EXEC InsertMessage 93, 39, 47, 'Message 1 from User 39 in Channel 47', '2023-08-15', '2023-08-15', @message OUTPUT;
EXEC InsertMessage 94, 40, 47, 'Message 1 from User 40 in Channel 47', '2023-08-16', '2023-08-16', @message OUTPUT;

-- Channel 48
EXEC InsertMessage 95, 39, 48, 'Message 1 from User 39 in Channel 48', '2023-09-17', '2023-09-17', @message OUTPUT;
EXEC InsertMessage 96, 40, 48, 'Message 1 from User 40 in Channel 48', '2023-09-18', '2023-09-18', @message OUTPUT;

-- Channel 49
EXEC InsertMessage 97, 41, 49, 'Message 1 from User 41 in Channel 49', '2023-10-31', '2023-10-31', @message OUTPUT;
EXEC InsertMessage 98, 42, 49, 'Message 1 from User 42 in Channel 49', '2023-10-31', '2023-10-31', @message OUTPUT;

-- Channel 50
EXEC InsertMessage 99, 41, 50, 'Message 1 from User 41 in Channel 50', '2023-11-30', '2023-11-30', @message OUTPUT;
EXEC InsertMessage 100, 42, 50, 'Message 1 from User 42 in Channel 50', '2023-11-30', '2023-11-30', @message OUTPUT;

-- Channel 51
EXEC InsertMessage 101, 43, 51, 'Message 1 from User 43 in Channel 51', '2023-12-31', '2023-12-31', @message OUTPUT;
EXEC InsertMessage 102, 44, 51, 'Message 1 from User 44 in Channel 51', '2023-12-31', '2023-12-31', @message OUTPUT;

-- Channel 52
EXEC InsertMessage 103, 43, 52, 'Message 1 from User 43 in Channel 52', '2023-10-31', '2023-10-31', @message OUTPUT;
EXEC InsertMessage 104, 44, 52, 'Message 1 from User 44 in Channel 52', '2023-10-31', '2023-10-31', @message OUTPUT;

-- Channel 53
EXEC InsertMessage 105, 44, 53, 'Message 1 from User 44 in Channel 53', '2023-11-30', '2023-11-30', @message OUTPUT;
EXEC InsertMessage 106, 45, 53, 'Message 1 from User 45 in Channel 53', '2023-11-30', '2023-11-30', @message OUTPUT;

-- Channel 54
EXEC InsertMessage 107, 44, 54, 'Message 1 from User 44 in Channel 54', '2023-12-31', '2023-12-31', @message OUTPUT;
EXEC InsertMessage 108, 45, 54, 'Message 1 from User 45 in Channel 54', '2023-12-31', '2023-12-31', @message OUTPUT;

-- Channel 55
EXEC InsertMessage 109, 46, 55, 'Message 1 from User 46 in Channel 55', '2023-04-30', '2023-04-30', @message OUTPUT;
EXEC InsertMessage 110, 47, 55, 'Message 1 from User 47 in Channel 55', '2023-04-30', '2023-04-30', @message OUTPUT;

-- Channel 56
EXEC InsertMessage 111, 46, 56, 'Message 1 from User 46 in Channel 56', '2023-05-31', '2023-05-31', @message OUTPUT;
EXEC InsertMessage 112, 47, 56, 'Message 1 from User 47 in Channel 56', '2023-05-31', '2023-05-31', @message OUTPUT;

-- Channel 57
EXEC InsertMessage 113, 48, 57, 'Message 1 from User 48 in Channel 57', '2023-06-30', '2023-06-30', @message OUTPUT;
EXEC InsertMessage 114, 49, 57, 'Message 1 from User 49 in Channel 57', '2023-06-30', '2023-06-30', @message OUTPUT;

-- Channel 58
EXEC InsertMessage 115, 48, 58, 'Message 1 from User 48 in Channel 58', '2023-07-31', '2023-07-31', @message OUTPUT;
EXEC InsertMessage 116, 49, 58, 'Message 1 from User 49 in Channel 58', '2023-07-31', '2023-07-31', @message OUTPUT;

-- Channel 59
EXEC InsertMessage 117, 49, 59, 'Message 1 from User 49 in Channel 59', '2023-08-31', '2023-08-31', @message OUTPUT;
EXEC InsertMessage 118, 50, 59, 'Message 1 from User 50 in Channel 59', '2023-08-31', '2023-08-31', @message OUTPUT;

-- Channel 60
EXEC InsertMessage 119, 49, 60, 'Message 1 from User 49 in Channel 60', '2023-09-30', '2023-09-30', @message OUTPUT;
EXEC InsertMessage 120, 50, 60, 'Message 1 from User 50 in Channel 60', '2023-09-30', '2023-09-30', @message OUTPUT;

SELECT * FROM Messages;