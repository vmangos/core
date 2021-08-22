DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210820002058');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210820002058');
-- Add your query below.


-- Delete custom change to spell Create Relic Bundle.
DELETE FROM `spell_scripts` WHERE `id`=18987;
DELETE FROM `spell_effect_mod` WHERE `Id`=18987;

-- Remove Battle For Darrowshire script from Invisible Trigger One.
-- This npc is part of the 1.4 priest class quest and was wrongly repurposed.
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=14495;

-- Assign Battle for Darrowshire script to Relic Bundle.
UPDATE `gameobject_template` SET `script_name`='go_darrowshire_trigger' WHERE `entry`=177526;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
