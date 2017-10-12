DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171005181506');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171005181506');
-- Add your query below.


DELETE FROM `spell_group` WHERE  `group_id`=1003 AND `group_spell_id`>2;
REPLACE INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`) VALUES (1004, 0, 24382);
REPLACE INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`) VALUES (1004, 1, 10693);
REPLACE INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`) VALUES (1004, 2, 10668);
REPLACE INTO `spell_group_stack_rules` (`group_id`) VALUES (1004);
REPLACE INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`) VALUES (1008, 0, 10693);
REPLACE INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`) VALUES (1008, 1, 10668);
REPLACE INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`) VALUES (1008, 2, 10669);
REPLACE INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`) VALUES (1008, 3, 10667);
REPLACE INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`) VALUES (1008, 4, 10692);
REPLACE INTO `spell_group_stack_rules` (`group_id`) VALUES (1008);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
