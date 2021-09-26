DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210926224902');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210926224902');
-- Add your query below.


UPDATE `gameobject_template` SET `data12` = 181290 WHERE `entry` = 181347;
UPDATE `gameobject_template` SET `patch` = 9 WHERE `entry` = 181346
UPDATE `quest_template` SET `SpecialFlags` = 0, `PrevQuestId` = 0 WHERE `entry` = 9386;
UPDATE `quest_template` SET `Details` = 'We are not the only ones who celebrate this holiday, $n. All creatures, all cultures, are touched by the flame. Even in the darkest places, the fires are being lit.$b$bIf you wish to see them for yourself, travel into the depths. Seek out the bonfires burning within Stratholme, Scholomance, among the ogres of Dire Maul, and the halls of Blackrock Spire itself; I will await your return.' WHERE `entry` = 9386;
UPDATE `quest_template` SET `Objectives` = 'Find and touch the bonfires located within Blackrock Spire, Dire Maul, Scholomance, and Stratholme, then return to the Festival Flamekeeper.' WHERE `entry` = 9386;
UPDATE `quest_template` SET `RequestItemsText` = '' WHERE `entry` = 9319;
UPDATE `quest_template` SET `OfferRewardText` = 'Your essence sings with the energy of the flames you found, $n. The fire you encountered is potent, and with the right knowledge, its power can be harnessed...$n<The Flamekeeper mutters an incantation in a strange, arcane tongue. then pulls out a glowing bottle.>$nAh! Here we are. May this light your path, no matter where you tread.' WHERE `entry` = 9319;
UPDATE `quest_template` SET `OfferRewardText` = 'Your essence sings with the energy of the flames you found, $n. The fire you encountered is potent, and with the right knowledge, its power can be harnessed...$n<The Flamekeeper mutters an incantation in a strange, arcane tongue. then pulls out a glowing bottle.>$nAh! Here we are. May this light your path, no matter where you tread.' WHERE  `entry`=9386;
UPDATE `quest_template` SET `RewItemId1` = 23083 WHERE `entry` = 9386;
UPDATE `quest_template` SET `RewItemId2` = 23247 WHERE `entry` = 9386;
UPDATE `quest_template` SET `RewItemCount1` = 1 WHERE `entry` = 9386;
UPDATE `quest_template` SET `RewItemCount2` = 10 WHERE `entry` = 9386;
UPDATE `quest_template` SET `RewXP` = 4950 WHERE `entry` = 9386;
UPDATE `quest_template` SET `RewMoneyMaxLevel` = 2970 WHERE `entry` = 9386;
UPDATE `quest_template` SET `DetailsEmote1` = 1, `DetailsEmote2`='1' WHERE `entry`=9386;
UPDATE `quest_template` SET `CompleteEmote` = 1 WHERE `entry` = 9319;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
