DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200409171600');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200409171600');
-- Add your query below.


-- remove all incorrect trainers from An Imps Request (8419) Richard Kerwin (4565), Luther Pickman (4564), Ursula Deline (5495), Sandahl (5496), Thistleheart (5171), Alexander Calder (5173), Grol'dar (3324), Mirket (3325) and Kartosh (988)
DELETE FROM `creature_questrelation` WHERE `quest` = 8419 AND `id` NOT IN(461,3326,4563);

-- add An Imps Request (8419) to Briarthorn (5172)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (5172, 8419, 6, 10);

-- add In Search of Menara Voidrender (4736) to Briarthorn (5172)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (5172, 4736, 0, 10);

-- remove quest Mor'zul Bloodbringer (7562) from Greshka (12807)
DELETE FROM `creature_questrelation` WHERE `quest` = 7562 AND `id` = 12807;

-- add Mor'zul Bloodbringer (7562) to Martha Strain (5753)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (5753, 7562, 2, 10);

-- remove In Search of Menara Voidrender (3326) from Zervost (3326)
DELETE FROM `creature_questrelation` WHERE `quest` = 4736 AND `id` = 3326;

-- add correct completion text for Gakin's Summons (1717)
UPDATE `quest_template` SET `OfferRewardText` = "I'm glad someone was able to get a hold of you, $n. I was beginning to fear the worst. It would be a shame to lose you, after the time we've invested in you.$b$bWe can talk later, though. Your training is the only important thing now." WHERE `entry` = 1717;

-- remove Grimoire of Lash of Pain (Rank 6) from Cylina Darkheart (6374)
DELETE FROM `npc_vendor` WHERE `entry` = 6374 AND `item` = 16374;

-- remove Grimoire of Soothing Kiss (Rank 2) from Wren Darkspring (6376)
DELETE FROM `npc_vendor` WHERE `entry` = 6376 AND `item` = 16376;

-- remove Grimoire of Lash of Pain (Rank 5) from Dane Winslow (6373)
DELETE FROM `npc_vendor` WHERE `entry` = 6373 AND `item` = 16373;

-- add Devour Magic Rank 3 (16382) to Martha Strain (5753)
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`, `itemflags`) VALUES (5753, 16382, 0, 0, 0);

-- add Devour Magic Rank 3 (16382) to Kurgul (5815)
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`, `itemflags`) VALUES (5815, 16382, 0, 0, 0);

-- add Devour Magic Rank 3 (16382) to Spackle Thornberry (5520)
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`, `itemflags`) VALUES (5520, 16382, 0, 0, 0);

-- add Helfire Rank 1 (5709) to Kartosh (988)
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES (988, 5709, 6000, 0, 0, 30, 0, 5875);

-- add missing spells to Richard Kerwin (4565)
DELETE FROM `npc_trainer` WHERE `entry`=4565;
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(4565, 1197, 5000, 0, 0, 28, 0, 5875),
(4565, 607, 9000, 0, 0, 36, 0, 5875),
(4565, 1296, 200, 0, 0, 8, 0, 5875),
(4565, 1297, 1500, 0, 0, 18, 0, 5875),
(4565, 1367, 900, 0, 0, 14, 0, 5875),
(4565, 1368, 2500, 0, 0, 22, 0, 5875),
(4565, 1369, 6000, 0, 0, 30, 0, 5875),
(4565, 1374, 10, 0, 0, 1, 0, 5875),
(4565, 1375, 300, 0, 0, 10, 0, 5875),
(4565, 1376, 2000, 0, 0, 20, 0, 5875),
(4565, 1377, 1500, 0, 0, 18, 0, 5875),
(4565, 1381, 100, 0, 0, 6, 0, 5875),
(4565, 1382, 600, 0, 0, 12, 0, 5875),
(4565, 1383, 300, 0, 0, 10, 0, 5875),
(4565, 1384, 2000, 0, 0, 20, 0, 5875),
(4565, 1393, 100, 0, 0, 4, 0, 5875),
(4565, 1394, 600, 0, 0, 12, 0, 5875),
(4565, 1404, 6000, 0, 0, 30, 0, 5875),
(4565, 1406, 2000, 0, 0, 20, 0, 5875),
(4565, 1407, 5000, 0, 0, 28, 0, 5875),
(4565, 1476, 100, 0, 0, 6, 0, 5875),
(4565, 1477, 1200, 0, 0, 16, 0, 5875),
(4565, 1478, 4000, 0, 0, 26, 0, 5875),
(4565, 1571, 14000, 0, 0, 48, 0, 5875),
(4565, 1572, 11000, 0, 0, 42, 0, 5875),
(4565, 2942, 6000, 0, 0, 30, 0, 5875),
(4565, 2945, 1500, 0, 0, 18, 0, 5875),
(4565, 2971, 4000, 0, 0, 26, 0, 5875),
(4565, 2972, 10000, 0, 0, 38, 0, 5875),
(4565, 3704, 600, 0, 0, 12, 0, 5875),
(4565, 3705, 2000, 0, 0, 20, 0, 5875),
(4565, 3706, 5000, 0, 0, 28, 0, 5875),
(4565, 3707, 9000, 0, 0, 36, 0, 5875),
(4565, 5139, 3000, 0, 0, 24, 0, 5875),
(4565, 5486, 11000, 0, 0, 40, 0, 5875),
(4565, 5501, 3000, 0, 0, 24, 0, 5875),
(4565, 5698, 1200, 0, 0, 16, 0, 5875),
(4565, 5700, 8000, 0, 0, 34, 0, 5875),
(4565, 5702, 13000, 0, 0, 46, 0, 5875),
(4565, 5709, 6000, 0, 0, 30, 0, 5875),
(4565, 5736, 4000, 0, 0, 26, 0, 5875),
(4565, 5741, 2000, 0, 0, 20, 0, 5875),
(4565, 5783, 200, 0, 0, 8, 0, 5875),
(4565, 6203, 300, 0, 0, 10, 0, 5875),
(4565, 6204, 2500, 0, 0, 22, 0, 5875),
(4565, 6206, 2500, 0, 0, 22, 0, 5875),
(4565, 6214, 7000, 0, 0, 32, 0, 5875),
(4565, 6216, 22000, 0, 0, 56, 0, 5875),
(4565, 6218, 5000, 0, 0, 28, 0, 5875),
(4565, 6220, 8000, 0, 0, 34, 0, 5875),
(4565, 6221, 100, 0, 0, 4, 0, 5875),
(4565, 6224, 900, 0, 0, 14, 0, 5875),
(4565, 6225, 3000, 0, 0, 24, 0, 5875),
(4565, 6227, 8000, 0, 0, 34, 0, 5875),
(4565, 6228, 2500, 0, 0, 22, 0, 5875),
(4565, 6232, 7000, 0, 0, 32, 0, 5875),
(4565, 6485, 9000, 0, 0, 36, 0, 5875),
(4565, 7642, 9000, 0, 0, 36, 0, 5875),
(4565, 7647, 7000, 0, 0, 32, 0, 5875),
(4565, 7649, 8000, 0, 0, 34, 0, 5875),
(4565, 7650, 900, 0, 0, 14, 0, 5875),
(4565, 7652, 10000, 0, 0, 38, 0, 5875),
(4565, 7660, 5000, 0, 0, 28, 0, 5875),
(4565, 7661, 11000, 0, 0, 42, 0, 5875),
(4565, 7662, 300, 0, 0, 10, 0, 5875),
(4565, 7663, 2000, 0, 0, 20, 0, 5875),
(4565, 7664, 5000, 0, 0, 28, 0, 5875),
(4565, 7665, 6000, 0, 0, 30, 0, 5875),
(4565, 7666, 7000, 0, 0, 32, 0, 5875),
(4565, 8290, 3000, 0, 0, 24, 0, 5875),
(4565, 8291, 10000, 0, 0, 38, 0, 5875),
(4565, 11662, 12000, 0, 0, 44, 0, 5875),
(4565, 11663, 18000, 0, 0, 52, 0, 5875),
(4565, 11664, 26000, 0, 0, 60, 0, 5875),
(4565, 11666, 11000, 0, 0, 40, 0, 5875),
(4565, 11669, 15000, 0, 0, 50, 0, 5875),
(4565, 11670, 26000, 0, 0, 60, 0, 5875),
(4565, 11673, 12000, 0, 0, 44, 0, 5875),
(4565, 11674, 20000, 0, 0, 54, 0, 5875),
(4565, 11676, 18000, 0, 0, 52, 0, 5875),
(4565, 11679, 13000, 0, 0, 46, 0, 5875),
(4565, 11680, 24000, 0, 0, 58, 0, 5875),
(4565, 11685, 9900, 0, 0, 42, 0, 5875),
(4565, 11686, 18000, 0, 0, 54, 0, 5875),
(4565, 11690, 9000, 0, 0, 36, 0, 5875),
(4565, 11691, 13000, 0, 0, 46, 0, 5875),
(4565, 11692, 22000, 0, 0, 56, 0, 5875),
(4565, 11696, 12000, 0, 0, 44, 0, 5875),
(4565, 11697, 18000, 0, 0, 52, 0, 5875),
(4565, 11698, 26000, 0, 0, 60, 0, 5875),
(4565, 11701, 13000, 0, 0, 46, 0, 5875),
(4565, 11702, 20000, 0, 0, 54, 0, 5875),
(4565, 11705, 12000, 0, 0, 44, 0, 5875),
(4565, 11706, 20000, 0, 0, 54, 0, 5875),
(4565, 11709, 11000, 0, 0, 42, 0, 5875),
(4565, 11710, 18000, 0, 0, 52, 0, 5875),
(4565, 11714, 10000, 0, 0, 38, 0, 5875),
(4565, 11715, 14000, 0, 0, 48, 0, 5875),
(4565, 11716, 24000, 0, 0, 58, 0, 5875),
(4565, 11718, 22000, 0, 0, 56, 0, 5875),
(4565, 11720, 15000, 0, 0, 50, 0, 5875),
(4565, 11723, 13000, 0, 0, 46, 0, 5875),
(4565, 11724, 26000, 0, 0, 60, 0, 5875),
(4565, 11727, 12000, 0, 0, 44, 0, 5875),
(4565, 11728, 24000, 0, 0, 58, 0, 5875),
(4565, 11731, 24000, 0, 0, 58, 0, 5875),
(4565, 11736, 11000, 0, 0, 40, 0, 5875),
(4565, 11737, 15000, 0, 0, 50, 0, 5875),
(4565, 11738, 26000, 0, 0, 60, 0, 5875),
(4565, 11741, 11000, 0, 0, 42, 0, 5875),
(4565, 11742, 18000, 0, 0, 52, 0, 5875),
(4565, 11788, 15000, 0, 0, 50, 0, 5875),
(4565, 17732, 14000, 0, 0, 48, 0, 5875),
(4565, 17733, 26000, 0, 0, 60, 0, 5875),
(4565, 17865, 12000, 0, 0, 44, 0, 5875),
(4565, 17938, 10000, 0, 0, 60, 0, 5875),
(4565, 18154, 4000, 0, 0, 26, 0, 5875),
(4565, 18155, 8000, 0, 0, 34, 0, 5875),
(4565, 18156, 11000, 0, 0, 42, 0, 5875),
(4565, 18157, 15000, 0, 0, 50, 0, 5875),
(4565, 18158, 24000, 0, 0, 58, 0, 5875),
(4565, 18160, 22000, 0, 0, 56, 0, 5875),
(4565, 18161, 15000, 0, 0, 50, 0, 5875),
(4565, 18162, 24000, 0, 0, 58, 0, 5875),
(4565, 18169, 20000, 0, 0, 54, 0, 5875),
(4565, 18170, 13000, 0, 0, 46, 0, 5875),
(4565, 18171, 22000, 0, 0, 56, 0, 5875),
(4565, 18648, 13000, 0, 0, 46, 0, 5875),
(4565, 18753, 26000, 0, 0, 60, 0, 5875),
(4565, 18872, 150, 0, 0, 24, 0, 5875),
(4565, 18875, 350, 0, 0, 32, 0, 5875),
(4565, 18876, 550, 0, 0, 40, 0, 5875),
(4565, 18877, 700, 0, 0, 48, 0, 5875),
(4565, 18878, 22000, 0, 0, 56, 0, 5875),
(4565, 18927, 500, 0, 0, 38, 0, 5875),
(4565, 18928, 700, 0, 0, 48, 0, 5875),
(4565, 18929, 1200, 0, 0, 58, 0, 5875),
(4565, 18933, 700, 0, 0, 48, 0, 5875),
(4565, 18934, 1000, 0, 0, 54, 0, 5875),
(4565, 18935, 1300, 0, 0, 60, 0, 5875),
(4565, 18939, 750, 0, 0, 50, 0, 5875),
(4565, 18940, 1300, 0, 0, 60, 0, 5875),
(4565, 20766, 6000, 0, 0, 30, 0, 5875),
(4565, 20767, 11000, 0, 0, 40, 0, 5875),
(4565, 20768, 15000, 0, 0, 50, 0, 5875),
(4565, 20769, 26000, 0, 0, 60, 0, 5875);

-- add correct completion text for Doomcaller's Robes (8661)
UPDATE `quest_template` SET `OfferRewardText` = "I did not expect you to return from your attempt, $n.$b$bYou've fulfilled a destiny greater than that of most immortal beings.$b$bBy slaying C'Thun you've not only saved all of Azeroth, you've also tipped the scales of cosmic events beyond your comprehension.$b$bAccept these robes as a symbol of the glory and burden that will come as a consequence of your actions.$b$bMay their power aid you in the challenges that await you, god-slayer!" WHERE `entry` = 8661;

-- add correct completion text for Doomcaller's Robes (8661)
UPDATE `quest_template` SET `RequestItemsText` = "At his dwelling in Ahn'Qiraj, dread C'Thun awaits in slumber." WHERE `entry` = 8661;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;

