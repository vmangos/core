DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210111181621');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210111181621');
-- Add your query below.


-- Brood of Nozdormu - Changes to Quests - Rings / Qiraji Insigna (https://github.com/cmangos/classic-db/commit/5b4bb5d702ff6893a026eb1e1369c8da18990286)
-- AQ40 - Mortal Champions
UPDATE `quest_template` SET `RewRepFaction1`= 910, `RewRepFaction2`= 609, `RewRepValue1`= 500, `RewRepValue2`= 100 WHERE `entry`= 8579;
UPDATE `quest_template` SET `Details`='' WHERE `entry`= 8595;

-- AQ40 - Path of the Invoker
UPDATE `quest_template` SET `OfferRewardText`='Impressive, little one. You have gone through much trouble to gain the favor of the Bronze Flight. Your dedication is noted.$b$bThe signet ring of the invoker will greatly enhance your magical and natural abilities.$b$bBe warned, once you have chosen your path, you will have no recourse should you change your mind.', `RequestItemsText`='' WHERE `entry`= 8757;
UPDATE `quest_template` SET `OfferRewardText`='Your rise amongst the rank of the Brood is most impressive, $n. May you never stray from the path of the invoker!' WHERE `entry`= 8758;
UPDATE `quest_template` SET `OfferRewardText`='Your rise amongst the rank of the Brood is most impressive, $n. May you never stray from the path of the invoker!' WHERE `entry`= 8759;
UPDATE `quest_template` SET `OfferRewardText`='Your rise amongst the rank of the Brood is most impressive, $n. May you never stray from the path of the invoker!' WHERE `entry`= 8760;
UPDATE `quest_template` SET `Details`='', `OfferRewardText`='Rise, Grand Invoker! Rise and be recognized!', `RequestItemsText`='Never have I seen such tenacity! The Bronze Flight grants you one final enchantment. The Timeless One himself has requested it so!$b$bHand me your signet ring so that I may make the necessary adjustments.' WHERE `entry`= 8761;

-- AQ40 - Path of the Conqueror
UPDATE `quest_template` SET `OfferRewardText`='Impressive, little one. You have gone through much trouble to gain the favor of the Bronze Flight. Your dedication is noted.$b$bThe signet ring of the conqueror will greatly enhance your physical attacks.$b$bBe warned, once you have chosen your path, you will have no recourse should you change your mind.', `RequestItemsText`='' WHERE `entry`= 8752;
UPDATE `quest_template` SET `OfferRewardText`='Your rise amongst the rank of the Brood is most impressive, $n. May you never stray from the path of the conqueror!' WHERE `entry`= 8753;
UPDATE `quest_template` SET `OfferRewardText`='Your rise amongst the rank of the Brood is most impressive, $n. May you never stray from the path of the conqueror!' WHERE `entry`= 8754;
UPDATE `quest_template` SET `OfferRewardText`='Your rise amongst the rank of the Brood is most impressive, $n. May you never stray from the path of the conqueror!' WHERE `entry`= 8755;
UPDATE `quest_template` SET `Details`='', `OfferRewardText`='Rise, Qiraji Conqueror! Rise and be recognized!', `RequestItemsText`='Never have I seen such tenacity! The Bronze Flight grants you one final enchantment. The Timeless One himself has requested it so!$b$bHand me your signet ring so that I may make the necessary adjustments.' WHERE `entry`= 8756;

-- AQ40 - Path of the Protector
UPDATE `quest_template` SET `OfferRewardText`='Impressive, little one. You have gone through much trouble to gain the favor of the Bronze Flight. Your dedication is noted.$b$bThe signet ring of the protector will offer superior protection against the forces of evil.$b$bBe warned, once you have chosen your path, you will have no recourse should you change your mind.', `RequestItemsText`='' WHERE `entry`= 8747;
UPDATE `quest_template` SET `OfferRewardText`='Your rise amongst the rank of the Brood is most impressive, $n. May you never stray from the path of the protector!' WHERE `entry`= 8748;
UPDATE `quest_template` SET `OfferRewardText`='Your rise amongst the rank of the Brood is most impressive, $n. May you never stray from the path of the protector!' WHERE `entry`= 8749;
UPDATE `quest_template` SET `OfferRewardText`='Your rise amongst the rank of the Brood is most impressive, $n. May you never stray from the path of the protector!' WHERE `entry`= 8750;
UPDATE `quest_template` SET `Details`='', `OfferRewardText`='Rise, Protector of Kalimdor! Rise and be recognized!', `RequestItemsText`='Never have I seen such tenacity! The Bronze Flight grants you one final enchantment. The Timeless One himself has requested it so!$b$bHand me your signet ring so that I may make the necessary adjustments.' WHERE `entry`= 8751;

-- AQ40 - The Changing of Paths - x no more
UPDATE `quest_template` SET `SpecialFlags`= 1 WHERE `entry` IN (8764, 8765, 8766);

-- AQ40 - The Path of x
UPDATE `quest_template` SET `ExclusiveGroup`= 8747 WHERE `entry` IN (8747, 8752, 8757); -- step 1 neutral
UPDATE `quest_template` SET `ExclusiveGroup`= 8748 WHERE `entry` IN (8748, 8753, 8758); -- step 2 friendly
UPDATE `quest_template` SET `ExclusiveGroup`= 8749 WHERE `entry` IN (8749, 8754, 8759); -- step 3 honored
UPDATE `quest_template` SET `ExclusiveGroup`= 8750 WHERE `entry` IN (8750, 8755, 8760); -- step 4 revered
UPDATE `quest_template` SET `ExclusiveGroup`= 8751 WHERE `entry` IN (8751, 8756, 8761); -- final step exalted


-- The quest Avenging the Fallen should not be repeatable. (https://github.com/cmangos/classic-db/commit/d42fdc08db79af13ba7c77c280de89a7af4d7675)
UPDATE `quest_template` SET `SpecialFlags`= 0 WHERE `entry`= 7830;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
