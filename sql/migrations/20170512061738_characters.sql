INSERT INTO `migrations` VALUES ('20170512061738'); 

ALTER TABLE `item_instance` ADD COLUMN `generated_loot` TINYINT NULL DEFAULT 0 AFTER `text`;
