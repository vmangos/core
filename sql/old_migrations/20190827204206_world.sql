DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190827204206');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190827204206');
-- Add your query below.


-- Corrections to Gubber Blump gossips and quests.
UPDATE `conditions` SET `type`=8, `value1`=1141 WHERE `condition_entry`=10218;
UPDATE `conditions` SET `type`=-2 WHERE `condition_entry`=10219;
UPDATE `gossip_menu_option` SET `action_script_id`=256201, `condition_id`=10217 WHERE `menu_id`=2562 && `id`=0;
UPDATE `gossip_menu_option` SET `id`=2 WHERE `id`=0 && `menu_id`=2562;
UPDATE `gossip_menu_option` SET `id`=0 WHERE `id`=1 && `menu_id`=2562;
UPDATE `gossip_menu_option` SET `id`=1 WHERE `id`=2 && `menu_id`=2562;
UPDATE `gossip_menu_option` SET `action_script_id`=256200 WHERE `action_script_id`=10216;
DELETE FROM `gossip_scripts` WHERE `id`=10216;
DELETE FROM `gossip_scripts` WHERE `id`=256201;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (256201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5532, 0, 0, 0, 0, 0, 0, 0, 0, 'Gubber Blump - Say Text');
DELETE FROM `gossip_scripts` WHERE `id`=256200;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (256200, 0, 15, 7733, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gubber Blump  - Teach Fishing');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (256200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5531, 0, 0, 0, 0, 0, 0, 0, 0, 'Gubber Blump  - Say Text');
UPDATE `quest_template` SET `RewRepValue1`=100, `OfferRewardEmote1`=1 WHERE `entry`=1141;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
