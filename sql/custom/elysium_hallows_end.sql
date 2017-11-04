-- This is a custom patch to enable the Hallow's End event on the Elysium realm.
-- TO BE USED ONLY ON ELYSIUM REALM. Not needed in others since they are past 1.8.

UPDATE `game_event` SET `patch_min`=0 WHERE `entry`=12;

-- Quests.
DELETE FROM `quest_template` WHERE (`Title` LIKE "%DISABLED%") && `patch`=0 && `entry` IN (SELECT `quest` FROM `game_event_quest` WHERE `event`=12);
UPDATE `quest_template` SET `patch`=0 WHERE `patch`=6 && `entry` IN (SELECT `quest` FROM `game_event_quest` WHERE `event`=12);
UPDATE `creature_involvedrelation` SET `patch`=0 WHERE `patch`=6 && `quest` IN (SELECT `quest` FROM `game_event_quest` WHERE `event`=12);
UPDATE `creature_questrelation` SET `patch`=0 WHERE `patch`=6 && `quest` IN (SELECT `quest` FROM `game_event_quest` WHERE `event`=12);
UPDATE `game_event_quest` SET `patch`=0 WHERE `patch`=6 && `event`=12;

-- Creatures.
UPDATE `creature` SET `patch_min`=0 WHERE `guid` IN (SELECT `guid` FROM `game_event_creature` WHERE `event`=12);

-- Items.
UPDATE `item_template` SET `patch`=0 WHERE `entry` IN (20388, 20389, 20390, 20391, 20392, 20393, 20397, 20398, 20399, 20409, 20410, 20411, 20413, 20414, 20516, 20561, 20562, 20563, 20564, 20565, 20566, 20567, 20568, 20569, 20570, 20571, 20572, 20573, 20574);
DELETE FROM `forbidden_items` WHERE `entry` IN (20388, 20389, 20390, 20391, 20392, 20393, 20397, 20398, 20399, 20409, 20410, 20411, 20413, 20414, 20516, 20561, 20562, 20563, 20564, 20565, 20566, 20567, 20568, 20569, 20570, 20571, 20572, 20573, 20574);
