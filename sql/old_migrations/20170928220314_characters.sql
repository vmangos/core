INSERT INTO `migrations` VALUES ('20170928220314');

ALTER TABLE `mail_items`
	CHANGE COLUMN `mail_id` `mail_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `item_guid` `item_guid` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `mail_id`,
	CHANGE COLUMN `item_template` `item_template` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `item_guid`;
