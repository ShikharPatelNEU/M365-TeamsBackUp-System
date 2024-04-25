USE teams;
GO

-- Create the view using the scalar function
CREATE VIEW vw_OrganizationSubscriptionDetails AS
SELECT
    o.org_id,
    o.org_name,
    sp.plan_name,
    sp.price,
    spp.period_name,
    sp.storage_limit,
    opm.plan_start_date,
    opm.plan_end_date
FROM
    Organization o
INNER JOIN
    OrgPlan_Map opm ON o.org_id = opm.org_id
INNER JOIN
    SubscriptionPlan sp ON opm.plan_id = sp.plan_id
INNER JOIN
    SubscriptionPeriod spp ON sp.subscription_period_id = spp.period_id;
GO

---To retrieve data from these views---
-- SELECT * FROM vw_OrganizationSubscriptionDetails;

GO
---View for Team Membership and Roles---
CREATE VIEW vw_TeamMembershipDetails AS
SELECT
    t.display_name AS TeamName,
    u.user_first_name + ' ' + u.user_last_name AS FullName,
    tm.role,
    tm.joining_date
FROM
    TeamMembers tm
INNER JOIN
    Users u ON tm.user_id = u.user_id
INNER JOIN
    Teams t ON tm.team_id = t.team_id;
GO

-- Drop view vw_TeamMembershipDetails;
-- SELECT * FROM vw_TeamMembershipDetails;

GO
---View for Organization Storage Usage---
CREATE VIEW vw_OrganizationStorageUsage AS
SELECT
    o.org_id,
    o.org_name,
    SUM(f.file_size)/10124 AS TotalStorageUsed_in_MB,
    sp.storage_limit AS TotalStorageLimit_in_GB,
    (sp.storage_limit*1024 - SUM(f.file_size)/1024) AS StorageRemaining_in_MB
FROM
    Files f
INNER JOIN
    Users u ON f.user_id = u.user_id
INNER JOIN
    Organization o ON u.org_id = o.org_id
INNER JOIN
    OrgPlan_Map opm ON o.org_id = opm.org_id
INNER JOIN
    SubscriptionPlan sp ON opm.plan_id = sp.plan_id
GROUP BY
    o.org_id, o.org_name, sp.storage_limit;
GO

-- DROP VIEW vw_OrganizationStorageUsage;
-- SELECT * FROM vw_OrganizationStorageUsage;

GO
---View for Active Subscriptions---
CREATE VIEW vw_ActiveSubscriptions AS
SELECT
    o.org_name,
    sp.plan_name,
    sp.price,
    spp.period_name as SubscriptionPeriod,
    opm.plan_start_date,
    opm.plan_end_date
FROM
    OrgPlan_Map opm
JOIN
    Organization o ON opm.org_id = o.org_id
JOIN
    SubscriptionPlan sp ON opm.plan_id = sp.plan_id
JOIN
    SubscriptionPeriod spp ON sp.subscription_period_id = spp.period_id
WHERE
    GETDATE() BETWEEN opm.plan_start_date AND opm.plan_end_date;
GO

-- SELECT * FROM vw_ActiveSubscriptions;

GO
---View for User Activity Summary---
CREATE VIEW vw_UserActivitySummary AS
SELECT
    u.user_id,
    u.user_first_name + ' ' + u.user_last_name AS full_name,
    COUNT(m.message_id) AS messages_sent,
    MAX(m.creation_date) AS last_active_date
FROM
    Users u
LEFT JOIN
    Messages m ON u.user_id = m.user_id
GROUP BY
    u.user_id, u.user_first_name, u.user_last_name, u.user_email;
GO

-- DROP VIEW vw_UserActivitySummary;
-- SELECT * FROM vw_UserActivitySummary;


