INSERT INTO `migrations` VALUES ('20170607063901'); 

ALTER TABLE `character_queststatus` 
ADD COLUMN `reward_choice` INT(11) UNSIGNED NOT NULL DEFAULT 0 AFTER `itemcount4`;