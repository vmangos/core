DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171114231424');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171114231424');
-- Add your query below.


ALTER TABLE `quest_template` ADD COLUMN `MaxLevel` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `MinLevel`;
UPDATE `quest_template` SET `MaxLevel`=QuestLevel WHERE Type = 41;
UPDATE `quest_template` SET `MaxLevel`=0 WHERE `entry` IN 
(7842,8262,8260,8261,7838,7810,9665,1658,8265,8263,8264,9664,8848,8853,8846,8851,7841,7868,7866,7867,8322,8409,
9419,9422,7865,7863,7864,1657,8847,8852,8509,8492,8494,8511,8517,8513,8510,8493,8495,8512,8518,8514,8506,8525,
8527,8523,8521,8529,8504,8516,8500,8505,8524,8526,8522,8520,8528,8503,8515,8499,8795,7843,8615,8532,8580,8588,
8611,8607,8545,8616,8533,8581,8589,8612,8608,8546,8550,8583,8601,8610,8614,8591,8543,8605,8549,8582,8600,8609,
8613,8590,8542,8604,8792,8793,8794,8373,8850,8855,8849,8854,8001);

-- Old versions of: Vanquish the Invaders!, Quell the Silverwing Usurpers, Talismans of Merit, Mark of Honor, Arathi Basin Resources!, More Resource Crates, Cut Arathor Supply Lines
UPDATE `quest_template` SET `MaxLevel`=29 WHERE `entry`=7788;
UPDATE `quest_template` SET `MaxLevel`=29 WHERE `entry`=7789;
UPDATE `quest_template` SET `MaxLevel`=39 WHERE `entry`=7871;
UPDATE `quest_template` SET `MaxLevel`=49 WHERE `entry`=7872;
UPDATE `quest_template` SET `MaxLevel`=59 WHERE `entry`=7873;
UPDATE `quest_template` SET `MaxLevel`=39 WHERE `entry`=7874;
UPDATE `quest_template` SET `MaxLevel`=49 WHERE `entry`=7875;
UPDATE `quest_template` SET `MaxLevel`=59 WHERE `entry`=7876;
UPDATE `quest_template` SET `MaxLevel`=59 WHERE `entry`=7886;
UPDATE `quest_template` SET `MaxLevel`=39 WHERE `entry`=7887;
UPDATE `quest_template` SET `MaxLevel`=49 WHERE `entry`=7888;
UPDATE `quest_template` SET `MaxLevel`=29 WHERE `entry`=7921;
UPDATE `quest_template` SET `MaxLevel`=59 WHERE `entry`=7922;
UPDATE `quest_template` SET `MaxLevel`=49 WHERE `entry`=7923;
UPDATE `quest_template` SET `MaxLevel`=39 WHERE `entry`=7924;
UPDATE `quest_template` SET `MaxLevel`=29 WHERE `entry`=7925;
UPDATE `quest_template` SET `MaxLevel`=59 WHERE `entry`=8080;
UPDATE `quest_template` SET `MaxLevel`=59 WHERE `entry`=8081;
UPDATE `quest_template` SET `MaxLevel`=59 WHERE `entry`=8123;
UPDATE `quest_template` SET `MaxLevel`=59 WHERE `entry`=8124;
UPDATE `quest_template` SET `MaxLevel`=49 WHERE `entry`=8154;
UPDATE `quest_template` SET `MaxLevel`=29 WHERE `entry`=8155;
UPDATE `quest_template` SET `MaxLevel`=39 WHERE `entry`=8156;
UPDATE `quest_template` SET `MaxLevel`=49 WHERE `entry`=8157;
UPDATE `quest_template` SET `MaxLevel`=29 WHERE `entry`=8158;
UPDATE `quest_template` SET `MaxLevel`=39 WHERE `entry`=8159;
UPDATE `quest_template` SET `MaxLevel`=49 WHERE `entry`=8160;
UPDATE `quest_template` SET `MaxLevel`=39 WHERE `entry`=8161;
UPDATE `quest_template` SET `MaxLevel`=29 WHERE `entry`=8162;
UPDATE `quest_template` SET `MaxLevel`=49 WHERE `entry`=8163;
UPDATE `quest_template` SET `MaxLevel`=39 WHERE `entry`=8164;
UPDATE `quest_template` SET `MaxLevel`=29 WHERE `entry`=8165;
UPDATE `quest_template` SET `MaxLevel`=19 WHERE `entry`=8289;
UPDATE `quest_template` SET `MaxLevel`=19 WHERE `entry`=8296;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
