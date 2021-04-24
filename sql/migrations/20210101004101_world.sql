DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210101004101');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210101004101');
-- Add your query below.


-- Add spawn for Ritual Candle Aura.
INSERT INTO gameobject (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`) VALUES
(262118, 179688, 429, -43.4643, 800.206, -29.5358, 0.698132, 0, 0, 0.34202, 0.939693, 900, 900, 0, 1, 2);

-- Correct faction for Ritual Candle Aura.
-- "Treasure" faction 1375 here is guessed based on when patch 1.4 was released, and the fact that it's hostile to Demon faction 90
UPDATE gameobject_template SET `faction`=1375 WHERE entry=179688;

-- Correct faction for Wheel of the Black March.
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=179672;
-- Correct faction for Doomsday Candle.
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=179673;
-- Correct faction for Bell of Dethmoora.
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=179674;
-- Correct faction for Xorothian Imp.
UPDATE creature_template SET `faction`=90 WHERE `entry`=14482;
-- Correct faction for Dread Guard.
UPDATE creature_template SET `faction`=90 WHERE `entry`=14483;

-- Remove custom trigger npc.
DELETE FROM `creature_template` WHERE `entry`=1000001;

-- Add gossip menu and correct flags for Dreadsteed Spirit.
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (5863, 7036);
UPDATE `creature_template` SET `gossip_menu_id`=5863, `npc_flags`=3, `unit_flags`=768 WHERE `entry`=14504;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
