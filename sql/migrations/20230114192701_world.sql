DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230114192701');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230114192701');
-- Add your query below.

UPDATE `quest_template` SET `entry`=7161, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7161 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7302, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7302 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7281, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepFaction3`=68, `RewRepValue1`=100, `RewRepValue2`=100, `RewRepValue3`=100 WHERE `entry`=7281 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7142, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=200, `RewRepValue2`=200 WHERE `entry`=7142 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7363, `RewRepFaction1`=729, `RewRepFaction2`=68, `RewRepValue1`=500, `RewRepValue2`=500 WHERE `entry`=7363 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7241, `RewRepFaction1`=729, `RewRepFaction2`=68, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7241 AND `patch`=3;
UPDATE `quest_template` SET `entry`=6847, `RewRepFaction1`=729, `RewRepValue1`=75 WHERE `entry`=6847 AND `patch`=3;
UPDATE `quest_template` SET `entry`=6861, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=25, `RewRepValue2`=10 WHERE `entry`=6861 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7164, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7164 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7224, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7224 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7368, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7368 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7401, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=500, `RewRepValue2`=500, `RewXP` =0 WHERE `entry`=7401 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7163, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=100, `RewRepValue2`=100 WHERE `entry`=7163 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7166, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=200, `RewRepValue2`=200 WHERE `entry`=7166 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7181, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=200, `RewRepValue2`=100 WHERE `entry`=7181 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7181, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=200, `RewRepValue2`=100 WHERE `entry`=7182 AND `patch`=6;
UPDATE `quest_template` SET `entry`=7165, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=150, `RewRepValue2`=150 WHERE `entry`=7165 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7167, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=200, `RewRepValue2`=200 WHERE `entry`=7167 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7361, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=500, `RewRepValue2`=500 WHERE `entry`=7361 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7362, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=500, `RewRepValue2`=500, `RewXP`=0 WHERE `entry`=7362 AND `patch`=3;
UPDATE `quest_template` SET `entry`=7381, `RewRepFaction1`=729, `RewRepFaction2`=76, `RewRepValue1`=25, `RewRepValue2`=25 WHERE `entry`=7381 AND `patch`=3;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
