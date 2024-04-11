USE teams;
GO

DECLARE @message NVARCHAR(255);

-- Organisation 1
EXEC InsertFile 1, 1, 1, 'File1.txt', 1024, '2022-01-15', @message OUTPUT;
EXEC InsertFile 2, 1, 1, 'File2.txt', 2048, '2022-01-15', @message OUTPUT;
EXEC InsertFile 3, 1, 2, 'File3.txt', 3072, '2022-01-15', @message OUTPUT;
EXEC InsertFile 4, 2, 1, 'File4.txt', 1024, '2022-01-20', @message OUTPUT;
EXEC InsertFile 5, 2, 1, 'File5.txt', 2048, '2022-01-20', @message OUTPUT;
EXEC InsertFile 6, 3, 3, 'File6.txt', 1024, '2022-02-20', @message OUTPUT;
EXEC InsertFile 7, 3, 3, 'File7.txt', 2048, '2022-02-20', @message OUTPUT;
EXEC InsertFile 8, 4, 3, 'File8.txt', 3072, '2022-02-25', @message OUTPUT;

-- Organisation 2
EXEC InsertFile 9, 7, 6, 'File9.txt', 1024, '2022-04-30', @message OUTPUT;
EXEC InsertFile 10, 7, 6, 'File10.txt', 2048, '2022-04-30', @message OUTPUT;
EXEC InsertFile 11, 8, 6, 'File11.txt', 3072, '2022-05-05', @message OUTPUT;
EXEC InsertFile 12, 8, 7, 'File12.txt', 1024, '2022-05-05', @message OUTPUT;
EXEC InsertFile 13, 9, 8, 'File13.txt', 2048, '2022-06-10', @message OUTPUT;
EXEC InsertFile 14, 9, 8, 'File14.txt', 3072, '2022-06-10', @message OUTPUT;

-- Organisation 3
EXEC InsertFile 15, 13, 11, 'File15.txt', 1024, '2022-10-30', @message OUTPUT;
EXEC InsertFile 16, 13, 11, 'File16.txt', 2048, '2022-10-30', @message OUTPUT;
EXEC InsertFile 17, 14, 11, 'File17.txt', 3072, '2022-11-30', @message OUTPUT;
EXEC InsertFile 18, 14, 12, 'File18.txt', 1024, '2022-11-30', @message OUTPUT;
EXEC InsertFile 19, 15, 13, 'File19.txt', 2048, '2022-12-30', @message OUTPUT;
EXEC InsertFile 20, 15, 13, 'File20.txt', 3072, '2022-12-30', @message OUTPUT;

-- Organisation 4
EXEC InsertFile 21, 19, 16, 'File21.txt', 1024, '2023-04-30', @message OUTPUT;
EXEC InsertFile 22, 19, 16, 'File22.txt', 2048, '2023-04-30', @message OUTPUT;
EXEC InsertFile 23, 20, 17, 'File23.txt', 3072, '2023-05-31', @message OUTPUT;
EXEC InsertFile 24, 20, 16, 'File24.txt', 1024, '2023-05-31', @message OUTPUT;
EXEC InsertFile 25, 21, 18, 'File25.txt', 2048, '2023-06-30', @message OUTPUT;
EXEC InsertFile 26, 21, 18, 'File26.txt', 3072, '2023-06-30', @message OUTPUT;

-- Organisation 5
EXEC InsertFile 27, 25, 21, 'File27.txt', 1024, '2023-10-01', @message OUTPUT;
EXEC InsertFile 28, 25, 21, 'File28.txt', 2048, '2023-10-01', @message OUTPUT;
EXEC InsertFile 29, 26, 22, 'File29.txt', 3072, '2023-11-03', @message OUTPUT;
EXEC InsertFile 30, 26, 21, 'File30.txt', 1024, '2023-11-03', @message OUTPUT;
EXEC InsertFile 31, 27, 23, 'File31.txt', 2048, '2023-12-05', @message OUTPUT;
EXEC InsertFile 32, 27, 23, 'File32.txt', 3072, '2023-12-05', @message OUTPUT;

-- Organisation 6
EXEC InsertFile 33, 31, 26, 'File33.txt', 1024, '2024-04-01', @message OUTPUT;
EXEC InsertFile 34, 31, 26, 'File34.txt', 2048, '2024-04-01', @message OUTPUT;
EXEC InsertFile 35, 32, 27, 'File35.txt', 3072, '2024-04-03', @message OUTPUT;
EXEC InsertFile 36, 32, 27, 'File36.txt', 1024, '2024-04-03', @message OUTPUT;
EXEC InsertFile 37, 33, 28, 'File37.txt', 2048, '2024-04-05', @message OUTPUT;
EXEC InsertFile 38, 33, 29, 'File38.txt', 3072, '2024-04-05', @message OUTPUT;

-- Organisation 7
EXEC InsertFile 39, 37, 31, 'File39.txt', 1024, '2023-10-15', @message OUTPUT;
EXEC InsertFile 40, 37, 32, 'File40.txt', 2048, '2023-10-15', @message OUTPUT;
EXEC InsertFile 41, 38, 31, 'File41.txt', 3072, '2023-11-17', @message OUTPUT;
EXEC InsertFile 42, 38, 32, 'File42.txt', 1024, '2023-11-17', @message OUTPUT;
EXEC InsertFile 43, 39, 33, 'File43.txt', 2048, '2023-12-19', @message OUTPUT;
EXEC InsertFile 44, 39, 34, 'File44.txt', 3072, '2023-12-19', @message OUTPUT;

-- Organisation 8
EXEC InsertFile 45, 43, 36, 'File45.txt', 1024, '2024-04-27', @message OUTPUT;
EXEC InsertFile 46, 43, 37, 'File46.txt', 2048, '2024-04-27', @message OUTPUT;
EXEC InsertFile 47, 44, 36, 'File47.txt', 3072, '2024-05-29', @message OUTPUT;
EXEC InsertFile 48, 44, 37, 'File48.txt', 1024, '2024-05-29', @message OUTPUT;
EXEC InsertFile 49, 45, 38, 'File49.txt', 2048, '2024-06-11', @message OUTPUT;
EXEC InsertFile 50, 45, 39, 'File50.txt', 3072, '2024-06-11', @message OUTPUT;

-- Organisation 9
EXEC InsertFile 51, 49, 41, 'File51.txt', 1024, '2024-10-31', @message OUTPUT;
EXEC InsertFile 52, 49, 42, 'File52.txt', 2048, '2024-10-31', @message OUTPUT;
EXEC InsertFile 53, 50, 41, 'File53.txt', 3072, '2024-11-30', @message OUTPUT;
EXEC InsertFile 54, 50, 42, 'File54.txt', 1024, '2024-11-30', @message OUTPUT;
EXEC InsertFile 55, 51, 43, 'File55.txt', 2048, '2024-12-31', @message OUTPUT;
EXEC InsertFile 56, 51, 44, 'File56.txt', 3072, '2024-12-31', @message OUTPUT;

-- Organisation 10
EXEC InsertFile 57, 55, 46, 'File57.txt', 1024, '2024-04-30', @message OUTPUT;
EXEC InsertFile 58, 55, 47, 'File58.txt', 2048, '2024-04-30', @message OUTPUT;
EXEC InsertFile 59, 56, 46, 'File59.txt', 3072, '2024-05-31', @message OUTPUT;
EXEC InsertFile 60, 56, 47, 'File60.txt', 1024, '2024-05-31', @message OUTPUT;
EXEC InsertFile 61, 57, 48, 'File61.txt', 2048, '2024-06-30', @message OUTPUT;
EXEC InsertFile 62, 57, 49, 'File62.txt', 3072, '2024-06-30', @message OUTPUT;


