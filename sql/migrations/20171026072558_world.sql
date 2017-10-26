DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171026072558');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171026072558');
-- Add your query below.

-- -------------------------------
-- 
-- NAXXRAMAS PATCH 2
-- 
-- Kel'Thuzad's Guardians are no longer immune to slow effects
-- Corrected some creature links
--
-- -------------------------------
-- Guardian of Icecrown
UPDATE `creature_template` SET `mindmg`=2258, `maxdmg`=2759, `MechanicImmuneMask`=1019427442 WHERE `entry`=16441;

-- misc missing creature linking
delete from creature_linking where guid in (2530344,2530568,2530709,2530710,2530324,2530325,2530326,2530327,127982,2530328,2530329,2530330,88623);
insert into creature_linking (`guid`,`master_guid`,`flag`)  VALUES 
(2530344, 88496, 3072), /*carrion spider, faerlina*/ 
(2530568, 88303, 3073), /*stitched giant, grobbulus*/
(2530709, 88205, 3072), /*mutated grub, heigan*/
(2530710, 88205, 3072), /*frenzied bat, heigan*/
(127981 , 15952, 3072), /* Maexxna, trash after faerlina*/
(2530324, 15952, 3072),
(2530325, 15952, 3072),
(2530326, 15952, 3072),
(2530327, 15952, 3072),
(127982 , 15952, 3072),
(2530328, 15952, 3072),
(2530329, 15952, 3072),
(2530330, 15952, 3072),
(88623  , 15952, 3072);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
