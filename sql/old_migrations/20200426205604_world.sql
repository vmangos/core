DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200426205604');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200426205604');
-- Add your query below.


-- remove unused event game object in ironforge
DELETE FROM `gameobject` WHERE `guid` IN (4771, 5051);

-- add correct position for objects inside deeprun tram.
UPDATE `gameobject` SET `position_z` = -4.3 WHERE `guid` IN (20738, 20739, 20740);

-- add correct gossip for springspindle fizzlegear
DELETE FROM `gossip_menu` WHERE `entry`=9362;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9362;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (392, 7, 202, 125, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (393, 7, 202, 200, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4150, 5168, 393);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4150, 5171, 392);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4150, 5170, 44);
UPDATE `creature_template` SET `gossip_menu_id`=4150 WHERE `entry`=5174;

-- remove quest the reason for the season (7062) from courier hammerfall (10877)
DELETE FROM `creature_questrelation` WHERE `quest` = 7062 AND `id` = 10877;

-- add light leather bracers and embossed leather pants to Gretta Finespindle
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(1466, 9066, 450, 165, 70, 0, 0, 5875),
(1466, 3786, 500, 165, 75, 0, 0, 5875);

-- remove incorrect recipes from vosur brakthel
DELETE FROM `npc_trainer` WHERE `entry` = 1246 AND `spell` NOT IN (2275,3184, 2339, 2340, 11536, 2341);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
