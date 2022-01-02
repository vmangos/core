DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210926224902');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210926224902');
-- Add your query below.


-- Update Some Midsummer Fire Festival Quest Chains
-- Alliance
UPDATE `creature_questrelation` SET `id` = 16817 WHERE `id` = 16818 AND `quest` = 9339;
UPDATE `creature_involvedrelation` SET `id` = 16817 WHERE `id` = 16818 AND `quest` = 9339;
UPDATE `quest_template` SET `RequiredRaces` = 77 WHERE `entry` = 9339 AND `patch` = 9;
UPDATE `quest_template` SET `Details`='' WHERE `entry` = 9339 AND `patch` = 9;
UPDATE `quest_template` SET `Objectives`='' WHERE `entry` = 9339 AND `patch` = 9;
UPDATE `quest_template` SET `OfferRewardText`='You\'ve proven yourself today, $n.$b$bWhile I have little else to give you, I do have this crown; a fitting gift for a conqueror. May it light your way.' WHERE `entry` = 9339 AND `patch`=9;

-- Horde
UPDATE `creature_questrelation` SET `id` = 16818 WHERE `id` = 16817 AND `quest` = 9365;
UPDATE `creature_involvedrelation` SET `id` = 16818 WHERE `id` = 16817 AND `quest` = 9365;
UPDATE `quest_template` SET `RequiredRaces`= 178 WHERE `entry` = 9365 AND `patch` = 9;
UPDATE `quest_template` SET `Details`='' WHERE `entry` = 9365 AND `patch`=9;
UPDATE `quest_template` SET `Objectives`='' WHERE `entry` = 9365 AND `patch`=9;
UPDATE `quest_template` SET `OfferRewardText`='You\'ve proven yourself today, $n.$b$bWhile I have little else to give you, I do have this crown; a fitting gift for a conqueror. May it light your way.' WHERE `entry` = 9365 AND `patch`=9;

-- Fix order of objectives for quest A Light in Dark Places.
UPDATE `quest_template` SET `ObjectiveText1`='Flame of Dire Maul', `ReqCreatureOrGOId1`=-181346 WHERE `entry` IN (9319, 9386);
UPDATE `quest_template` SET `ObjectiveText2`='Flame of Blackrock Spire', `ReqCreatureOrGOId2`=-181347 WHERE `entry` IN (9319, 9386);
UPDATE `quest_template` SET `ObjectiveText3`='Flame of Stratholme', `ReqCreatureOrGOId3`=-181348 WHERE `entry` IN (9319, 9386);
UPDATE `quest_template` SET `ObjectiveText4`='Flame of the Scholomance', `ReqCreatureOrGOId4`=-181349 WHERE `entry` IN (9319, 9386);

-- Misc
UPDATE `gameobject_template` SET `data12` = 181290 WHERE `entry` = 181347;
UPDATE `gameobject_template` SET `patch` = 9 WHERE `entry` = 181346;
UPDATE `quest_template` SET `OfferRewardText` = 'Your essence sings with the energy of the flames you found, $n. The fire you encountered is potent, and with the right knowledge, its power can be harnessed...$b$b<The Flamekeeper mutters an incantation in a strange, arcane tongue. then pulls out a glowing bottle.>$b$bAh! Here we are. May this light your path, no matter where you tread.' WHERE `entry` = 9319;
UPDATE `quest_template` SET `RequiredRaces` = 255 WHERE `entry` IN (9386, 9319);
UPDATE `quest_template` SET `RequestItemsText` = 'Have you found your way through the dark?' WHERE `entry` = 9386;

-- Correct Scale For Cinder Elemental
UPDATE `creature_template` SET `display_scale1` = 0 WHERE `entry` = 17003;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
