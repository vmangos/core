DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210129141529');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210129141529');
-- Add your query below.


-- elwynn
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1291 AND `id` = 5;

-- dun morogh
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1297 AND `id` = 4;

-- teldrassil
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1293 AND `id` = 4;

-- mulgore
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1294 AND `id` = 4;

-- tirisfal
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1296 AND `id` = 5;
INSERT INTO `gossip_menu_option`(`menu_id`, `id`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(1296, 5, 'What can I do at an inn?', 4308, 1, 1, 1221);

-- durotar
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1290 AND `id` = 5;
INSERT INTO `gossip_menu_option`(`menu_id`, `id`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(1290, 5, 'What can I do at an inn?', 4308, 1, 1, 1221);

-- fix erelas ambersky broken gossip menu option
UPDATE `gossip_menu_option` SET `action_menu_id` = 1481 WHERE `menu_id` = 1482 AND `id` = 0;

-- fix quest typo for trial of the lake
UPDATE `quest_template` SET `OfferRewardText` = 'Well now. It looks like yet another $r has successfully completed the Trial of the Lake! Well done, my young friend - well done.$B$BAs I\'ve said, my name is Tajarri. It is my duty and my privilege to serve as a warden for Moonglade, and specifically this shrine. Keeper Remulos guides the Cenarion Circle in preservation of nature and balance, and his shrine serves as a lasting tribute to such. By using the bauble here, it serves as a nod to the importance of this place within the Circle.' WHERE `entry` IN (28, 29);

-- Fix Lord Melenas spawn point. (Credit: Trinitycore)
DELETE FROM `creature` WHERE `id` = 2038;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `health_percent`, `mana_percent`, `patch_max`) VALUES
(1554, 2038, 1, 10107.08, 1206.241, 1311.55, 4.468043, 300, 300, 100, 100, 10),
(1551, 2038, 1, 10127.8, 1202.00, 1323.30, 3.01113, 300, 300, 100, 100, 10),
(1552, 2038, 1, 10127.3, 1125.23, 1338.11, 3.58055, 300, 300, 100, 100, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(108, 1, 'Lord Melenas (2038)', 10);

INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(1554, 108, 'Lord Melenas #1'),
(1551, 108, 'Lord Melenas #2'),
(1552, 108, 'Lord Melenas #3');

-- Fix Lady Sathra spawn point. (Credit: Trinitycore)
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `patch_max`) VALUES
(12597, 7319, 1, 10950.3, 1397.79, 1311.63, 2.32941, 300, 300, 5, 100, 100, 1, 10),
(73001, 7319, 1, 10980, 1731.3, 1303.1, 5.14113, 300, 300, 5, 100, 100, 1, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(109, 1, 'Lady Sathra (7319)', 10);

INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(12596, 109, 'Lady Sathra #1'),
(12597, 109, 'Lady Sathra #2'),
(73001, 109, 'Lady Sathra #3');

-- remove unused template
DELETE FROM `pool_template` WHERE `entry` = 14223;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
