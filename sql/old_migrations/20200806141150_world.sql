DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200806141150');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200806141150');
-- Add your query below.


-- Correct kill count for Four-legged Menaces to match description. Correct XP and Rep to match Eight-legged Menaces.
UPDATE `quest_template` SET `ReqCreatureOrGOCount1`=12, `RewRepValue1`=75, `RewXP`=1250, `RewOrReqMoney`=1000, `RewMoneyMaxLevel`=780 WHERE `entry`=171 && `patch`=0;

-- Correct XP of Watcher Callahan to match Eight-legged Menaces.
UPDATE `quest_template` SET `Title`='Awaiting Word', `RewXP`=1250, `RewMoneyMaxLevel`=780 WHERE `entry`=236;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
