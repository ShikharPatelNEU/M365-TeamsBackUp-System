USE teams;
GO

---For Organization Table---
-- An index on the org_name column of the Organization table could improve search and join operations, especially if queries often search for organizations by name.
CREATE NONCLUSTERED INDEX idx_org_name ON Organization(org_name);

---For SubscriptionPlan Table---
-- Queries involving subscription plans might frequently filter or join on the price or subscription_period_id, especially in reporting or billing calculations.
CREATE NONCLUSTERED INDEX idx_plan_price_period ON SubscriptionPlan(price, subscription_period_id);

---For Teams Table---
-- Since teams are often looked up by their display_name or org_id (to find all teams within a specific organization), indexing these columns could be beneficial.
CREATE NONCLUSTERED INDEX idx_team_display_name ON Teams(display_name);

CREATE NONCLUSTERED INDEX idx_team_org_id ON Teams(org_id);

CREATE NONCLUSTERED INDEX idx_team_id_org_id ON Teams(team_id, org_id);

---For Users Table---
-- For a database where user information is frequently queried, especially based on their organizational affiliation (org_id) or by email (user_email), indexes on these fields can reduce lookup times.
CREATE NONCLUSTERED INDEX idx_user_org_id ON Users(org_id);
CREATE NONCLUSTERED INDEX idx_user_id_org_id ON Users(user_id, org_id);

---For Message Table---
CREATE NONCLUSTERED INDEX idx_message_user_id ON Messages(message_id, user_id);


SELECT 
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType,
    i.is_unique AS IsUnique,
    c.name AS ColumnName,
    ic.index_column_id AS ColumnOrder
FROM 
    sys.indexes i
INNER JOIN 
    sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
INNER JOIN 
    sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
WHERE 
    i.type_desc <> 'HEAP' -- Exclude heaps
ORDER BY 
    TableName, IndexName, ColumnOrder;
