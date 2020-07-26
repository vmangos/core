DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200726215404');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200726215404');
-- Add your query below.

INSERT INTO gossip_menu_option(menu_id, id, option_text, option_id, npc_option_npcflag, box_coded, box_money, box_text) VALUES (6565, 3, "I would like to enter the secret code to receive my Murloc pet.", 1, 1, 1, 0, ""); -- Ransin Donner and Zas'Tysh
INSERT INTO gossip_menu_option(menu_id, id, option_text, option_id, npc_option_npcflag, box_coded, box_money, box_text) VALUES (7034, 1, "I would like to enter the secret code to receive my Murloc pet.", 1, 1, 1, 0, ""); -- Garel Redrock and Tharl Stonebleeder

CREATE TABLE IF NOT EXISTS `promotion_codes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `code` varchar(15) NOT NULL COMMENT 'Promotion Code',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Promotion Codes';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
