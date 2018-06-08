DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180508082231');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180508082231');
-- Add your query below.


-- Fix gossip options for Duke Hydraxis.
DELETE FROM `conditions` WHERE `condition_entry` BETWEEN 200 and 236;
INSERT INTO `conditions` VALUES
(4200, 8, 6805, 0, 0), -- completed quest 6805
(4201, 8, 6824, 0, 0), -- completed quest 6824
(4202, 8, 6824, 0, 1), -- not completed quest 6824
(4203, 5, 749, 5, 0), -- reputation Honored with Hydraxian Waterlords
(4204, 5, 749, 6, 0), -- reputation Revered with Hydraxian Waterlords
(4205, 23, 17333, 1, 1), -- NOT has item Aqual Quintessence
(4206, 23, 22754, 1, 1), -- NOT has item Eternal Quintessence
(4207, -1, 4200, 4202, 0), -- completed quest 6805 and not completed quest 6824
(4208, -1, 4201, 4203, 0), -- completed quest 6824 and reputation Honored with Hydraxian Waterlords
(4209, -1, 4019, 4204, 0), -- PATCH 1.11 or above and reputation Revered with Hydraxian Waterlords
(4210, -1, 4019, 4204, 1), -- NOT (PATCH 1.11 or above and reputation Revered with Hydraxian Waterlords)
(4211, -1, 4205, 4208, 0), -- completed quest 6824 and reputation Honored with Hydraxian Waterlords and NOT has item Aqual Quintessence
(4212, -1, 4208, 4210, 0), -- completed quest 6824 and reputation Honored with Hydraxian Waterlords and NOT (PATCH 1.11 or above and reputation Revered with Hydraxian Waterlords)
(4213, -1, 4209, 4201, 0), -- PATCH 1.11 or above and reputation Revered with Hydraxian Waterlords and completed quest 6824
(4214, -1, 4213, 4206, 0); -- PATCH 1.11 or above and reputation Revered with Hydraxian Waterlords and completed quest 6824 and NOT has item Eternal Quintessence
DELETE FROM `gossip_menu` WHERE `entry`=5065;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(5065, 6108, 0),
(5065, 6109, 4207),
(5065, 6158, 4212),
(5065, 8541, 4214),
(5065, 8542, 4213);
UPDATE `gossip_menu_option` SET `condition_id`=4211 WHERE `menu_id`=5065 && `id`=0;
UPDATE `gossip_menu_option` SET `condition_id`=4214 WHERE `menu_id`=5065 && `id`=1;

-- Use proper spells to give the quintessences.
DELETE FROM `gossip_scripts` WHERE `id`=50650;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (50650, 0, 15, 21357, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Duke Hydraxis - Give Player an Aqual Quintessence');
DELETE FROM `gossip_scripts` WHERE `id`=50651;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (50651, 0, 15, 28439, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Duke Hydraxis - Give Player an Eternal Quintessence');

-- Quest: A Hero's Reward was added in patch 1.3.
-- World of Warcraft Client Patch 1.3.0 (2005-03-22)
-- "End quest added to Hydraxis quest line, offering players a reward."
-- https://web.archive.org/web/20060507082239/http://wow.allakhazam.com:80/db/quest.html?wquest=7486
-- Added: Mar 22nd, 2005
-- https://web.archive.org/web/20050323200554/http://wow.allakhazam.com:80/db/item.html?witem=18399
-- Updated: 2005-03-22 20:59:22
-- https://web.archive.org/web/20060303075418/http://wow.allakhazam.com:80/db/itemhistory.html?witem=18398
-- 2005-03-22 21:08:12 	Initial Entry
UPDATE `quest_template` SET `patch`=1 WHERE `entry`=7486;
UPDATE `creature_questrelation` SET `patch`=1 WHERE `quest`=7486;
UPDATE `gameobject_involvedrelation` SET `patch`=1 WHERE `quest`=7486;
UPDATE `gameobject_template` SET `patch`=1 WHERE `entry`=179551;
UPDATE `gameobject` SET `patch_min`=1 WHERE `id`=179551;
UPDATE `item_template` SET `patch`=1 WHERE `entry` IN (18398, 18399);

-- ERROR:Table `npc_vendor` for vendor 13217 contain nonexistent item (19030), ignoring
-- ERROR:Table `npc_vendor` for vendor 13216 contain nonexistent item (19030), ignoring
INSERT INTO `forbidden_items` (`entry`, `patch`, `AfterOrBefore`) VALUES (19030, 2, 1);

-- ERROR:Creature (Entry: 12795) has vendor_id = 1279502 for nonexistent vendor template
-- ERROR:Creature (Entry: 12785) has vendor_id = 1278502 for nonexistent vendor template
-- ERROR:Creature (Entry: 12784) has vendor_id = 1278402 for nonexistent vendor template
-- ERROR:Creature (Entry: 12794) has vendor_id = 1279402 for nonexistent vendor template
UPDATE `creature_template` SET `patch`=2 WHERE `patch`=0 && `entry` IN (12795, 12785, 12784, 12794);
UPDATE `creature_template_addon` SET `patch`=2 WHERE `entry` IN (12795, 12785, 12784, 12794);

-- ERROR:Table 'gameobject_loot_template' entry 16719 isn't gameobject lootid and not referenced from loot, and then useless.
UPDATE `item_template` SET `patch`=7 WHERE `entry`=20951;
INSERT INTO `forbidden_items` (`entry`, `patch`, `AfterOrBefore`) VALUES (20951, 6, 1);

-- Fix Catherine Leland's vendor menu not showing.
UPDATE `creature_template` SET `gossip_menu_id`=685 WHERE `entry`=5494;
DELETE FROM `gossip_menu` WHERE `entry`=50005;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=50005;

-- Fix Sneed not spawning.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (64202, 64203);
DELETE FROM `creature_ai_events` WHERE `creature_id`=642;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (64201, 642, 0, 6, 0, 100, 0, 0, 0, 0, 0, 64201, 0, 0, 'Sneed\'s Shredder - Cast Eject Sneed on Creature Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=64201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (64201, 0, 15, 5141, 7, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sneed\'s Shredder - Cast Spell Eject Sneed');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (6420, 'Deadmines - Sneed\'s Shredder', 3603, 100, 1, 0, 0, 0, 8, 12, 48, 54, 0, 7399, 100, 1, 0, 0, 0, 9, 14, 15, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (6430, 'Deadmines - Sneed', 6713, 100, 1, 0, 0, 0, 7, 17, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spells_template`=6420, `AIName`='EventAI' WHERE `entry`=642;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
