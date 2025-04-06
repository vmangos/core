DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250305192552');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250305192552');
-- Add your query below.


UPDATE `spell_template` SET `script_name`='spell_warlock_conflagrate' WHERE `entry` IN (17962, 18930, 18931, 18932);
UPDATE `spell_template` SET `script_name`='spell_druid_ferocious_bite' WHERE `entry` IN (22568, 22827, 22828, 22829, 31018);
UPDATE `spell_template` SET `script_name`='spell_rogue_eviscerate' WHERE `entry` IN (2098, 6760, 6761, 6762, 8623, 8624, 11299, 11300, 31016) && `build` >= 5875;
UPDATE `spell_template` SET `script_name`='spell_paladin_hammer_of_wrath' WHERE `entry` IN (24239, 24274, 24275);
UPDATE `spell_template` SET `script_name`='spell_paladin_judgement_of_command_damage' WHERE `entry` IN (20467, 20963, 20964, 20965, 20966);
UPDATE `spell_template` SET `script_name`='spell_paladin_judgement_of_command_dummy' WHERE `entry` IN (20425, 20961, 20962, 20967, 20968) && `build` >= 5086;
UPDATE `spell_template` SET `script_name`='spell_paladin_holy_shock' WHERE `entry` IN (20473, 20929, 20930) && `build` >= 5086;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
