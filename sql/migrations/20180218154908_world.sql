DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180218154908');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180218154908');
-- Add your query below.


-- Items 10 day duration
UPDATE `item_template` SET `Duration`=864000, `ExtraFlags`=1 WHERE entry in (21812,22239,22236,22238,22237,22218,22261,22200,22218,22178,22160,22159,22161,22163,22162,21975,22154,22155,22156,22157,22158,22170,22168,22167,22169,22172,22171,21981,21980,21979,22164,22166,22165);

-- Black dress patch number
UPDATE `forbidden_items` SET `patch`=6 WHERE `entry`=22279;

-- Remove citizen scripts
UPDATE `creature_template` SET `ScriptName`='' WHERE `ScriptName` like '%npc%citizen%'


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
