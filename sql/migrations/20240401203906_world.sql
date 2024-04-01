DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240401203906');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240401203906');
-- Add your query below.


-- CREATURE_FLAG_EXTRA_NO_LEASH_EVADE from 0x10000000 to 0x00000001
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` | 0x00000001) WHERE (`flags_extra` & 0x10000000);
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` & ~0x10000000) WHERE (`flags_extra` & 0x10000000);

-- CREATURE_FLAG_EXTRA_APPEAR_DEAD from 0x08000000 to 0x00004000
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` | 0x00004000) WHERE (`flags_extra` & 0x08000000);
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` & ~0x08000000) WHERE (`flags_extra` & 0x08000000);

-- CREATURE_FLAG_EXTRA_NO_UNREACHABLE_EVADE from 0x04000000 to 0x00000008
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` | 0x00000008) WHERE (`flags_extra` & 0x04000000);
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` & ~0x04000000) WHERE (`flags_extra` & 0x04000000);

-- CREATURE_FLAG_EXTRA_NO_MOVEMENT_PAUSE from 0x01000000 to 0x00000020
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` | 0x00000020) WHERE (`flags_extra` & 0x01000000);
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` & ~0x01000000) WHERE (`flags_extra` & 0x01000000);

-- CREATURE_FLAG_EXTRA_ALWAYS_RUN from 0x02000000 to 0x00000040
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` | 0x00000040) WHERE (`flags_extra` & 0x02000000);
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` & ~0x02000000) WHERE (`flags_extra` & 0x02000000);

-- CREATURE_FLAG_EXTRA_GIGANTIC_AOI from 0x00400000 to 0x00000100
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` | 0x00000100) WHERE (`flags_extra` & 0x00400000);
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` & ~0x00400000) WHERE (`flags_extra` & 0x00400000);

-- CREATURE_FLAG_EXTRA_INFINITE_AOI from 0x00800000 to 0x00000200
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` | 0x00000200) WHERE (`flags_extra` & 0x00800000);
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` & ~0x00800000) WHERE (`flags_extra` & 0x00800000);

-- CREATURE_FLAG_EXTRA_CAN_ASSIST from 0x00100000 to 0x00080000
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` | 0x00080000) WHERE (`flags_extra` & 0x00100000);
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` & ~0x00100000) WHERE (`flags_extra` & 0x00100000);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
