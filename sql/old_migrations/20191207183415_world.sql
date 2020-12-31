DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191207183415');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191207183415');
-- Add your query below.


ALTER TABLE `areatrigger_teleport`
	CHANGE COLUMN `name` `name` VARCHAR(64) NOT NULL DEFAULT '' AFTER `patch`,
	ADD COLUMN `message` VARCHAR(128) NOT NULL DEFAULT '' AFTER `name`;

UPDATE `areatrigger_teleport` SET `message`='You must be at least level 20 to enter.' WHERE `id`=45;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 10 to enter.' WHERE `id`=78;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 15 to enter.' WHERE `id`=101;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 10 to enter.' WHERE `id`=145;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 10 to enter.' WHERE `id`=228;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 15 to enter.' WHERE `id`=244;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 10 to enter.', `required_level`=10 WHERE `id`=257;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 30 to enter.' WHERE `id`=286;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 15 to enter.' WHERE `id`=324;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 25 to enter.' WHERE `id`=442;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 35 to enter.' WHERE `id`=446;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 15 to enter.' WHERE `id`=523;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 20 to enter.' WHERE `id`=610;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 20 to enter.' WHERE `id`=612;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 20 to enter.' WHERE `id`=614;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 30 to enter.' WHERE `id`=902;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 35 to enter.' WHERE `id`=924;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 40 to enter.' WHERE `id`=1466;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 45 to enter.' WHERE `id`=1468;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 45 to enter.' WHERE `id`=2214;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 45 to enter.' WHERE `id`=2216;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 45 to enter.' WHERE `id`=2217;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 8 to enter.' WHERE `id`=2230;
UPDATE `areatrigger_teleport` SET `message`='You must be a Stone Guard or higher rank in order to enter the Hall of Legends.' WHERE `id`=2527;
UPDATE `areatrigger_teleport` SET `message`='You must be a Knight or higher rank in order to enter the Champions\' Hall.' WHERE `id`=2532;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 45 to enter.' WHERE `id`=2567;
UPDATE `areatrigger_teleport` SET `message`='Only the Horde may use this portal.' WHERE `id`=2606;
UPDATE `areatrigger_teleport` SET `message`='Only the Alliance may use this portal.' WHERE `id`=2608;
UPDATE `areatrigger_teleport` SET `message`='You must be part of a Raid group, at least level 50 and have the Drakefire Amulet in your inventory to enter.' WHERE `id`=2848;
UPDATE `areatrigger_teleport` SET `message`='You must be part of a Raid group and at least level 50 to enter.' WHERE `id`=2886;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 30 to enter.' WHERE `id`=3133;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 30 to enter.' WHERE `id`=3134;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 45 to enter.' WHERE `id`=3183;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 45 to enter.' WHERE `id`=3184;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 45 to enter.' WHERE `id`=3185;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 45 to enter.' WHERE `id`=3186;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 45 to enter.' WHERE `id`=3187;
UPDATE `areatrigger_teleport` SET `message`='You must be at least level 45 to enter.' WHERE `id`=3189;
UPDATE `areatrigger_teleport` SET `message`='You must be attuned and in a raid group to enter.' WHERE `id`=3528;
UPDATE `areatrigger_teleport` SET `message`='Only the Horde may use this portal.' WHERE `id`=3669;
UPDATE `areatrigger_teleport` SET `message`='Only the Alliance may use this portal.' WHERE `id`=3671;
UPDATE `areatrigger_teleport` SET `message`='You must be part of a raid group and at least 50th level to enter.', `required_level`=50 WHERE `id`=3726;
UPDATE `areatrigger_teleport` SET `message`='You must be part of a Raid group and at least level 50 to enter.' WHERE `id`=3928;
UPDATE `areatrigger_teleport` SET `message`='Only the Alliance may use this portal.' WHERE `id`=3948;
UPDATE `areatrigger_teleport` SET `message`='Only the Horde may use this portal.' WHERE `id`=3949;
UPDATE `areatrigger_teleport` SET `message`='You cannot enter here unless the gates of Ahn\'Qiraj have been opened, you are level 50+, and in a raid group.' WHERE `id`=4008;
UPDATE `areatrigger_teleport` SET `message`='You cannot enter here unless the gates of Ahn\'Qiraj have been opened, you are level 50+, and in a raid group.' WHERE `id`=4010;
UPDATE `areatrigger_teleport` SET `message`='You must be level 51+, in a Raid group, and be attuned to Naxxramas to enter.' WHERE `id`=4055;
UPDATE `areatrigger_teleport` SET `required_level`=0 WHERE `id`=2890;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
