DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200414202333');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200414202333');
-- Add your query below.


-- update Call of Fire (1523) to Xanis Flameweaver (5906)
UPDATE `creature_questrelation` SET `id` = 5906 WHERE `quest` = 1523;

-- remove all incorrect trainers from Elemental Mastery (8410)
DELETE FROM `creature_questrelation` WHERE `quest` = 8410 AND `id` NOT IN(3032, 13417);

-- add completion text for Stormcaller's Footguards (8621)
UPDATE `quest_template` SET `OfferRewardText` = "You've done well, $n.  You've proven you're no ordinary mortal.$b$bI give you these with the confidence they'll aid you in crushing the vile qiraji." WHERE `entry` = 8621;

-- add completion text for Stormcaller's Diadem (8623)
UPDATE `quest_template` SET `OfferRewardText` = "You've succeeded!  The whispers from the Twin Emperors have ceased.$b$bTake this as a reward.  The mere sight of it will strike fear in the hearts of the Qiraji... it shall remind them of their fallen leaders and of the mortal that slew them." WHERE `entry` = 8623;

-- add completion text for Stormcaller's Hauberk (8622)
UPDATE `quest_template` SET `OfferRewardText` = "I did not expect you to return from your attempt, $n.$b$bYou've fulfilled a destiny greater than that of most immortal beings.$b$bBy slaying C'Thun you've not only saved all of Azeroth, you've also tipped the scales of cosmic events beyond your comprehension.$b$bAccept this breastplate as a symbol of the glory and burden that will come as a consequence of your actions.$b$bMay its power aid you in the challenges that await you, god-slayer!" WHERE `entry` = 8622;

-- add completion text for Stormcaller's Leggings (8624)
UPDATE `quest_template` SET `OfferRewardText` = "Yes... the worm's skin will make for an excellent protective layer.  Combined with the strongest parts from the Qiraji we've destroyed on our way here, this should make for a formidable piece of armor.  May it aid you in facing the unspeakable horrors that await inside!" WHERE `entry` = 8624;

-- add completion text for Call of Air (1532)
UPDATE `quest_template` SET `OfferRewardText` = "For the time being, I shall give you what you need to focus your spells and to call upon the spirits of air. Take this totem, and when you are ready, train with me some more." WHERE `entry` = 1532;

-- remove quest Call of Water (2985) from Swart (3173)
DELETE FROM `creature_questrelation` WHERE `quest` = 2985 AND `id` = 3173;

-- correct template for Earth Sapta (1463) to ensure it enables/disables correctly when Call of Earth (1516) is complete
UPDATE `quest_template` SET `PrevQuestId` = -1517 WHERE `entry` = 1463;

-- correct template for Earth Sapta (1462) to ensure it enables/disables correctly when Call of Earth (1520) is complete
UPDATE `quest_template` SET `PrevQuestId` = -1520 WHERE `entry` = 1462;

-- add missing spells to Haromm (986)
DELETE FROM `npc_trainer` WHERE `entry`=986;
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(986, 1303, 100, 0, 0, 8, 0, 5875),
(986, 1304, 1800, 0, 0, 16, 0, 5875),
(986, 1305, 3500, 0, 0, 24, 0, 5875),
(986, 1315, 1800, 0, 0, 16, 0, 5875),
(986, 1324, 100, 0, 0, 8, 0, 5875),
(986, 1325, 900, 0, 0, 14, 0, 5875),
(986, 1326, 100, 0, 0, 6, 0, 5875),
(986, 1327, 800, 0, 0, 12, 0, 5875),
(986, 1333, 720, 0, 0, 12, 0, 5875),
(986, 1338, 6000, 0, 0, 28, 0, 5875),
(986, 1339, 8000, 0, 0, 32, 0, 5875),
(986, 1340, 12000, 0, 0, 40, 0, 5875),
(986, 1345, 4000, 0, 0, 26, 0, 5875),
(986, 1352, 7000, 0, 0, 30, 0, 5875),
(986, 1354, 2000, 0, 0, 18, 0, 5875),
(986, 1355, 3500, 0, 0, 24, 0, 5875),
(986, 1356, 8000, 0, 0, 32, 0, 5875),
(986, 1357, 2200, 0, 0, 20, 0, 5875),
(986, 1358, 4000, 0, 0, 26, 0, 5875),
(986, 1363, 8000, 0, 0, 32, 0, 5875),
(986, 1444, 12000, 0, 0, 40, 0, 5875),
(986, 2014, 800, 0, 0, 12, 0, 5875),
(986, 2076, 100, 0, 0, 6, 0, 5875),
(986, 2862, 22000, 0, 0, 48, 0, 5875),
(986, 2863, 30000, 0, 0, 56, 0, 5875),
(986, 2874, 900, 0, 0, 14, 0, 5875),
(986, 5386, 3000, 0, 0, 22, 0, 5875),
(986, 5387, 2200, 0, 0, 20, 0, 5875),
(986, 5678, 4000, 0, 0, 26, 0, 5875),
(986, 5731, 100, 0, 0, 8, 0, 5875),
(986, 6043, 8000, 0, 0, 32, 0, 5875),
(986, 6379, 2200, 0, 0, 20, 0, 5875),
(986, 6380, 7000, 0, 0, 30, 0, 5875),
(986, 6381, 12000, 0, 0, 40, 0, 5875),
(986, 6383, 7000, 0, 0, 30, 0, 5875),
(986, 6384, 12000, 0, 0, 40, 0, 5875),
(986, 6400, 2000, 0, 0, 18, 0, 5875),
(986, 6401, 6000, 0, 0, 28, 0, 5875),
(986, 6402, 11000, 0, 0, 38, 0, 5875),
(986, 6496, 9000, 0, 0, 34, 0, 5875),
(986, 8006, 12000, 0, 0, 40, 0, 5875),
(986, 8007, 2200, 0, 0, 20, 0, 5875),
(986, 8009, 6000, 0, 0, 28, 0, 5875),
(986, 8011, 10000, 0, 0, 36, 0, 5875),
(986, 8013, 7200, 0, 0, 32, 0, 5875),
(986, 8020, 10, 0, 0, 1, 0, 5875),
(986, 8021, 100, 0, 0, 8, 0, 5875),
(986, 8022, 1800, 0, 0, 16, 0, 5875),
(986, 8025, 400, 0, 0, 10, 0, 5875),
(986, 8031, 2000, 0, 0, 18, 0, 5875),
(986, 8032, 4000, 0, 0, 26, 0, 5875),
(986, 8035, 2200, 0, 0, 20, 0, 5875),
(986, 8039, 6000, 0, 0, 28, 0, 5875),
(986, 8043, 100, 0, 0, 4, 0, 5875),
(986, 8047, 100, 0, 0, 8, 0, 5875),
(986, 8048, 900, 0, 0, 14, 0, 5875),
(986, 8049, 3500, 0, 0, 24, 0, 5875),
(986, 8051, 400, 0, 0, 10, 0, 5875),
(986, 8054, 2000, 0, 0, 18, 0, 5875),
(986, 8055, 6000, 0, 0, 28, 0, 5875),
(986, 8057, 2200, 0, 0, 20, 0, 5875),
(986, 8059, 9000, 0, 0, 34, 0, 5875),
(986, 8077, 400, 0, 0, 10, 0, 5875),
(986, 8086, 800, 0, 0, 12, 0, 5875),
(986, 8135, 12000, 0, 0, 40, 0, 5875),
(986, 8144, 2000, 0, 0, 18, 0, 5875),
(986, 8158, 900, 0, 0, 14, 0, 5875),
(986, 8159, 3500, 0, 0, 24, 0, 5875),
(986, 8164, 3500, 0, 0, 24, 0, 5875),
(986, 8165, 11000, 0, 0, 38, 0, 5875),
(986, 8169, 3000, 0, 0, 22, 0, 5875),
(986, 8173, 11000, 0, 0, 38, 0, 5875),
(986, 8180, 7000, 0, 0, 30, 0, 5875),
(986, 8183, 3500, 0, 0, 24, 0, 5875),
(986, 8186, 6000, 0, 0, 28, 0, 5875),
(986, 8189, 4000, 0, 0, 26, 0, 5875),
(986, 8231, 6000, 0, 0, 28, 0, 5875),
(986, 8234, 7000, 0, 0, 30, 0, 5875),
(986, 8237, 12000, 0, 0, 40, 0, 5875),
(986, 8252, 11000, 0, 0, 38, 0, 5875),
(986, 8500, 3000, 0, 0, 22, 0, 5875),
(986, 8501, 8000, 0, 0, 32, 0, 5875),
(986, 8513, 8000, 0, 0, 32, 0, 5875),
(986, 8738, 12000, 0, 0, 40, 0, 5875),
(986, 8837, 16000, 0, 0, 42, 0, 5875),
(986, 10393, 11000, 0, 0, 38, 0, 5875),
(986, 10394, 18000, 0, 0, 44, 0, 5875),
(986, 10397, 22000, 0, 0, 48, 0, 5875),
(986, 10398, 30000, 0, 0, 56, 0, 5875),
(986, 10401, 3500, 0, 0, 24, 0, 5875),
(986, 10402, 9000, 0, 0, 34, 0, 5875),
(986, 10409, 9000, 0, 0, 34, 0, 5875),
(986, 10410, 18000, 0, 0, 44, 0, 5875),
(986, 10411, 29000, 0, 0, 54, 0, 5875),
(986, 10415, 10000, 0, 0, 36, 0, 5875),
(986, 10416, 22000, 0, 0, 48, 0, 5875),
(986, 10417, 34000, 0, 0, 60, 0, 5875),
(986, 10429, 22000, 0, 0, 48, 0, 5875),
(986, 10430, 32000, 0, 0, 58, 0, 5875),
(986, 10433, 22000, 0, 0, 48, 0, 5875),
(986, 10434, 30000, 0, 0, 56, 0, 5875),
(986, 10439, 24000, 0, 0, 50, 0, 5875),
(986, 10440, 34000, 0, 0, 60, 0, 5875),
(986, 10443, 27000, 0, 0, 52, 0, 5875),
(986, 10446, 10000, 0, 0, 36, 0, 5875),
(986, 10449, 12000, 0, 0, 40, 0, 5875),
(986, 10450, 27000, 0, 0, 52, 0, 5875),
(986, 10457, 11000, 0, 0, 38, 0, 5875),
(986, 10464, 24000, 0, 0, 50, 0, 5875),
(986, 10465, 34000, 0, 0, 60, 0, 5875),
(986, 10469, 18000, 0, 0, 44, 0, 5875),
(986, 10470, 27000, 0, 0, 52, 0, 5875),
(986, 10471, 34000, 0, 0, 60, 0, 5875),
(986, 10474, 20000, 0, 0, 46, 0, 5875),
(986, 10475, 32000, 0, 0, 58, 0, 5875),
(986, 10480, 11000, 0, 0, 38, 0, 5875),
(986, 10481, 29000, 0, 0, 54, 0, 5875),
(986, 10488, 24000, 0, 0, 50, 0, 5875),
(986, 10512, 10000, 0, 0, 36, 0, 5875),
(986, 10514, 20000, 0, 0, 46, 0, 5875),
(986, 10515, 30000, 0, 0, 56, 0, 5875),
(986, 10528, 22000, 0, 0, 48, 0, 5875),
(986, 10540, 16000, 0, 0, 42, 0, 5875),
(986, 10541, 32000, 0, 0, 58, 0, 5875),
(986, 10588, 10000, 0, 0, 36, 0, 5875),
(986, 10589, 20000, 0, 0, 46, 0, 5875),
(986, 10590, 30000, 0, 0, 56, 0, 5875),
(986, 10597, 7000, 0, 0, 30, 0, 5875),
(986, 10602, 18000, 0, 0, 44, 0, 5875),
(986, 10603, 34000, 0, 0, 60, 0, 5875),
(986, 10615, 16000, 0, 0, 42, 0, 5875),
(986, 10616, 27000, 0, 0, 52, 0, 5875),
(986, 10624, 20000, 0, 0, 46, 0, 5875),
(986, 10625, 29000, 0, 0, 54, 0, 5875),
(986, 10628, 30000, 0, 0, 56, 0, 5875),
(986, 11316, 16000, 0, 0, 42, 0, 5875),
(986, 11317, 27000, 0, 0, 52, 0, 5875),
(986, 15113, 10000, 0, 0, 36, 0, 5875),
(986, 15115, 20000, 0, 0, 46, 0, 5875),
(986, 15116, 30000, 0, 0, 56, 0, 5875),
(986, 15209, 24000, 0, 0, 50, 0, 5875),
(986, 15210, 30000, 0, 0, 56, 0, 5875),
(986, 16317, 18000, 0, 0, 44, 0, 5875),
(986, 16318, 29000, 0, 0, 54, 0, 5875),
(986, 16347, 20000, 0, 0, 46, 0, 5875),
(986, 16348, 30000, 0, 0, 56, 0, 5875),
(986, 16357, 22000, 0, 0, 48, 0, 5875),
(986, 16358, 32000, 0, 0, 58, 0, 5875),
(986, 16363, 34000, 0, 0, 60, 0, 5875),
(986, 16394, 32000, 0, 0, 58, 0, 5875),
(986, 17362, 4400, 0, 0, 48, 0, 5875),
(986, 17363, 7200, 0, 0, 58, 0, 5875),
(986, 20613, 7000, 0, 0, 30, 0, 5875),
(986, 20778, 3500, 0, 0, 24, 0, 5875),
(986, 20779, 10000, 0, 0, 36, 0, 5875),
(986, 20780, 22000, 0, 0, 48, 0, 5875),
(986, 20781, 34000, 0, 0, 60, 0, 5875),
(986, 25910, 24000, 0, 0, 50, 5086, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
