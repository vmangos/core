DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191007163932');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191007163932');
-- Add your query below.


-- Remove bad use of chromaggus script spells in dire maul.
DELETE FROM `creature` WHERE `guid`=1247125;
DELETE FROM `event_scripts` WHERE `id`=8447;
DELETE FROM `event_scripts` WHERE `id`=8449;

-- Replace text from custom table with broadcast text.
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID`=9364;
DELETE FROM `script_texts` WHERE `entry`=-1900008;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
