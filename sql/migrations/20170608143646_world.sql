INSERT INTO `migrations` VALUES ('20170608143646');

-- Update quests that are started by a quest, but don't have the quest-starting item listed.

-- Captain Sander's Hidden Treasure
UPDATE `quest_template` SET `SrcItemId` = 1357 WHERE `entry` = 136;
-- Message in a Bottle
UPDATE `quest_template` SET `SrcItemId` = 4098 WHERE `entry` = 594;
-- Cortello's Riddle
UPDATE `quest_template` SET `SrcItemId` = 4056 WHERE `entry` = 624;
-- Tanaris Field Sampling
UPDATE `quest_template` SET `SrcItemId` = 8524 WHERE `entry` = 654;
-- The Tome of Divinity (Stormwind)
UPDATE `quest_template` SET `SrcItemId` = 6775 WHERE `entry` = 1642;
-- The Tome of Divinity (Ironforge)
UPDATE `quest_template` SET `SrcItemId` = 6916 WHERE `entry` = 1646;
-- The Tome of Valor
UPDATE `quest_template` SET `SrcItemId` = 6776 WHERE `entry` = 1649;
-- Cuergo's Gold
UPDATE `quest_template` SET `SrcItemId` = 9245 WHERE `entry` = 2882;
-- Glyphic Rune
UPDATE `quest_template` SET `SrcItemId` = 9572  WHERE `entry` = 3111;
-- Assassination Plot
UPDATE `quest_template` SET `SrcItemId` = 12564 WHERE `entry` = 4881;
-- Warlord's Command
UPDATE `quest_template` SET `SrcItemId` = 12562 WHERE `entry` = 4903;
-- Ammo for Rumbleshot
UPDATE `quest_template` SET `SrcItemId` = 13850 WHERE `entry` = 5541;
-- Blackhand's Command
UPDATE `quest_template` SET `SrcItemId` = 18987 WHERE `entry` = 7761;
