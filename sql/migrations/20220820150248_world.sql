DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220820150248');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220820150248');
-- Add your query below.

-- New bell guids
SET @BELL1 := 60000;
SET @BELL2 := 60001;
SET @BELL3 := 60002;

-- Missing alliance bell spawns
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@BELL1,176573,1,-3667.09,-4754,1.80047,2.26893,0,0,0.906307,0.422619,900,900,100,1,0,0,0,10),    -- Theramore Lighthouse
(@BELL2,176573,0,-8463.69,592.138,94.8484,0.401425,0,0,0.199368,0.979925,900,900,100,1,0,0,0,10), -- Stormwind (Dwarven District)
(@BELL3,176573,0,-8998.99,852.309,105.596,0.872664,0,0,0.422618,0.906308,900,900,100,1,0,0,0,10); -- Stormwind (Mage Quarter)

-- Link to hourly bell event
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@BELL1,78),
(@BELL2,78),
(@BELL3,78);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
