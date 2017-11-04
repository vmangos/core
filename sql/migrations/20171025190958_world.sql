DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171025190958');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171025190958');
-- Add your query below.


-- Missing creature spawns.
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `patch_min`, `patch_max`) VALUES (160014, 15197, 0, 0, 0, 1732.31, 520.874, 36.3326, 1.30942, 300, 0, 0, 9763, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `patch_min`, `patch_max`) VALUES (160015, 15199, 0, 0, 0, -826.324, -532.834, 14.45, 0.470631, 300, 0, 0, 9763, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `patch_min`, `patch_max`) VALUES (85632, 15195, 0, 0, 0, 1713.1, 511.295, 37.2005, 1.48063, 300, 0, 0, 9763, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `patch_min`, `patch_max`) VALUES (85633, 15195, 0, 0, 0, 1750.57, 511.697, 37.7587, 1.25444, 300, 0, 0, 9763, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `patch_min`, `patch_max`) VALUES (85634, 15195, 0, 0, 0, 1729.05, 552.65, 34.3029, 4.54388, 300, 0, 0, 9763, 0, 0, 0, 6, 10);
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `patch_min`, `patch_max`) VALUES (86235, 15353, 0, 0, 0, -4918.64, -983.141, 501.538, 2.43867, 120, 0, 0, 1605, 0, 0, 0, 6, 10);

-- These spawns don't have the correct patch.
UPDATE `creature` SET `patch_min`=6 WHERE `guid`=86169;
UPDATE `creature` SET `patch_min`=6 WHERE `guid`=86234;
UPDATE `creature` SET `patch_min`=6 WHERE `guid`=99966;

-- Spoops is not an innkeeper.
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=15309;
-- Gossip and items for Darkcaller Yanka.
UPDATE `creature_template` SET `npcflag`=7, `gossip_menu_id`=6537, `equipment_id`=15197 WHERE `entry`=15197;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (15197, 13069, 0, 0);
INSERT INTO `conditions` VALUES (1372, 8, 1657, 0);
INSERT INTO `gossip_menu` VALUES (6537, 7740, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6537, 0, 1, 'I want to buy another stink bomb!', 3, 4, 0, 0, 0, 0, 0, NULL, 1372);
INSERT INTO `locales_gossip_menu_option` (`menu_id`, `id`, `option_text_loc1`, `option_text_loc2`, `option_text_loc3`, `option_text_loc4`, `option_text_loc5`, `option_text_loc6`, `option_text_loc7`, `option_text_loc8`, `box_text_loc1`, `box_text_loc2`, `box_text_loc3`, `box_text_loc4`, `box_text_loc5`, `box_text_loc6`, `box_text_loc7`, `box_text_loc8`) VALUES (6537, 0, '구린내 폭탄을 더 구입하고 싶습니다!', 'Je veux acheter une autre boule puante !', 'Ich möchte eine weitere Stinkbombe kaufen!', '我想再买一个臭气弹！', '我想再買一個臭彈!', '¡Quiero comprar otra bomba fétida!', '¡Quiero comprar otra bomba fétida!', 'Я хочу купить еще одну бомбу-вонючку!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (15197, 20387, 0, 0);
-- Gossip and items for Sergeant Hartman.
UPDATE `creature_template` SET `npcflag`=7, `gossip_menu_id`=6538, `equipment_id`=15199 WHERE `entry`=15199;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (15199, 12890, 11041, 0);
INSERT INTO `conditions` VALUES (1373, 8, 8373, 0);
INSERT INTO `gossip_menu` VALUES (6538, 7741, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6538, 0, 1, 'Sergeant Hartman!  I need to buy another stink bomb cleaner!', 3, 4, 0, 0, 0, 0, 0, NULL, 1373);
INSERT INTO `locales_gossip_menu_option` (`menu_id`, `id`, `option_text_loc1`, `option_text_loc2`, `option_text_loc3`, `option_text_loc4`, `option_text_loc5`, `option_text_loc6`, `option_text_loc7`, `option_text_loc8`, `box_text_loc1`, `box_text_loc2`, `box_text_loc3`, `box_text_loc4`, `box_text_loc5`, `box_text_loc6`, `box_text_loc7`, `box_text_loc8`) VALUES (6538, 0, '하사관 허트만! 구린내 폭탄 탈취제를 구입하고 싶습니다!', 'Sergent Hartman ! Je dois acheter un nouveau nettoyeur de boules puantes !', 'Unteroffizier Hartman! Ich benötige noch einen weiteren Stinkbombenreiniger.', '哈特曼中士！我要再买一个臭气弹清洁器！', '哈特曼中士!我要再買一個臭彈清潔器!', '¡Sargento Hartman! ¡Necesito comprar otro limpiador de bombas fétidas!', '¡Sargento Hartman! ¡Necesito comprar otro limpiador de bombas fétidas!', 'Сержант Дыгал! Я хочу купить еще один очиститель бомб-вонючек!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (15199, 20604, 0, 0);
-- Equipment for Katrina Shimmerstar.
UPDATE `creature_template` SET `equipment_id`=15353 WHERE `entry`=15353;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (15353, 1906, 12857, 0);

-- Adding Hallow's End spawns to the event.
DELETE FROM `game_event_creature` WHERE `event`=12;
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (86169, 12);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (86234, 12);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (160014, 12);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (160015, 12);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (86235, 12);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (85632, 12);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (85633, 12);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (85634, 12);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (99966, 12);

-- Add gameobject template for Wickerman Guardian Ember.
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (180574, 2, 6421, 'Wickerman Guardian Ember', 0, 0, 5, 43, 0, 0, 6535, 0, 0, 19700, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Adding Hallow's End quests to the event.
DELETE FROM `game_event_quest` WHERE `event`=12;
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (1657, 12, 6);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (1658, 12, 6);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8311, 12, 6);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8312, 12, 6);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8322, 12, 6);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8353, 12, 6);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8354, 12, 6);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8355, 12, 6);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8356, 12, 6);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8357, 12, 6);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8358, 12, 6);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8359, 12, 6);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8360, 12, 6);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8373, 12, 6);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8409, 12, 6);

-- Update wrong data for some of the quests.
UPDATE `creature_questrelation` SET `patch`=6 WHERE `quest`=1657;
UPDATE `creature_involvedrelation` SET `patch`=6 WHERE `quest`=1658;
UPDATE `quest_template` SET `patch`=6, `MinLevel`=25, `QuestLevel`=60 WHERE `entry`=1657;
UPDATE `quest_template` SET `patch`=6, `MinLevel`=35, `QuestLevel`=60 WHERE `entry`=1658;
UPDATE `quest_template` SET `MinLevel`=10, `QuestLevel`=60 WHERE `entry`=8311 && `patch`=6;
UPDATE `quest_template` SET `MinLevel`=10, `QuestLevel`=60 WHERE `entry`=8312 && `patch`=6;
UPDATE `quest_template` SET `MinLevel`=30, `QuestLevel`=60 WHERE `entry`=8322 && `patch`=6;
UPDATE `quest_template` SET `MinLevel`=25, `QuestLevel`=60 WHERE `entry`=8373 && `patch`=6;
UPDATE `quest_template` SET `MinLevel`=25, `QuestLevel`=60 WHERE `entry`=8409 && `patch`=6;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
