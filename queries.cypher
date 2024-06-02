// Count all users, count all targets, count all actions,
MATCH (u: User)-[a: ACTION]->(t:Target)
RETURN count( DISTINCT a.id) AS numOfActions, count( DISTINCT u.id) AS numOfUsers, count( DISTINCT t.id) AS numOfTargets

// Show all actions (actionID) and targets (targetID) of a specific user (choose one),
MATCH (u:User { id:42 })-[a: ACTION]->(t:Target)
RETURN DISTINCT a.id AS actionID, t.id AS targetID

// For each user, count his/her actions,
MATCH (u:User)-[a:ACTION]->(:Target)
RETURN DISTINCT u.id AS userID, count( DISTINCT a.id) AS numOfActions

// For each target, count how many users have done this target,
MATCH (u:User)-[:ACTION]->(t:Target)
RETURN DISTINCT t.id AS targetID, count( DISTINCT u.id) AS numOfUsersDoneTarget

// Count the average actions per user,
MATCH (u:User)-[a:ACTION]->(:Target)
WITH u.id AS userID, COUNT( DISTINCT a.id) AS numOfActions
RETURN AVG(numOfActions) AS averageActionsPerUser

// Show the userID and the targetID, if the action has positive Feature2,
MATCH (u:User)-[a:ACTION]->(t:Target)
WHERE a.feature2 > 0
RETURN DISTINCT u.id AS userID, t.id AS targetID

// For each targetID, count the actions with label '1',
MATCH (:User)-[a:ACTION { label: 1 }]->(t:Target)
RETURN t.id AS targetID, COUNT( DISTINCT a.id) AS numberOfActionsWithLabel1
