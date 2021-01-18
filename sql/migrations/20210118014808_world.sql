DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210118014808');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210118014808');
-- Add your query below.
--Change mooncloth pattern to the correct name pre 1.3
REPLACE INTO `item_template` VALUES (14526, 0, 9, 2, 'Pattern: Purify Mooncloth', '', 1102, 1, 64, 1, 20000, 5000, 0, -1, -1, 55, 0, 197, 250, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18563, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `item_template` VALUES (14526, 1, 9, 2, 'Pattern: Mooncloth', '', 1102, 1, 64, 1, 20000, 5000, 0, -1, -1, 55, 0, 197, 250, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18563, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
--Add condition to check if the patch is less than or equal to 1.2 and greater than or equal to 1.3
INSERT INTO `conditions` VALUES (4010, 24, 0, 2, 0, 0, 0);
INSERT INTO `conditions` VALUES (4011, 24, 1, 1, 0, 0, 0);
--Move Pattern: Mooncloth to the correct NPC pre 1.3
UPDATE npc_vendor SET condition_id = '4011' WHERE item = 14526;
INSERT INTO `npc_vendor` VALUES (11188, 14526, 0, 0, 0, 4010);
-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
