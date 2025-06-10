DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250428111913');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250428111913');
-- Add your query below.


ALTER TABLE `characters`
	ADD COLUMN `character_flags` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `player_flags`;
  
-- AT_LOGIN_RENAME -> CHARACTER_FLAG_RENAME
UPDATE `characters` SET `character_flags`=(`character_flags` | 0x00004000) WHERE `at_login_flags` & 0x01;
-- AT_LOGIN_RESET_TALENTS -> CHARACTER_FLAG_RESET_TALENTS_ON_LOGIN
UPDATE `characters` SET `character_flags`=(`character_flags` | 0x00000100) WHERE `at_login_flags` & 0x04;
-- PLAYER_FLAGS_GM -> CHARACTER_FLAG_GM_MODE
UPDATE `characters` SET `character_flags`=(`character_flags` | 0x00020000) WHERE `player_flags` & 0x00000008;
-- PLAYER_FLAGS_GHOST -> CHARACTER_FLAG_GHOST
UPDATE `characters` SET `character_flags`=(`character_flags` | 0x00002000) WHERE `player_flags` & 0x00000010;
-- PLAYER_FLAGS_RESTING -> CHARACTER_FLAG_RESTING
UPDATE `characters` SET `character_flags`=(`character_flags` | 0x00000002) WHERE `player_flags` & 0x00000020;
-- PLAYER_FLAGS_PVP_DESIRED -> CHARACTER_FLAG_PVP_DESIRED
UPDATE `characters` SET `character_flags`=(`character_flags` | 0x00010000) WHERE `player_flags` & 0x00000200;
-- PLAYER_FLAGS_HIDE_HELM -> CHARACTER_FLAG_HIDE_HELM
UPDATE `characters` SET `character_flags`=(`character_flags` | 0x00000400) WHERE `player_flags` & 0x00000400;
-- PLAYER_FLAGS_HIDE_CLOAK -> CHARACTER_FLAG_HIDE_CLOAK
UPDATE `characters` SET `character_flags`=(`character_flags` | 0x00000800) WHERE `player_flags` & 0x00000800;

ALTER TABLE `characters`
	DROP COLUMN `player_flags`;
  
ALTER TABLE `characters`
	DROP COLUMN `at_login_flags`;

ALTER TABLE `characters`
	DROP COLUMN `is_logout_resting`;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
