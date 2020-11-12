DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200108221120');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200108221120');
-- Add your query below.


-- add several entrys to spawn points
-- Shadowmage, Crypt Slayer, Dark Adept
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92566;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92560;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=56695;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=69690;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92322;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92682;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92684;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92140;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92320;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92334;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92319;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92321;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92192;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92193;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92187;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92190;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92178;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92710;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=91922;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=91921;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=64959;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92408;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92143;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=69702;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=91924;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92176;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92241;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92190;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=92242;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=53855;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=91929;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=91927;
UPDATE `creature` SET `id`=8550, `id2`=8558, `id3`=8546, `modelid`=0, `curmana`=100 WHERE `guid`=54748;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
