DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230706101514');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230706101514');
-- Add your query below.


-- These mobs do not have any waypoints in table. Set to idle to fix errors.
UPDATE `creature` SET `movement_type`=0 WHERE `guid` IN (54575, 54574, 54567, 54326);

-- Define targets for spell Placing Beacon Torch.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES (17016, 0, 176094, 0);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES (17016, 0, 176095, 0);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES (17016, 0, 176096, 0);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES (17016, 0, 176097, 0);

-- Define targets for spell Egan's Blaster Effect.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES (17372, 1, 10384, 0);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES (17372, 1, 10385, 0);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES (17372, 1, 11122, 0);

-- Define targets for spell Displacing Temporal Rift.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES (16613, 0, 175795, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
