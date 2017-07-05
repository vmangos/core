INSERT INTO `migrations` VALUES ('20170602200053'); 

UPDATE characters SET resettalents_cost = resettalents_cost / (50000)  WHERE resettalents_cost > 0;

ALTER TABLE `characters` 
CHANGE COLUMN `resettalents_cost` `resettalents_multiplier` INT(11) UNSIGNED NOT NULL DEFAULT '0';