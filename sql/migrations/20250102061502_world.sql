DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250102061502');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250102061502');
-- Add your query below.
UPDATE `quest_template` SET `RequestItemsText`='I must not interfere, $R.' WHERE  `entry`=9269 AND `patch`=9;
UPDATE `quest_template` SET `RequestItemsText`='I must not interfere, $R.' WHERE  `entry`=9270 AND `patch`=9;
UPDATE `quest_template` SET `RequestItemsText`='I must not interfere, $R.' WHERE  `entry`=9271 AND `patch`=9;
UPDATE `quest_template` SET `RequestItemsText`='I must not interfere, $R.' WHERE  `entry`=9257 AND `patch`=9;
UPDATE `quest_template` SET `OfferRewardText`='The magnitude of this accomplishment must not be understated, $N. You have done what most would have thought to be impossible. Alas, it was fated. The staff has made its choice...' WHERE  `entry`=9269 AND `patch`=9;
UPDATE `quest_template` SET `OfferRewardText`='The magnitude of this accomplishment must not be understated, $N. You have done what most would have thought to be impossible. Alas, it was fated. The staff has made its choice...' WHERE  `entry`=9270 AND `patch`=9;
UPDATE `quest_template` SET `OfferRewardText`='The magnitude of this accomplishment must not be understated, $N. You have done what most would have thought to be impossible. Alas, it was fated. The staff has made its choice...' WHERE  `entry`=9271 AND `patch`=9;
UPDATE `quest_template` SET `OfferRewardText`='The magnitude of this accomplishment must not be understated, $N. You have done what most would have thought to be impossible. Alas, it was fated. The staff has made its choice...' WHERE  `entry`=9257 AND `patch`=9;
-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
