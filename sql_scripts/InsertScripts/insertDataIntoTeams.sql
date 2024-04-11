USE teams;
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
INSERT INTO Sites (site_id, msft_site_id, site_name,
site_description, creation_date) VALUES
(1, 'site-001', 'Main Office', 'Main office site', '2022-01-01'),
(2, 'site-002', 'Remote Office A', 'First remote office site', '2022-02-01'),
(3, 'site-003', 'Remote Office B', 'Second remote office site', '2022-03-01'),
(4, 'site-004', 'Data Center', 'Main data center site', '2022-04-01'),
(5, 'site-005', 'Satellite Office C', 'Third remote office site', '2022-05-01'),
(6, 'site-006', 'Development Hub', 'Development team site', '2022-06-01'),
(7, 'site-007', 'Research Lab', 'R&D site', '2022-07-01'),
(8, 'site-008', 'Branch Office D', 'Fourth remote office site', '2022-08-01'),
(9, 'site-009', 'Support Center', 'Customer support site', '2022-09-01'),
(10, 'site-010', 'Warehouse', 'Storage and distribution site', '2022-10-01'),
(11, 'site-011', 'Regional Office E', 'Fifth remote office site', '2022-11-01'),
(12, 'site-012', 'Warehouse F', 'Secondary storage site', '2022-12-01'),
(13, 'site-013', 'Distribution Center G', 'Main distribution hub', '2023-01-01'),
(14, 'site-014', 'Call Center H', 'Customer service call center', '2023-02-01'),
(15, 'site-015', 'Sales Office I', 'Sales team office', '2023-03-01'),
(16, 'site-016', 'Marketing Department J', 'Marketing team office', '2023-04-01'),
(17, 'site-017', 'Training Facility K', 'Employee training center', '2023-05-01'),
(18, 'site-018', 'Corporate Headquarters', 'Main company headquarters', '2023-06-01'),
(19, 'site-019', 'Manufacturing Plant L', 'Production facility', '2023-07-01'),
(20, 'site-020', 'Assembly Line M', 'Manufacturing assembly line site', '2023-08-01'),
(21, 'site-021', 'Quality Control N', 'Quality assurance site', '2023-09-01'),
(22, 'site-022', 'Shipping and Receiving O', 'Shipping and receiving center', '2023-10-01'),
(23, 'site-023', 'Retail Outlet P', 'Company-owned retail store', '2023-11-01'),
(24, 'site-024', 'Customer Experience Center Q', 'Interactive customer experience center', '2023-12-01'),
(25, 'site-025', 'Innovation Hub R', 'Innovation and ideation center', '2024-01-01'),
(26, 'site-026', 'Incubation Lab S', 'Startup incubation laboratory', '2024-02-01'),
(27, 'site-027', 'Testing Facility T', 'Product testing and QA site', '2024-03-01'),
(28, 'site-028', 'Logistics Hub U', 'Logistics and supply chain hub', '2024-04-01'),
(29, 'site-029', 'Training Academy V', 'Professional training academy', '2024-03-01'),
(30, 'site-030', 'Healthcare Center W', 'Company healthcare center', '2024-03-01');

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
