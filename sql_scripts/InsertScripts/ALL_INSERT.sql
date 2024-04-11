USE teams;
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

-- Health & Wellness Inc.
SET @org_id = 2;
SET @org_name = 'Health & Wellness Inc.';
SET @org_admin_email = 'support@healthwellness.com';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;

-- EduFuture
SET @org_id = 3;
SET @org_name = 'EduFuture';
SET @org_admin_email = 'info@edufuture.edu';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;

-- EcoSolutions
SET @org_id = 4;
SET @org_name = 'EcoSolutions';
SET @org_admin_email = 'contact@ecosolutions.org';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;

-- FinTech Innovations
SET @org_id = 5;
SET @org_name = 'FinTech Innovations';
SET @org_admin_email = 'help@fintechinnovations.com';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;

-- NextGen Robotics
SET @org_id = 6;
SET @org_name = 'NextGen Robotics';
SET @org_admin_email = 'service@nextgenrobotics.net';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;

-- Green Energy Corp
SET @org_id = 7;
SET @org_name = 'Green Energy Corp';
SET @org_admin_email = 'admin@greenenergycorp.com';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;

-- CyberSecure
SET @org_id = 8;
SET @org_name = 'CyberSecure';
SET @org_admin_email = 'support@cybersecure.com';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;

-- DataAnalytics Co.
SET @org_id = 9;
SET @org_name = 'DataAnalytics Co.';
SET @org_admin_email = 'info@dataanalyticsco.com';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;

-- Cloud Services Ltd
SET @org_id = 10;
SET @org_name = 'Cloud Services Ltd';
SET @org_admin_email = 'contact@cloudservicesltd.net';
EXEC InsertOrganization @org_id, @org_name, @org_admin_email, @message OUTPUT;
GO

--Insert data into SUbscriptionperiod 
INSERT INTO SubscriptionPeriod (period_id, period_name) VALUES
(1, 'Monthly'),
(2, 'Quarterly'),
(3, 'Semi-Annual'),
(4, 'Annual'),
(5, 'Two-Year'),
(6, 'Three-Year'),
(7, 'Four-Year'),
(8, 'Five-Year'), 
(9, 'Lifetime'),
(10, 'Trial');
GO

-- Select * from SubscriptionPeriod

--Insert data into SubscriptionPlan table
INSERT INTO SubscriptionPlan (plan_id, plan_name, price,
subscription_period_id, storage_limit) VALUES
(1, 'Basic Plan', 9.99, 1, 10),
(2, 'Standard Plan', 19.99, 4, 50),
(3, 'Premium Plan', 29.99, 4, 100),
(4, 'Enterprise Plan', 49.99, 4, 500),
(5, 'Startup Plan', 14.99, 1, 30),
(6, 'Growth Plan', 24.99, 2, 70),
(7, 'Expansion Plan', 39.99, 3, 150),
(8, 'Global Plan', 99.99, 4, 1000),
(9, 'Innovator Plan', 59.99, 4, 200),
(10, 'Visionary Plan', 199.99, 8, 2000);
GO

-- Select * from subscriptionplan

--Insert data into OrgPlan_Map table
INSERT INTO OrgPlan_Map (org_plan_id, org_id, plan_id,
plan_start_date, plan_end_date) VALUES
(1, 1, 1, '2024-01-01', '2024-02-01'),
(2, 2, 2, '2024-02-01', '2025-02-01'),
(3, 3, 3, '2024-03-01', '2025-03-01'),
(4, 4, 4, '2024-04-01', '2025-04-01'),
(5, 5, 5, '2024-05-01', '2024-06-01'),
(6, 6, 6, '2024-06-01', '2024-09-01'),
(7, 7, 7, '2024-07-01', '2025-01-01'),
(8, 8, 8, '2024-08-01', '2025-08-01'),
(9, 9, 9, '2024-09-01', '2025-09-01'),
(10, 10, 10, '2024-10-01', '2029-10-01');

-- Select * from OrgPlan_Map

--Insert data into BackupSettings table
INSERT INTO BackupSettings (backup_settings_id, org_plan_id,
retention_policy_days, backup_frequency) VALUES
(1, 1, 30, 1),
(2, 2, 60, 2),
(3, 3, 90, 3),
(4, 4, 120, 4),
(5, 5, 150, 5),
(6, 6, 180, 1),
(7, 7, 210, 2),
(8, 8, 240, 3),
(9, 9, 270, 4),
(10, 10, 300, 5);

-- SELECT * FROM BackupSettings;

--Insert data into Sites table
INSERT INTO Sites (site_id, msft_site_id, site_name, site_description, creation_date, city, country) VALUES
(1, 'site-001', 'Main Office', 'Main office site', '2022-01-01', 'New York', 'USA'),
(2, 'site-002', 'Remote Office A', 'First remote office site', '2022-02-01', 'London', 'UK'),
(3, 'site-003', 'Remote Office B', 'Second remote office site', '2022-03-01', 'Paris', 'France'),
(4, 'site-004', 'Data Center', 'Main data center site', '2022-04-01', 'Tokyo', 'Japan'),
(5, 'site-005', 'Satellite Office C', 'Third remote office site', '2022-05-01', 'Sydney', 'Australia'),
(6, 'site-006', 'Development Hub', 'Development team site', '2022-06-01', 'New York', 'USA'),
(7, 'site-007', 'Research Lab', 'R&D site', '2022-07-01', 'Toronto', 'Canada'),
(8, 'site-008', 'Branch Office D', 'Fourth remote office site', '2022-08-01', 'New York', 'USA'),
(9, 'site-009', 'Support Center', 'Customer support site', '2022-09-01', 'London', 'UK'),
(10, 'site-010', 'Warehouse', 'Storage and distribution site', '2022-10-01', 'Paris', 'France'),
(11, 'site-011', 'Regional Office E', 'Fifth remote office site', '2022-11-01', 'Tokyo', 'Japan'),
(12, 'site-012', 'Warehouse F', 'Secondary storage site', '2022-12-01', 'Sydney', 'Australia'),
(13, 'site-013', 'Distribution Center G', 'Main distribution hub', '2023-01-01', 'Berlin', 'Germany'),
(14, 'site-014', 'Call Center H', 'Customer service call center', '2023-02-01', 'Toronto', 'Canada'),
(15, 'site-015', 'Sales Office I', 'Sales team office', '2023-03-01', 'New York', 'USA'),
(16, 'site-016', 'Marketing Department J', 'Marketing team office', '2023-04-01', 'London', 'UK'),
(17, 'site-017', 'Training Facility K', 'Employee training center', '2023-05-01', 'Paris', 'France'),
(18, 'site-018', 'Corporate Headquarters', 'Main company headquarters', '2023-06-01', 'Tokyo', 'Japan'),
(19, 'site-019', 'Manufacturing Plant L', 'Production facility', '2023-07-01', 'Sydney', 'Australia'),
(20, 'site-020', 'Assembly Line M', 'Manufacturing assembly line site', '2023-08-01', 'Berlin', 'Germany'),
(21, 'site-021', 'Quality Control N', 'Quality assurance site', '2023-09-01', 'New York', 'USA'),
(22, 'site-022', 'Shipping and Receiving O', 'Shipping and receiving center', '2023-10-01', 'New York', 'USA'),
(23, 'site-023', 'Retail Outlet P', 'Company-owned retail store', '2023-11-01', 'London', 'UK'),
(24, 'site-024', 'Customer Experience Center Q', 'Interactive customer experience center', '2023-12-01', 'Paris', 'France'),
(25, 'site-025', 'Innovation Hub R', 'Innovation and ideation center', '2024-01-01', 'Tokyo', 'Japan'),
(26, 'site-026', 'Incubation Lab S', 'Startup incubation laboratory', '2024-02-01', 'Sydney', 'Australia'),
(27, 'site-027', 'Testing Facility T', 'Product testing and QA site', '2024-03-01', 'Berlin', 'Germany'),
(28, 'site-028', 'Logistics Hub U', 'Logistics and supply chain hub', '2024-04-01', 'Toronto', 'Canada'),
(29, 'site-029', 'Training Academy V', 'Professional training academy', '2024-03-01', 'New York', 'USA'),
(30, 'site-030', 'Healthcare Center W', 'Company healthcare center', '2024-03-01', 'New York', 'USA');

-- SELECT * FROM sites;

--Insert data into TeamSettings table
INSERT INTO TeamSettings (team_settings_id,
allow_create_update_channels, allow_create_private_channels,
allow_delete_channels, allow_user_edit_messages,
allow_user_delete_messages) VALUES
(1, 1, 1, 1, 1, 1),
(2, 1, 0, 1, 0, 1),
(3, 0, 1, 0, 1, 0),
(4, 1, 1, 0, 1, 1),
(5, 0, 0, 1, 0, 0),
(6, 1, 0, 0, 1, 1),
(7, 0, 1, 1, 0, 1),
(8, 1, 1, 1, 0, 0),
(9, 0, 0, 0, 1, 1),
(10, 1, 0, 1, 1, 0),
(11, 1, 1, 0, 0, 1),
(12, 0, 1, 1, 1, 0),
(13, 1, 0, 1, 0, 0),
(14, 0, 0, 1, 1, 1),
(15, 1, 1, 0, 1, 0),
(16, 0, 1, 0, 0, 1),
(17, 1, 0, 1, 1, 1),
(18, 1, 1, 1, 0, 1),
(19, 0, 1, 0, 1, 0),
(20, 1, 0, 0, 0, 1),
(21, 1, 1, 0, 1, 0),
(22, 0, 0, 1, 1, 1),
(23, 1, 0, 1, 0, 0),
(24, 0, 1, 0, 1, 1),
(25, 1, 1, 1, 0, 1),
(26, 1, 0, 0, 1, 0),
(27, 0, 1, 1, 0, 1),
(28, 1, 0, 1, 1, 0),
(29, 0, 0, 1, 1, 1),
(30, 1, 1, 0, 0, 1);

-- SELECT * FROM TeamSettings;

-- Insert data into Teams table
INSERT INTO Teams (team_id, org_id, site_id, team_settings_id, display_name, msft_team_id, team_description, creation_date) VALUES
-- Organization 1
(1, 1, 1, 1, 'Team 1 - Org 1', '7e04fc63-9f26-4ff7-82cf-19227cf98667', 'Team 1 description for Organization 1', '2022-01-01'),
(2, 1, 2, 2, 'Team 2 - Org 1', 'b6c8a931-83cc-4c1a-9e19-9c55061232f9', 'Team 2 description for Organization 1', '2022-05-01'),
(3, 1, 3, 3, 'Team 3 - Org 1', 'f6e12721-69c8-4347-b070-835f191c9a8c', 'Team 3 description for Organization 1', '2022-09-01'),

-- Organization 2
(4, 2, 4, 4, 'Team 1 - Org 2', '5010cb76-c903-4a9e-97e4-6c6bf688b6f5', 'Team 1 description for Organization 2', '2022-02-01'),
(5, 2, 5, 5, 'Team 2 - Org 2', '25a3121e-65ab-41c3-98b6-0e9966c1b1b4', 'Team 2 description for Organization 2', '2022-06-01'),
(6, 2, 6, 6, 'Team 3 - Org 2', 'e8f4685c-8a5e-4597-93ef-3e33517c3742', 'Team 3 description for Organization 2', '2022-10-01'),

-- Organization 3
(7, 3, 7, 7, 'Team 1 - Org 3', 'e423d8a6-f6a5-4c51-ae88-540fc0e41e4d', 'Team 1 description for Organization 3', '2022-03-01'),
(8, 3, 8, 8, 'Team 2 - Org 3', '46ec122d-0e4d-44e7-a1d0-3d1f6be747cb', 'Team 2 description for Organization 3', '2022-07-01'),
(9, 3, 9, 9, 'Team 3 - Org 3', 'f75e5900-bfb8-47e2-8daa-eb1fb45d0c08', 'Team 3 description for Organization 3', '2022-11-01'),

-- Organization 4
(10, 4, 10, 10, 'Team 1 - Org 4', 'b41e4b56-65d4-41ab-876d-7c630d0f63f9', 'Team 1 description for Organization 4', '2022-04-01'),
(11, 4, 10, 10, 'Team 2 - Org 4', '2c23a5a2-13ad-4e63-9f21-d0ec93c7b71f', 'Team 2 description for Organization 4', '2022-08-01'),
(12, 4, 10, 10, 'Team 3 - Org 4', 'ed4cf4d5-26b0-4bc1-9e8d-263d59488933', 'Team 3 description for Organization 4', '2022-12-01'),

-- Organization 5
(13, 5, 13, 13, 'Team 1 - Org 5', '32d54d8a-365e-4700-b15e-f2c31981017e', 'Team 1 description for Organization 5', '2023-01-01'),
(14, 5, 13, 13, 'Team 2 - Org 5', '8b8e9a7a-0c34-4622-96f3-f98d8c2d3356', 'Team 2 description for Organization 5', '2023-05-01'),
(15, 5, 13, 13, 'Team 3 - Org 5', '3d4c76c7-68ff-4878-8f3d-79ed2d7ccf15', 'Team 3 description for Organization 5', '2023-09-01'),

-- Organization 6
(16, 6, 16, 16, 'Team 1 - Org 6', 'f87e24cd-1502-466e-81b4-dbd027f4a335', 'Team 1 description for Organization 6', '2023-02-01'),
(17, 6, 16, 16, 'Team 2 - Org 6', '6a42d159-12cc-4c52-9074-82c1b961c86e', 'Team 2 description for Organization 6', '2023-06-01'),
(18, 6, 16, 16, 'Team 3 - Org 6', '1cb50ab0-f38d-4a56-bd1b-14a06c13fe97', 'Team 3 description for Organization 6', '2023-10-01'),

-- Organization 7
(19, 7, 19, 19, 'Team 1 - Org 7', 'b0e7e60e-604f-4e2a-af5f-8bde05a7f48e', 'Team 1 description for Organization 7', '2023-03-01'),
(20, 7, 19, 19, 'Team 2 - Org 7', 'a51b0c46-29e5-4f1e-bb13-1bdaed43cbfd', 'Team 2 description for Organization 7', '2023-07-01'),
(21, 7, 19, 19, 'Team 3 - Org 7', '309f8e20-72fb-4032-82d8-11b5aa2a6b70', 'Team 3 description for Organization 7', '2023-11-01'),

-- Organization 8
(22, 8, 22, 22, 'Team 1 - Org 8', '9d5f33f3-0e1a-4ff1-86ab-47c495ca33ff', 'Team 1 description for Organization 8', '2023-04-01'),
(23, 8, 22, 22, 'Team 2 - Org 8', '16332796-0656-4681-bca2-b2c270040bae', 'Team 2 description for Organization 8', '2023-08-01'),
(24, 8, 22, 22, 'Team 3 - Org 8', '882d6561-4651-42d4-af04-f415174f5179', 'Team 3 description for Organization 8', '2023-12-01'),

-- Organization 9
(25, 9, 25, 25, 'Team 1 - Org 9', '91c9de69-cd0a-4ef8-8146-835e85982c4e', 'Team 1 description for Organization 9', '2023-01-01'),
(26, 9, 25, 25, 'Team 2 - Org 9', 'ee4d8f62-6b56-4e50-9e34-3f89d03efc51', 'Team 2 description for Organization 9', '2023-05-01'),
(27, 9, 25, 25, 'Team 3 - Org 9', 'f6af50d5-1848-4d1b-a21d-35dc29c81f8e', 'Team 3 description for Organization 9', '2023-09-01'),

-- Organization 10
(28, 10, 28, 28, 'Team 1 - Org 10', '7244f735-f9d4-43cb-bda7-4c77c1ac3c67', 'Team 1 description for Organization 10', '2024-02-01'),
(29, 10, 28, 28, 'Team 2 - Org 10', '155ac388-42ff-4d4d-8c1f-251c235b05e7', 'Team 2 description for Organization 10', '2024-06-01'),
(30, 10, 28, 28, 'Team 3 - Org 10', 'b802b77a-52e9-4910-a62e-c2b356e78624', 'Team 3 description for Organization 10', '2024-10-01');


-- SELECT * FROM teams;

-- Insert data into Apps table
INSERT INTO Apps (app_id, team_id, app_name, app_description, installed_date) VALUES
-- Organization 1
-- Team 1
(1, 1, 'App 1 - Team 1 - Org 1', 'Description for App 1 installed in Team 1', '2022-01-20'),
(2, 1, 'App 2 - Team 1 - Org 1', 'Description for App 2 installed in Team 1', '2022-01-21'),
(3, 1, 'App 3 - Team 1 - Org 1', 'Description for App 3 installed in Team 1', '2022-01-22'),

-- Team 2
(4, 2, 'App 1 - Team 2 - Org 1', 'Description for App 1 installed in Team 2', '2022-01-23'),
(5, 2, 'App 2 - Team 2 - Org 1', 'Description for App 2 installed in Team 2', '2022-01-24'),
(6, 2, 'App 3 - Team 2 - Org 1', 'Description for App 3 installed in Team 2', '2022-01-25'),

-- Team 3
(7, 3, 'App 1 - Team 3 - Org 1', 'Description for App 1 installed in Team 3', '2022-01-26'),
(8, 3, 'App 2 - Team 3 - Org 1', 'Description for App 2 installed in Team 3', '2022-01-27'),
(9, 3, 'App 3 - Team 3 - Org 1', 'Description for App 3 installed in Team 3', '2022-01-28'),

-- Organization 2
-- Team 1
(10, 4, 'App 1 - Team 1 - Org 2', 'Description for App 1 installed in Team 1', '2022-01-29'),
(11, 4, 'App 2 - Team 1 - Org 2', 'Description for App 2 installed in Team 1', '2022-01-30'),
(12, 4, 'App 3 - Team 1 - Org 2', 'Description for App 3 installed in Team 1', '2022-01-31'),

-- Team 2
(13, 5, 'App 1 - Team 2 - Org 2', 'Description for App 1 installed in Team 2', '2022-02-01'),
(14, 5, 'App 2 - Team 2 - Org 2', 'Description for App 2 installed in Team 2', '2022-02-02'),
(15, 5, 'App 3 - Team 2 - Org 2', 'Description for App 3 installed in Team 2', '2022-02-03'),

-- Team 3
(16, 6, 'App 1 - Team 3 - Org 2', 'Description for App 1 installed in Team 3', '2022-02-04'),
(17, 6, 'App 2 - Team 3 - Org 2', 'Description for App 2 installed in Team 3', '2022-02-05'),
(18, 6, 'App 3 - Team 3 - Org 2', 'Description for App 3 installed in Team 3', '2022-02-06'),

-- Organization 3
-- Team 1
(19, 7, 'App 1 - Team 1 - Org 3', 'Description for App 1 installed in Team 1', '2022-01-02'),
(20, 7, 'App 2 - Team 1 - Org 3', 'Description for App 2 installed in Team 1', '2022-01-03'),
(21, 7, 'App 3 - Team 1 - Org 3', 'Description for App 3 installed in Team 1', '2022-01-04'),

-- Team 2
(22, 8, 'App 1 - Team 2 - Org 3', 'Description for App 1 installed in Team 2', '2022-01-05'),
(23, 8, 'App 2 - Team 2 - Org 3', 'Description for App 2 installed in Team 2', '2022-01-06'),
(24, 8, 'App 3 - Team 2 - Org 3', 'Description for App 3 installed in Team 2', '2022-01-07'),

-- Team 3
(25, 9, 'App 1 - Team 3 - Org 3', 'Description for App 1 installed in Team 3', '2022-01-08'),
(26, 9, 'App 2 - Team 3 - Org 3', 'Description for App 2 installed in Team 3', '2022-01-09'),
(27, 9, 'App 3 - Team 3 - Org 3', 'Description for App 3 installed in Team 3', '2022-01-10'),

-- Organization 4
-- Team 1
(28, 10, 'App 1 - Team 1 - Org 4', 'Description for App 1 installed in Team 1', '2022-01-11'),
(29, 10, 'App 2 - Team 1 - Org 4', 'Description for App 2 installed in Team 1', '2022-01-12'),
(30, 10, 'App 3 - Team 1 - Org 4', 'Description for App 3 installed in Team 1', '2022-01-13'),

-- Team 2
(31, 11, 'App 1 - Team 2 - Org 4', 'Description for App 1 installed in Team 2', '2022-01-14'),
(32, 11, 'App 2 - Team 2 - Org 4', 'Description for App 2 installed in Team 2', '2022-01-15'),
(33, 11, 'App 3 - Team 2 - Org 4', 'Description for App 3 installed in Team 2', '2022-01-16'),

-- Team 3
(34, 12, 'App 1 - Team 3 - Org 4', 'Description for App 1 installed in Team 3', '2022-01-17'),
(35, 12, 'App 2 - Team 3 - Org 4', 'Description for App 2 installed in Team 3', '2022-01-18'),
(36, 12, 'App 3 - Team 3 - Org 4', 'Description for App 3 installed in Team 3', '2022-01-19'),

-- Organization 5
-- Team 1
(37, 13, 'App 1 - Team 1 - Org 5', 'Description for App 1 installed in Team 1', '2022-01-20'),
(38, 13, 'App 2 - Team 1 - Org 5', 'Description for App 2 installed in Team 1', '2022-01-21'),
(39, 13, 'App 3 - Team 1 - Org 5', 'Description for App 3 installed in Team 1', '2022-01-22'),

-- Team 2
(40, 14, 'App 1 - Team 2 - Org 5', 'Description for App 1 installed in Team 2', '2022-01-23'),
(41, 14, 'App 2 - Team 2 - Org 5', 'Description for App 2 installed in Team 2', '2022-01-24'),
(42, 14, 'App 3 - Team 2 - Org 5', 'Description for App 3 installed in Team 2', '2022-01-25'),

-- Team 3
(43, 15, 'App 1 - Team 3 - Org 5', 'Description for App 1 installed in Team 3', '2022-01-26'),
(44, 15, 'App 2 - Team 3 - Org 5', 'Description for App 2 installed in Team 3', '2022-01-27'),
(45, 15, 'App 3 - Team 3 - Org 5', 'Description for App 3 installed in Team 3', '2022-01-28'),

-- Organization 6
-- Team 1
(46, 16, 'App 1 - Team 1 - Org 6', 'Description for App 1 installed in Team 1', '2022-01-29'),
(47, 16, 'App 2 - Team 1 - Org 6', 'Description for App 2 installed in Team 1', '2022-01-30'),
(48, 16, 'App 3 - Team 1 - Org 6', 'Description for App 3 installed in Team 1', '2022-01-31'),

-- Team 2
(49, 17, 'App 1 - Team 2 - Org 6', 'Description for App 1 installed in Team 2', '2022-02-01'),
(50, 17, 'App 2 - Team 2 - Org 6', 'Description for App 2 installed in Team 2', '2022-02-02'),
(51, 17, 'App 3 - Team 2 - Org 6', 'Description for App 3 installed in Team 2', '2022-02-03'),

-- Team 3
(52, 18, 'App 1 - Team 3 - Org 6', 'Description for App 1 installed in Team 3', '2022-02-04'),
(53, 18, 'App 2 - Team 3 - Org 6', 'Description for App 2 installed in Team 3', '2022-02-05'),
(54, 18, 'App 3 - Team 3 - Org 6', 'Description for App 3 installed in Team 3', '2022-02-06'),

-- Organization 7
-- Team 1
(55, 19, 'App 1 - Team 1 - Org 7', 'Description for App 1 installed in Team 1', '2022-02-07'),
(56, 19, 'App 2 - Team 1 - Org 7', 'Description for App 2 installed in Team 1', '2022-02-08'),
(57, 19, 'App 3 - Team 1 - Org 7', 'Description for App 3 installed in Team 1', '2022-02-09'),

-- Team 2
(58, 20, 'App 1 - Team 2 - Org 7', 'Description for App 1 installed in Team 2', '2022-02-10'),
(59, 20, 'App 2 - Team 2 - Org 7', 'Description for App 2 installed in Team 2', '2022-02-11'),
(60, 20, 'App 3 - Team 2 - Org 7', 'Description for App 3 installed in Team 2', '2022-02-12'),

-- Team 3
(61, 21, 'App 1 - Team 3 - Org 7', 'Description for App 1 installed in Team 3', '2022-02-13'),
(62, 21, 'App 2 - Team 3 - Org 7', 'Description for App 2 installed in Team 3', '2022-02-14'),
(63, 21, 'App 3 - Team 3 - Org 7', 'Description for App 3 installed in Team 3', '2022-02-15'),

-- Organization 8
-- Team 1
(64, 22, 'App 1 - Team 1 - Org 8', 'Description for App 1 installed in Team 1', '2022-02-16'),
(65, 22, 'App 2 - Team 1 - Org 8', 'Description for App 2 installed in Team 1', '2022-02-17'),
(66, 22, 'App 3 - Team 1 - Org 8', 'Description for App 3 installed in Team 1', '2022-02-18'),

-- Team 2
(67, 23, 'App 1 - Team 2 - Org 8', 'Description for App 1 installed in Team 2', '2022-02-19'),
(68, 23, 'App 2 - Team 2 - Org 8', 'Description for App 2 installed in Team 2', '2022-02-20'),
(69, 23, 'App 3 - Team 2 - Org 8', 'Description for App 3 installed in Team 2', '2022-02-21'),

-- Team 3
(70, 24, 'App 1 - Team 3 - Org 8', 'Description for App 1 installed in Team 3', '2022-02-22'),
(71, 24, 'App 2 - Team 3 - Org 8', 'Description for App 2 installed in Team 3', '2022-02-23'),
(72, 24, 'App 3 - Team 3 - Org 8', 'Description for App 3 installed in Team 3', '2022-02-24'),

-- Organization 9
-- Team 1
(73, 25, 'App 1 - Team 1 - Org 9', 'Description for App 1 installed in Team 1', '2022-02-25'),
(74, 25, 'App 2 - Team 1 - Org 9', 'Description for App 2 installed in Team 1', '2022-02-26'),
(75, 25, 'App 3 - Team 1 - Org 9', 'Description for App 3 installed in Team 1', '2022-02-27'),

-- Team 2
(76, 26, 'App 1 - Team 2 - Org 9', 'Description for App 1 installed in Team 2', '2022-02-28'),
(77, 26, 'App 2 - Team 2 - Org 9', 'Description for App 2 installed in Team 2', '2022-03-01'),
(78, 26, 'App 3 - Team 2 - Org 9', 'Description for App 3 installed in Team 2', '2022-03-02'),

-- Team 3
(79, 27, 'App 1 - Team 3 - Org 9', 'Description for App 1 installed in Team 3', '2022-03-03'),
(80, 27, 'App 2 - Team 3 - Org 9', 'Description for App 2 installed in Team 3', '2022-03-04'),
(81, 27, 'App 3 - Team 3 - Org 9', 'Description for App 3 installed in Team 3', '2022-03-05'),

-- Organization 10
-- Team 1
(82, 28, 'App 1 - Team 1 - Org 10', 'Description for App 1 installed in Team 1', '2022-03-06'),
(83, 28, 'App 2 - Team 1 - Org 10', 'Description for App 2 installed in Team 1', '2022-03-07'),
(84, 28, 'App 3 - Team 1 - Org 10', 'Description for App 3 installed in Team 1', '2022-03-08'),

-- Team 2
(85, 29, 'App 1 - Team 2 - Org 10', 'Description for App 1 installed in Team 2', '2022-03-09'),
(86, 29, 'App 2 - Team 2 - Org 10', 'Description for App 2 installed in Team 2', '2022-03-10'),
(87, 29, 'App 3 - Team 2 - Org 10', 'Description for App 3 installed in Team 2', '2022-03-11'),

-- Team 3
(88, 30, 'App 1 - Team 3 - Org 10', 'Description for App 1 installed in Team 3', '2022-03-12'),
(89, 30, 'App 2 - Team 3 - Org 10', 'Description for App 2 installed in Team 3', '2022-03-13'),
(90, 30, 'App 3 - Team 3 - Org 10', 'Description for App 3 installed in Team 3', '2022-03-14');

-- Organisation 1 Channels
INSERT INTO Channels (channel_id, team_id, channel_name, channel_type, description, created_date)
VALUES
(1, 1, 'General', 'Public', 'General discussion', '2022-01-15'),
(2, 1, 'Marketing', 'Private', 'Marketing strategies', '2022-01-20'),
(3, 2, 'Development', 'Public', 'Development team discussions', '2022-02-20'),
(4, 2, 'Design', 'Private', 'Design team discussions', '2022-02-25'),
(5, 3, 'Sales', 'Public', 'Sales team discussions', '2022-03-25'),
(6, 3, 'Customer Support', 'Private', 'Customer support discussions', '2022-03-30');

-- Organisation 2 Channels
INSERT INTO Channels (channel_id, team_id, channel_name, channel_type, description, created_date)
VALUES
(7, 4, 'Operations', 'Public', 'Operations team discussions', '2022-04-30'),
(8, 4, 'HR', 'Private', 'HR team discussions', '2022-05-05'),
(9, 5, 'Research', 'Public', 'Research team discussions', '2022-06-10'),
(10, 5, 'Finance', 'Private', 'Finance team discussions', '2022-07-15'),
(11, 6, 'Product Management', 'Public', 'Product management discussions', '2022-08-20'),
(12, 6, 'QA', 'Private', 'QA team discussions', '2022-09-25');

-- Organisation 3 Channels
INSERT INTO Channels (channel_id, team_id, channel_name, channel_type, description, created_date)
VALUES
(13, 7, 'IT', 'Public', 'IT team discussions', '2022-10-30'),
(14, 7, 'Legal', 'Private', 'Legal team discussions', '2022-11-30'),
(15, 8, 'Engineering', 'Public', 'Engineering team discussions', '2022-12-30'),
(16, 8, 'Compliance', 'Private', 'Compliance team discussions', '2023-01-30'),
(17, 9, 'Marketing', 'Public', 'Marketing team discussions', '2023-02-28'),
(18, 9, 'Sales', 'Private', 'Sales team discussions', '2023-03-31');

-- Organisation 4 Channels
INSERT INTO Channels (channel_id, team_id, channel_name, channel_type, description, created_date)
VALUES
(19, 10, 'Research', 'Public', 'Research team discussions', '2023-04-30'),
(20, 10, 'Legal', 'Private', 'Legal team discussions', '2023-05-31'),
(21, 11, 'Engineering', 'Public', 'Engineering team discussions', '2023-06-30'),
(22, 11, 'Compliance', 'Private', 'Compliance team discussions', '2023-07-31'),
(23, 12, 'Marketing', 'Public', 'Marketing team discussions', '2023-08-31'),
(24, 12, 'Sales', 'Private', 'Sales team discussions', '2023-09-30');

-- Organisation 5 Channels
INSERT INTO Channels (channel_id, team_id, channel_name, channel_type, description, created_date)
VALUES
(25, 13, 'Operations', 'Public', 'Operations team discussions', '2023-10-31'),
(26, 13, 'HR', 'Private', 'HR team discussions', '2023-11-30'),
(27, 14, 'Research', 'Public', 'Research team discussions', '2023-12-31'),
(28, 14, 'Finance', 'Private', 'Finance team discussions', '2024-01-31'),
(29, 15, 'Product Management', 'Public', 'Product management discussions', '2024-02-28'),
(30, 15, 'QA', 'Private', 'QA team discussions', '2024-03-31');

-- Organisation 6 Channels
INSERT INTO Channels (channel_id, team_id, channel_name, channel_type, description, created_date)
VALUES
(31, 16, 'IT', 'Public', 'IT team discussions', '2024-04-30'),
(32, 16, 'Legal', 'Private', 'Legal team discussions', '2024-05-31'),
(33, 17, 'Engineering', 'Public', 'Engineering team discussions', '2024-06-30'),
(34, 17, 'Compliance', 'Private', 'Compliance team discussions', '2024-07-31'),
(35, 18, 'Marketing', 'Public', 'Marketing team discussions', '2024-08-31'),
(36, 18, 'Sales', 'Private', 'Sales team discussions', '2024-09-30');

-- Organisation 7 Channels
INSERT INTO Channels (channel_id, team_id, channel_name, channel_type, description, created_date)
VALUES
(37, 19, 'Research', 'Public', 'Research team discussions', '2024-10-31'),
(38, 19, 'Legal', 'Private', 'Legal team discussions', '2024-11-30'),
(39, 20, 'Engineering', 'Public', 'Engineering team discussions', '2024-12-31'),
(40, 20, 'Compliance', 'Private', 'Compliance team discussions', '2025-01-31'),
(41, 21, 'Marketing', 'Public', 'Marketing team discussions', '2025-02-28'),
(42, 21, 'Sales', 'Private', 'Sales team discussions', '2025-03-31');

-- Organisation 8 Channels
INSERT INTO Channels (channel_id, team_id, channel_name, channel_type, description, created_date)
VALUES
(43, 22, 'Operations', 'Public', 'Operations team discussions', '2025-04-30'),
(44, 22, 'HR', 'Private', 'HR team discussions', '2025-05-31'),
(45, 23, 'Research', 'Public', 'Research team discussions', '2025-06-30'),
(46, 23, 'Finance', 'Private', 'Finance team discussions', '2025-07-31'),
(47, 24, 'Product Management', 'Public', 'Product management discussions', '2025-08-31'),
(48, 24, 'QA', 'Private', 'QA team discussions', '2025-09-30');

-- Organisation 9 Channels
INSERT INTO Channels (channel_id, team_id, channel_name, channel_type, description, created_date)
VALUES
(49, 25, 'IT', 'Public', 'IT team discussions', '2025-10-31'),
(50, 25, 'Legal', 'Private', 'Legal team discussions', '2025-11-30'),
(51, 26, 'Engineering', 'Public', 'Engineering team discussions', '2025-12-31'),
(52, 26, 'Compliance', 'Private', 'Compliance team discussions', '2026-01-31'),
(53, 27, 'Marketing', 'Public', 'Marketing team discussions', '2026-02-28'),
(54, 27, 'Sales', 'Private', 'Sales team discussions', '2026-03-31');

-- Organisation 10 Channels
INSERT INTO Channels (channel_id, team_id, channel_name, channel_type, description, created_date)
VALUES
(55, 28, 'Research', 'Public', 'Research team discussions', '2026-04-30'),
(56, 28, 'Legal', 'Private', 'Legal team discussions', '2026-05-31'),
(57, 29, 'Engineering', 'Public', 'Engineering team discussions', '2026-06-30'),
(58, 29, 'Compliance', 'Private', 'Compliance team discussions', '2026-07-31'),
(59, 30, 'Marketing', 'Public', 'Marketing team discussions', '2026-08-31'),
(60, 30, 'Sales', 'Private', 'Sales team discussions', '2026-09-30');
GO


DECLARE @output_message VARCHAR(255);
DECLARE @message VARCHAR(255);

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
