DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230203175856');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230203175856');
-- Add your query below.

UPDATE `quest_template` SET `entry`=8271, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=10, `RewRepValue2`=10 WHERE `entry`=8271 AND `patch`=6;
UPDATE `quest_template` SET `entry`=7301, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7301 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7162, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7162 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7282, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepFaction3`=72, `RewRepValue1`=100, `RewRepValue2`=100, `RewRepValue3`=100 WHERE `entry`=7282 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7081, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7081 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7261, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7261 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7141, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=200, `RewRepValue2`=200 WHERE `entry`=7141 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7382, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=25, `RewRepValue2`=25 WHERE `entry`=7382 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7121, `RewXP`=660 WHERE `entry`=7121 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7171, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=200, `RewRepValue2`=200 WHERE `entry`=7171 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7102, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7102 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7122, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7122 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7386, `RewRepFaction1`=47, `RewRepValue1`=50 WHERE `entry`=7386 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7223, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7223 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7366, `RewRepFaction1`=730, `RewRepFaction2`=72, `RewRepValue1`=500, `RewRepValue2`=500, `RewXP`=0 WHERE `entry`=7366 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7169, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7169 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7172, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=200, `RewRepValue2`=200 WHERE `entry`=7172 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7170, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=150, `RewRepValue2`=150 WHERE `entry`=7170 AND `patch`=3;
UPDATE `quest_template` SET `entry`=6848, `RewRepFaction1`=730, `RewRepValue1`=75 WHERE `entry`=6848 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7402, `RewRepFaction1`=730, `RewRepFaction2`=47, `RewRepValue1`=500, `RewRepValue2`=500 WHERE `entry`=7402 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7365, `RewRepFaction1`=730, `RewRepFaction2`=69, `RewRepValue1`=500, `RewRepValue2`=500 WHERE `entry`=7365 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7168, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7168 AND `patch`=3;
UPDATE `quest_template` SET `entry`=6862, `RewRepFaction1`=47, `RewRepFaction2`=730, `RewRepValue1`=10, `RewRepValue2`=25 WHERE `entry`=6862 AND `patch`=3;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
