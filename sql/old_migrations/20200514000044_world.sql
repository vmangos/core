DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200514000044');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200514000044');
-- Add your query below.


-- Tanaris patch 2.2.0 and patch 3.0.8
DELETE FROM `creature` WHERE  `guid`=6849;
DELETE FROM `creature` WHERE  `guid`=5719;
DELETE FROM `creature` WHERE  `guid`=5715;

-- Un'goro patch 2.2.0
DELETE FROM `creature` WHERE  `guid`=7715;
DELETE FROM `creature` WHERE  `guid`=5749;

-- Badlands patch 2.2.0
DELETE FROM `creature` WHERE  `guid`=6875;

-- Stonetalon patch 2.2.0
DELETE FROM `creature` WHERE  `guid`=5718;
DELETE FROM `creature` WHERE  `guid`=5717;

-- Alterac Mountains patch 2.2.0
DELETE FROM `creature` WHERE  `guid`=5725;

-- Barrens patch 2.2.0
DELETE FROM `creature` WHERE  `guid`=5724;

-- Dustwallow Marsh patch 3.0.8
DELETE FROM `creature` WHERE  `guid`=5723;

-- Searing Gorge patch 2.2.0
DELETE FROM `creature` WHERE  `guid`=5729;

-- Western Plaguelands patch 2.2.0
DELETE FROM `creature` WHERE  `guid`=6858;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
