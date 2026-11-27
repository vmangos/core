DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20261124190355');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20261124190355');
-- Add your query below.

-- --------------------------------------------------------------------------------------------------
-- Rogue T3
-- --------------------------------------------------------------------------------------------------

-- RequestItemsText
UPDATE `quest_template` SET `RequestItemsText`='<Rohan shows you his moves.>$B$BWhat is it, $N? I''ve got to hit this mark perfectly for the competition later.' WHERE `entry`=9077;
UPDATE `quest_template` SET `RequestItemsText`='<Rohan laughs.>$B$BI just realized the irony in all of this.' WHERE `entry`=9078;
UPDATE `quest_template` SET `RequestItemsText`='You''re giving me money.$B$B<Rohan laughs.>$B$BThat still cracks me up.' WHERE `entry`=9079;
UPDATE `quest_template` SET `RequestItemsText`='<Rohan eyes you suspiciously.>$B$BBeen to Tyr''s Hand lately?' WHERE `entry`=9080;
UPDATE `quest_template` SET `RequestItemsText`='Just bring me the materials and stop wasting my time, $c.' WHERE `entry`=9081;
UPDATE `quest_template` SET `RequestItemsText`='How do you expect me to get anything done without the items I requested?' WHERE `entry`=9082;
UPDATE `quest_template` SET `RequestItemsText`='How do you expect me to get anything done without the items I requested?' WHERE `entry`=9083;
UPDATE `quest_template` SET `RequestItemsText`='How do you expect me to get anything done without the items I requested?' WHERE `entry`=9084;

-- OfferRewardText
UPDATE `quest_template` SET `OfferRewardText`='There you go, $r. As promised, the Bonescythe breastplate. I hope the fashion authorities aren''t around. You''d be thrown in the slammer for wearing that out!' WHERE `entry`=9077;
UPDATE `quest_template` SET `OfferRewardText`='Be careful walking around in those things. You might cut yourself.' WHERE `entry`=9078;
UPDATE `quest_template` SET `OfferRewardText`='What separates my Bonescythe helmet model from Don Julio''s is style, $N. Style...' WHERE `entry`=9079;
UPDATE `quest_template` SET `OfferRewardText`='<Rohan wipes the sweat from his brow.>$B$BThese shoulders took some work! Don''t go out and get yourself killed like a scrub, $N.' WHERE `entry`=9080;
UPDATE `quest_template` SET `OfferRewardText`='They go on your feet. Say, you haven''t been nosing around in Tyr''s Hand again, have you?' WHERE `entry`=9081;
UPDATE `quest_template` SET `OfferRewardText`='These gauntlets could probably substitute as weapons if absolutely necessary. Wear them with pride!' WHERE `entry`=9082;
UPDATE `quest_template` SET `OfferRewardText`='The belt is ready, $N. Have you ever seen such a high-quality item sold for so little?' WHERE `entry`=9083;
UPDATE `quest_template` SET `OfferRewardText`='The bracers are ready, $N.$B$B<Rohan bows.>' WHERE `entry`=9084;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
