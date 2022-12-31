DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221231154451');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221231154451');
-- Add your query below.


ALTER TABLE `custom_texts`
      ADD COLUMN `content_loc9` text AFTER `content_loc8`,
      ADD COLUMN `content_loc10` text AFTER `content_loc9`,
      ADD COLUMN `content_loc11` text AFTER `content_loc10`,
      ADD COLUMN `content_loc12` text AFTER `content_loc11`,
      ADD COLUMN `content_loc13` text AFTER `content_loc12`,
      ADD COLUMN `content_loc14` text AFTER `content_loc13`,
      ADD COLUMN `content_loc15` text AFTER `content_loc14`;

ALTER TABLE `locales_area`
      ADD COLUMN `NameLoc9` varchar(100) NOT NULL DEFAULT '' AFTER `NameLoc8`,
      ADD COLUMN `NameLoc10` varchar(100) NOT NULL DEFAULT '' AFTER `NameLoc9`,
      ADD COLUMN `NameLoc11` varchar(100) NOT NULL DEFAULT '' AFTER `NameLoc10`,
      ADD COLUMN `NameLoc12` varchar(100) NOT NULL DEFAULT '' AFTER `NameLoc11`,
      ADD COLUMN `NameLoc13` varchar(100) NOT NULL DEFAULT '' AFTER `NameLoc12`,
      ADD COLUMN `NameLoc14` varchar(100) NOT NULL DEFAULT '' AFTER `NameLoc13`,
      ADD COLUMN `NameLoc15` varchar(100) NOT NULL DEFAULT '' AFTER `NameLoc14`;

ALTER TABLE `locales_broadcast_text`
      ADD COLUMN `male_text_loc9` longtext AFTER `male_text_loc8`,
      ADD COLUMN `male_text_loc10` longtext AFTER `male_text_loc9`,
      ADD COLUMN `male_text_loc11` longtext AFTER `male_text_loc10`,
      ADD COLUMN `male_text_loc12` longtext AFTER `male_text_loc11`,
      ADD COLUMN `male_text_loc13` longtext AFTER `male_text_loc12`,
      ADD COLUMN `male_text_loc14` longtext AFTER `male_text_loc13`,
      ADD COLUMN `male_text_loc15` longtext AFTER `male_text_loc14`,
      ADD COLUMN `female_text_loc9` longtext AFTER `female_text_loc8`,
      ADD COLUMN `female_text_loc10` longtext AFTER `female_text_loc9`,
      ADD COLUMN `female_text_loc11` longtext AFTER `female_text_loc10`,
      ADD COLUMN `female_text_loc12` longtext AFTER `female_text_loc11`,
      ADD COLUMN `female_text_loc13` longtext AFTER `female_text_loc12`,
      ADD COLUMN `female_text_loc14` longtext AFTER `female_text_loc13`,
      ADD COLUMN `female_text_loc15` longtext AFTER `female_text_loc14`;

ALTER TABLE `locales_creature`
      ADD COLUMN `name_loc9` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc8`,
      ADD COLUMN `name_loc10` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc9`,
      ADD COLUMN `name_loc11` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc10`,
      ADD COLUMN `name_loc12` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc11`,
      ADD COLUMN `name_loc13` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc12`,
      ADD COLUMN `name_loc14` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc13`,
      ADD COLUMN `name_loc15` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc14`,
      ADD COLUMN `subname_loc9` varchar(100) DEFAULT NULL AFTER `subname_loc8`,
      ADD COLUMN `subname_loc10` varchar(100) DEFAULT NULL AFTER `subname_loc9`,
      ADD COLUMN `subname_loc11` varchar(100) DEFAULT NULL AFTER `subname_loc10`,
      ADD COLUMN `subname_loc12` varchar(100) DEFAULT NULL AFTER `subname_loc11`,
      ADD COLUMN `subname_loc13` varchar(100) DEFAULT NULL AFTER `subname_loc12`,
      ADD COLUMN `subname_loc14` varchar(100) DEFAULT NULL AFTER `subname_loc13`,
      ADD COLUMN `subname_loc15` varchar(100) DEFAULT NULL AFTER `subname_loc14`;

ALTER TABLE `locales_faction`
      ADD COLUMN `name_loc7` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc6`,
      ADD COLUMN `name_loc8` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc7`,
      ADD COLUMN `name_loc9` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc8`,
      ADD COLUMN `name_loc10` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc9`,
      ADD COLUMN `name_loc11` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc10`,
      ADD COLUMN `name_loc12` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc11`,
      ADD COLUMN `name_loc13` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc12`,
      ADD COLUMN `name_loc14` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc13`,
      ADD COLUMN `name_loc15` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc14`,
      ADD COLUMN `description_loc7` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc6`,
      ADD COLUMN `description_loc8` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc7`,
      ADD COLUMN `description_loc9` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc8`,
      ADD COLUMN `description_loc10` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc9`,
      ADD COLUMN `description_loc11` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc10`,
      ADD COLUMN `description_loc12` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc11`,
      ADD COLUMN `description_loc13` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc12`,
      ADD COLUMN `description_loc14` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc13`,
      ADD COLUMN `description_loc15` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc14`;

ALTER TABLE `locales_gameobject`
      ADD COLUMN `name_loc9` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc8`,
      ADD COLUMN `name_loc10` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc9`,
      ADD COLUMN `name_loc11` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc10`,
      ADD COLUMN `name_loc12` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc11`,
      ADD COLUMN `name_loc13` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc12`,
      ADD COLUMN `name_loc14` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc13`,
      ADD COLUMN `name_loc15` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc14`;
      
ALTER TABLE `locales_gossip_menu_option`
      ADD COLUMN `option_text_loc9` text AFTER `option_text_loc8`,
      ADD COLUMN `option_text_loc10` text AFTER `option_text_loc9`,
      ADD COLUMN `option_text_loc11` text AFTER `option_text_loc10`,
      ADD COLUMN `option_text_loc12` text AFTER `option_text_loc11`,
      ADD COLUMN `option_text_loc13` text AFTER `option_text_loc12`,
      ADD COLUMN `option_text_loc14` text AFTER `option_text_loc13`,
      ADD COLUMN `option_text_loc15` text AFTER `option_text_loc14`,
      ADD COLUMN `box_text_loc9` text AFTER `box_text_loc8`,
      ADD COLUMN `box_text_loc10` text AFTER `box_text_loc9`,
      ADD COLUMN `box_text_loc11` text AFTER `box_text_loc10`,
      ADD COLUMN `box_text_loc12` text AFTER `box_text_loc11`,
      ADD COLUMN `box_text_loc13` text AFTER `box_text_loc12`,
      ADD COLUMN `box_text_loc14` text AFTER `box_text_loc13`,
      ADD COLUMN `box_text_loc15` text AFTER `box_text_loc14`;

ALTER TABLE `locales_item`
      ADD COLUMN `name_loc9` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc8`,
      ADD COLUMN `name_loc10` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc9`,
      ADD COLUMN `name_loc11` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc10`,
      ADD COLUMN `name_loc12` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc11`,
      ADD COLUMN `name_loc13` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc12`,
      ADD COLUMN `name_loc14` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc13`,
      ADD COLUMN `name_loc15` varchar(100) NOT NULL DEFAULT '' AFTER `name_loc14`,
      ADD COLUMN `description_loc9` varchar(255) DEFAULT NULL AFTER `description_loc8`,
      ADD COLUMN `description_loc10` varchar(255) DEFAULT NULL AFTER `description_loc9`,
      ADD COLUMN `description_loc11` varchar(255) DEFAULT NULL AFTER `description_loc10`,
      ADD COLUMN `description_loc12` varchar(255) DEFAULT NULL AFTER `description_loc11`,
      ADD COLUMN `description_loc13` varchar(255) DEFAULT NULL AFTER `description_loc12`,
      ADD COLUMN `description_loc14` varchar(255) DEFAULT NULL AFTER `description_loc13`,
      ADD COLUMN `description_loc15` varchar(255) DEFAULT NULL AFTER `description_loc14`;

ALTER TABLE `locales_page_text`
      ADD COLUMN `Text_loc9` longtext AFTER `Text_loc8`,
      ADD COLUMN `Text_loc10` longtext AFTER `Text_loc9`,
      ADD COLUMN `Text_loc11` longtext AFTER `Text_loc10`,
      ADD COLUMN `Text_loc12` longtext AFTER `Text_loc11`,
      ADD COLUMN `Text_loc13` longtext AFTER `Text_loc12`,
      ADD COLUMN `Text_loc14` longtext AFTER `Text_loc13`,
      ADD COLUMN `Text_loc15` longtext AFTER `Text_loc14`;

ALTER TABLE `locales_points_of_interest`
      ADD COLUMN `icon_name_loc9` text AFTER `icon_name_loc8`,
      ADD COLUMN `icon_name_loc10` text AFTER `icon_name_loc9`,
      ADD COLUMN `icon_name_loc11` text AFTER `icon_name_loc10`,
      ADD COLUMN `icon_name_loc12` text AFTER `icon_name_loc11`,
      ADD COLUMN `icon_name_loc13` text AFTER `icon_name_loc12`,
      ADD COLUMN `icon_name_loc14` text AFTER `icon_name_loc13`,
      ADD COLUMN `icon_name_loc15` text AFTER `icon_name_loc14`;

ALTER TABLE `locales_quest`
      ADD COLUMN `Title_loc9` text AFTER `Title_loc8`,
      ADD COLUMN `Title_loc10` text AFTER `Title_loc9`,
      ADD COLUMN `Title_loc11` text AFTER `Title_loc10`,
      ADD COLUMN `Title_loc12` text AFTER `Title_loc11`,
      ADD COLUMN `Title_loc13` text AFTER `Title_loc12`,
      ADD COLUMN `Title_loc14` text AFTER `Title_loc13`,
      ADD COLUMN `Title_loc15` text AFTER `Title_loc14`,
      ADD COLUMN `Details_loc9` text AFTER `Details_loc8`,
      ADD COLUMN `Details_loc10` text AFTER `Details_loc9`,
      ADD COLUMN `Details_loc11` text AFTER `Details_loc10`,
      ADD COLUMN `Details_loc12` text AFTER `Details_loc11`,
      ADD COLUMN `Details_loc13` text AFTER `Details_loc12`,
      ADD COLUMN `Details_loc14` text AFTER `Details_loc13`,
      ADD COLUMN `Details_loc15` text AFTER `Details_loc14`,
      ADD COLUMN `Objectives_loc9` text AFTER `Objectives_loc8`,
      ADD COLUMN `Objectives_loc10` text AFTER `Objectives_loc9`,
      ADD COLUMN `Objectives_loc11` text AFTER `Objectives_loc10`,
      ADD COLUMN `Objectives_loc12` text AFTER `Objectives_loc11`,
      ADD COLUMN `Objectives_loc13` text AFTER `Objectives_loc12`,
      ADD COLUMN `Objectives_loc14` text AFTER `Objectives_loc13`,
      ADD COLUMN `Objectives_loc15` text AFTER `Objectives_loc14`,
      ADD COLUMN `OfferRewardText_loc9` text AFTER `OfferRewardText_loc8`,
      ADD COLUMN `OfferRewardText_loc10` text AFTER `OfferRewardText_loc9`,
      ADD COLUMN `OfferRewardText_loc11` text AFTER `OfferRewardText_loc10`,
      ADD COLUMN `OfferRewardText_loc12` text AFTER `OfferRewardText_loc11`,
      ADD COLUMN `OfferRewardText_loc13` text AFTER `OfferRewardText_loc12`,
      ADD COLUMN `OfferRewardText_loc14` text AFTER `OfferRewardText_loc13`,
      ADD COLUMN `OfferRewardText_loc15` text AFTER `OfferRewardText_loc14`,
      ADD COLUMN `RequestItemsText_loc9` text AFTER `RequestItemsText_loc8`,
      ADD COLUMN `RequestItemsText_loc10` text AFTER `RequestItemsText_loc9`,
      ADD COLUMN `RequestItemsText_loc11` text AFTER `RequestItemsText_loc10`,
      ADD COLUMN `RequestItemsText_loc12` text AFTER `RequestItemsText_loc11`,
      ADD COLUMN `RequestItemsText_loc13` text AFTER `RequestItemsText_loc12`,
      ADD COLUMN `RequestItemsText_loc14` text AFTER `RequestItemsText_loc13`,
      ADD COLUMN `RequestItemsText_loc15` text AFTER `RequestItemsText_loc14`,
      ADD COLUMN `EndText_loc9` text AFTER `EndText_loc8`,
      ADD COLUMN `EndText_loc10` text AFTER `EndText_loc9`,
      ADD COLUMN `EndText_loc11` text AFTER `EndText_loc10`,
      ADD COLUMN `EndText_loc12` text AFTER `EndText_loc11`,
      ADD COLUMN `EndText_loc13` text AFTER `EndText_loc12`,
      ADD COLUMN `EndText_loc14` text AFTER `EndText_loc13`,
      ADD COLUMN `EndText_loc15` text AFTER `EndText_loc14`,
      ADD COLUMN `ObjectiveText1_loc9` text AFTER `ObjectiveText1_loc8`,
      ADD COLUMN `ObjectiveText1_loc10` text AFTER `ObjectiveText1_loc9`,
      ADD COLUMN `ObjectiveText1_loc11` text AFTER `ObjectiveText1_loc10`,
      ADD COLUMN `ObjectiveText1_loc12` text AFTER `ObjectiveText1_loc11`,
      ADD COLUMN `ObjectiveText1_loc13` text AFTER `ObjectiveText1_loc12`,
      ADD COLUMN `ObjectiveText1_loc14` text AFTER `ObjectiveText1_loc13`,
      ADD COLUMN `ObjectiveText1_loc15` text AFTER `ObjectiveText1_loc14`,
      ADD COLUMN `ObjectiveText2_loc9` text AFTER `ObjectiveText2_loc8`,
      ADD COLUMN `ObjectiveText2_loc10` text AFTER `ObjectiveText2_loc9`,
      ADD COLUMN `ObjectiveText2_loc11` text AFTER `ObjectiveText2_loc10`,
      ADD COLUMN `ObjectiveText2_loc12` text AFTER `ObjectiveText2_loc11`,
      ADD COLUMN `ObjectiveText2_loc13` text AFTER `ObjectiveText2_loc12`,
      ADD COLUMN `ObjectiveText2_loc14` text AFTER `ObjectiveText2_loc13`,
      ADD COLUMN `ObjectiveText2_loc15` text AFTER `ObjectiveText2_loc14`,
      ADD COLUMN `ObjectiveText3_loc9` text AFTER `ObjectiveText3_loc8`,
      ADD COLUMN `ObjectiveText3_loc10` text AFTER `ObjectiveText3_loc9`,
      ADD COLUMN `ObjectiveText3_loc11` text AFTER `ObjectiveText3_loc10`,
      ADD COLUMN `ObjectiveText3_loc12` text AFTER `ObjectiveText3_loc11`,
      ADD COLUMN `ObjectiveText3_loc13` text AFTER `ObjectiveText3_loc12`,
      ADD COLUMN `ObjectiveText3_loc14` text AFTER `ObjectiveText3_loc13`,
      ADD COLUMN `ObjectiveText3_loc15` text AFTER `ObjectiveText3_loc14`,
      ADD COLUMN `ObjectiveText4_loc9` text AFTER `ObjectiveText4_loc8`,
      ADD COLUMN `ObjectiveText4_loc10` text AFTER `ObjectiveText4_loc9`,
      ADD COLUMN `ObjectiveText4_loc11` text AFTER `ObjectiveText4_loc10`,
      ADD COLUMN `ObjectiveText4_loc12` text AFTER `ObjectiveText4_loc11`,
      ADD COLUMN `ObjectiveText4_loc13` text AFTER `ObjectiveText4_loc12`,
      ADD COLUMN `ObjectiveText4_loc14` text AFTER `ObjectiveText4_loc13`,
      ADD COLUMN `ObjectiveText4_loc15` text AFTER `ObjectiveText4_loc14`;

ALTER TABLE `locales_spell`
      CHANGE COLUMN `name_loc1` `name_loc1` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `name_loc2` `name_loc2` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `name_loc3` `name_loc3` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `name_loc4` `name_loc4` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `name_loc5` `name_loc5` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `name_loc6` `name_loc6` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      ADD COLUMN `name_loc7` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc6`,
      ADD COLUMN `name_loc8` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc7`,
      ADD COLUMN `name_loc9` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc8`,
      ADD COLUMN `name_loc10` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc9`,
      ADD COLUMN `name_loc11` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc10`,
      ADD COLUMN `name_loc12` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc11`,
      ADD COLUMN `name_loc13` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc12`,
      ADD COLUMN `name_loc14` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc13`,
      ADD COLUMN `name_loc15` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc14`,
      CHANGE COLUMN `nameSubText_loc1` `nameSubText_loc1` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `nameSubText_loc2` `nameSubText_loc2` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `nameSubText_loc3` `nameSubText_loc3` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `nameSubText_loc4` `nameSubText_loc4` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `nameSubText_loc5` `nameSubText_loc5` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `nameSubText_loc6` `nameSubText_loc6` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      ADD COLUMN `nameSubText_loc7` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `nameSubText_loc6`,
      ADD COLUMN `nameSubText_loc8` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `nameSubText_loc7`,
      ADD COLUMN `nameSubText_loc9` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `nameSubText_loc8`,
      ADD COLUMN `nameSubText_loc10` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `nameSubText_loc9`,
      ADD COLUMN `nameSubText_loc11` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `nameSubText_loc10`,
      ADD COLUMN `nameSubText_loc12` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `nameSubText_loc11`,
      ADD COLUMN `nameSubText_loc13` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `nameSubText_loc12`,
      ADD COLUMN `nameSubText_loc14` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `nameSubText_loc13`,
      ADD COLUMN `nameSubText_loc15` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `nameSubText_loc14`,
      CHANGE COLUMN `description_loc1` `description_loc1` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `description_loc2` `description_loc2` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `description_loc3` `description_loc3` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `description_loc4` `description_loc4` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `description_loc5` `description_loc5` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `description_loc6` `description_loc6` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      ADD COLUMN `description_loc7` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc6`,
      ADD COLUMN `description_loc8` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc7`,
      ADD COLUMN `description_loc9` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc8`,
      ADD COLUMN `description_loc10` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc9`,
      ADD COLUMN `description_loc11` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc10`,
      ADD COLUMN `description_loc12` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc11`,
      ADD COLUMN `description_loc13` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc12`,
      ADD COLUMN `description_loc14` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc13`,
      ADD COLUMN `description_loc15` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc14`,
      CHANGE COLUMN `auraDescription_loc1` `auraDescription_loc1` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `auraDescription_loc2` `auraDescription_loc2` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `auraDescription_loc3` `auraDescription_loc3` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `auraDescription_loc4` `auraDescription_loc4` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `auraDescription_loc5` `auraDescription_loc5` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      CHANGE COLUMN `auraDescription_loc6` `auraDescription_loc6` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
      ADD COLUMN `auraDescription_loc7` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `auraDescription_loc6`,
      ADD COLUMN `auraDescription_loc8` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `auraDescription_loc7`,
      ADD COLUMN `auraDescription_loc9` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `auraDescription_loc8`,
      ADD COLUMN `auraDescription_loc10` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `auraDescription_loc9`,
      ADD COLUMN `auraDescription_loc11` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `auraDescription_loc10`,
      ADD COLUMN `auraDescription_loc12` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `auraDescription_loc11`,
      ADD COLUMN `auraDescription_loc13` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `auraDescription_loc12`,
      ADD COLUMN `auraDescription_loc14` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `auraDescription_loc13`,
      ADD COLUMN `auraDescription_loc15` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `auraDescription_loc14`;

ALTER TABLE `locales_taxi_node`
      ADD COLUMN `name_loc7` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc6`,
      ADD COLUMN `name_loc8` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc7`,
      ADD COLUMN `name_loc9` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc8`,
      ADD COLUMN `name_loc10` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc9`,
      ADD COLUMN `name_loc11` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc10`,
      ADD COLUMN `name_loc12` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc11`,
      ADD COLUMN `name_loc13` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc12`,
      ADD COLUMN `name_loc14` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc13`,
      ADD COLUMN `name_loc15` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc14`;

ALTER TABLE `mail_text_template`
      ADD COLUMN `content_loc8` text AFTER `content_loc7`,
      ADD COLUMN `content_loc9` text AFTER `content_loc8`,
      ADD COLUMN `content_loc10` text AFTER `content_loc9`,
      ADD COLUMN `content_loc11` text AFTER `content_loc10`,
      ADD COLUMN `content_loc12` text AFTER `content_loc11`,
      ADD COLUMN `content_loc13` text AFTER `content_loc12`,
      ADD COLUMN `content_loc14` text AFTER `content_loc13`,
      ADD COLUMN `content_loc15` text AFTER `content_loc14`;

ALTER TABLE `mangos_string`
      ADD COLUMN `content_loc9` text AFTER `content_loc8`,
      ADD COLUMN `content_loc10` text AFTER `content_loc9`,
      ADD COLUMN `content_loc11` text AFTER `content_loc10`,
      ADD COLUMN `content_loc12` text AFTER `content_loc11`,
      ADD COLUMN `content_loc13` text AFTER `content_loc12`,
      ADD COLUMN `content_loc14` text AFTER `content_loc13`,
      ADD COLUMN `content_loc15` text AFTER `content_loc14`;

ALTER TABLE `npc_trainer_greeting`
      ADD COLUMN `content_loc9` text NOT NULL AFTER `content_loc8`,
      ADD COLUMN `content_loc10` text NOT NULL AFTER `content_loc9`,
      ADD COLUMN `content_loc11` text NOT NULL AFTER `content_loc10`,
      ADD COLUMN `content_loc12` text NOT NULL AFTER `content_loc11`,
      ADD COLUMN `content_loc13` text NOT NULL AFTER `content_loc12`,
      ADD COLUMN `content_loc14` text NOT NULL AFTER `content_loc13`,
      ADD COLUMN `content_loc15` text NOT NULL AFTER `content_loc14`;

ALTER TABLE `quest_greeting`
      ADD COLUMN `content_loc9` text AFTER `content_loc8`,
      ADD COLUMN `content_loc10` text AFTER `content_loc9`,
      ADD COLUMN `content_loc11` text AFTER `content_loc10`,
      ADD COLUMN `content_loc12` text AFTER `content_loc11`,
      ADD COLUMN `content_loc13` text AFTER `content_loc12`,
      ADD COLUMN `content_loc14` text AFTER `content_loc13`,
      ADD COLUMN `content_loc15` text AFTER `content_loc14`;

ALTER TABLE `script_texts`
      ADD COLUMN `content_loc9` text AFTER `content_loc8`,
      ADD COLUMN `content_loc10` text AFTER `content_loc9`,
      ADD COLUMN `content_loc11` text AFTER `content_loc10`,
      ADD COLUMN `content_loc12` text AFTER `content_loc11`,
      ADD COLUMN `content_loc13` text AFTER `content_loc12`,
      ADD COLUMN `content_loc14` text AFTER `content_loc13`,
      ADD COLUMN `content_loc15` text AFTER `content_loc14`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
