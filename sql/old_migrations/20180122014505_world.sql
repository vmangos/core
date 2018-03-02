DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180122014505');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180122014505');
-- Add your query below.

-- Flurry spell chains

REPLACE INTO `spell_chain` (`spell_id`, `prev_spell`, `first_spell`, `rank`, `req_spell`) VALUES (12966, 0, 12966, 1, 0);
REPLACE INTO `spell_chain` (`spell_id`, `prev_spell`, `first_spell`, `rank`, `req_spell`) VALUES (12967, 12966, 12966, 2, 0);
REPLACE INTO `spell_chain` (`spell_id`, `prev_spell`, `first_spell`, `rank`, `req_spell`) VALUES (12968, 12967, 12966, 3, 0);
REPLACE INTO `spell_chain` (`spell_id`, `prev_spell`, `first_spell`, `rank`, `req_spell`) VALUES (12969, 12968, 12966, 4, 0);
REPLACE INTO `spell_chain` (`spell_id`, `prev_spell`, `first_spell`, `rank`, `req_spell`) VALUES (12970, 12969, 12966, 5, 0);

REPLACE INTO `spell_chain` (`spell_id`, `prev_spell`, `first_spell`, `rank`, `req_spell`) VALUES (16257, 0, 16257, 1, 0);
REPLACE INTO `spell_chain` (`spell_id`, `prev_spell`, `first_spell`, `rank`, `req_spell`) VALUES (16277, 16257, 16257, 2, 0);
REPLACE INTO `spell_chain` (`spell_id`, `prev_spell`, `first_spell`, `rank`, `req_spell`) VALUES (16278, 16277, 16257, 3, 0);
REPLACE INTO `spell_chain` (`spell_id`, `prev_spell`, `first_spell`, `rank`, `req_spell`) VALUES (16279, 16278, 16257, 4, 0);
REPLACE INTO `spell_chain` (`spell_id`, `prev_spell`, `first_spell`, `rank`, `req_spell`) VALUES (16280, 16279, 16257, 5, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
