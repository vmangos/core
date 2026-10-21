DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230611164135');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230611164135');
-- Add your query below.


-- PATCHWERK TRASH: He is only linked to the mobs in his main large chamber, anything from embalming slimes room and before is not linked. So removing "aggro on aggro" from all the mobs that shouldn't have it. First 4x patchwork golems pack
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88261;
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88262;
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88263;
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88264;

-- two patrolling Bile Retchers
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88269;
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88270;

-- Three mob pack on the left
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88265;
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88266;
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88271;

-- Three mob pack on the right
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88267;
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88268;
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88272;

-- Second 4x patchwork golems pack
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88278;
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88279;
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88280;
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88281;

-- two patrolling Sludge Belchers
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88720;
UPDATE `creature_linking` SET `flag`=3072 WHERE `guid`=88721;


-- RAZUVIOUS TRASH: He is only linked to the mobs of the stables, everything from the top floor is not linked.
-- Since so many more mobs are incorrectly linked, removing "aggro on aggro" from ALL the mobs
UPDATE `creature_linking` SET `flag`=3072 WHERE `master_guid`=88460;

-- Then reverting the change on the ones that SHOULD be linked
-- duo horseman patrol
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=302599;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=302600;

-- first horseman + 3 squires
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88450;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88499;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88457;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88447;

-- second horseman + 3 squires
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88451;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88452;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88453;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88448;

-- third horseman + 3 squires
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88454;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88455;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88456;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=302598;

-- triple horsemen
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88466;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=300361;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88465;

-- stables horses and their squires
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=302602;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88467;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88675;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88676;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=302604;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=302603;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88468;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88469;
UPDATE `creature_linking` SET `flag`=3073 WHERE `guid`=88674;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
