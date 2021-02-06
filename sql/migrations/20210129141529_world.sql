DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210129141529');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210129141529');
-- Add your query below.


-- elwynn
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1291 AND `id` = 5;

-- dun morogh
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1297 AND `id` = 4;

-- teldrassil
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1293 AND `id` = 4;

-- mulgore
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1294 AND `id` = 4;

-- tirisfal
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1296 AND `id` = 5;
INSERT INTO `gossip_menu_option`(`menu_id`, `id`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(1296, 5, 'What can I do at an inn?', 4308, 1, 1, 1221);

-- durotar
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1290 AND `id` = 5;
INSERT INTO `gossip_menu_option`(`menu_id`, `id`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(1290, 5, 'What can I do at an inn?', 4308, 1, 1, 1221);

-- fix erelas ambersky broken gossip menu option
UPDATE `gossip_menu_option` SET `action_menu_id` = 1481 WHERE `menu_id` = 1482 AND `id` = 0;

-- fix quest typo for trial of the lake
UPDATE `quest_template` SET `OfferRewardText` = 'Well now. It looks like yet another $r has successfully completed the Trial of the Lake! Well done, my young friend - well done.$B$BAs I've said, my name is Tajarri. It is my duty and my privilege to serve as a warden for Moonglade, and specifically this shrine. Keeper Remulos guides the Cenarion Circle in preservation of nature and balance, and his shrine serves as a lasting tribute to such. By using the bauble here, it serves as a nod to the importance of this place within the Circle.' WHERE `entry` IN (28, 29);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
