USE teams
GO

DECLARE @org_id INT,
        @org_name VARCHAR(255),
        @org_admin_email NVARCHAR(400),
        @message VARCHAR(255);

-- Insert each organization using the stored procedure

-- Global Tech
SET @org_id = 1;
SET @org_name = 'Global Tech';
SET @org_admin_email = 'admin@globaltech.com';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;
PRINT @message;

-- Health & Wellness Inc.
SET @org_id = 2;
SET @org_name = 'Health & Wellness Inc.';
SET @org_admin_email = 'support@healthwellness.com';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;
PRINT @message;

-- EduFuture
SET @org_id = 3;
SET @org_name = 'EduFuture';
SET @org_admin_email = 'info@edufuture.edu';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;
PRINT @message;

-- EcoSolutions
SET @org_id = 4;
SET @org_name = 'EcoSolutions';
SET @org_admin_email = 'contact@ecosolutions.org';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;
PRINT @message;

-- FinTech Innovations
SET @org_id = 5;
SET @org_name = 'FinTech Innovations';
SET @org_admin_email = 'help@fintechinnovations.com';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;
PRINT @message;

-- NextGen Robotics
SET @org_id = 6;
SET @org_name = 'NextGen Robotics';
SET @org_admin_email = 'service@nextgenrobotics.net';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;
PRINT @message;

-- Green Energy Corp
SET @org_id = 7;
SET @org_name = 'Green Energy Corp';
SET @org_admin_email = 'admin@greenenergycorp.com';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;
PRINT @message;

-- CyberSecure
SET @org_id = 8;
SET @org_name = 'CyberSecure';
SET @org_admin_email = 'support@cybersecure.com';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;
PRINT @message;

-- DataAnalytics Co.
SET @org_id = 9;
SET @org_name = 'DataAnalytics Co.';
SET @org_admin_email = 'info@dataanalyticsco.com';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;
PRINT @message;

-- Cloud Services Ltd
SET @org_id = 10;
SET @org_name = 'Cloud Services Ltd';
SET @org_admin_email = 'contact@cloudservicesltd.net';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;
PRINT @message;
GO

-- select * from Organization;
GO
-- -- Open the symmetric key for decryption
-- OPEN SYMMETRIC KEY OrgKey
-- DECRYPTION BY CERTIFICATE OrgCert;

-- -- Select decrypted email along with other columns
-- SELECT org_id,
--        org_name,
--        CONVERT(NVARCHAR(400), DECRYPTBYKEY(org_admin_email)) AS decrypted_email
-- FROM Organization;

-- -- Close the symmetric key
-- CLOSE SYMMETRIC KEY OrgKey;