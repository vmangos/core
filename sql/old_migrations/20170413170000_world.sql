INSERT INTO `migrations` VALUES ('20170413170000');

-- Darnassus Sentinel sends you to Tirisfal Glades herbalism trainer
UPDATE `gossip_menu_option` SET `action_poi_id` = 268 WHERE `menu_id` = 2351 AND `action_poi_id` = 440 LIMIT 1;

-- Undercity Guardian sends you to Tailoring trainer instead of Skinning trainer
UPDATE `gossip_menu_option` SET `action_poi_id` = 346 WHERE `action_menu_id` = 2844 AND `action_poi_id` = 348 LIMIT 1;

-- Undercity Guardian sends you to Mining trainer instead of Leatherworking trainer
UPDATE `gossip_menu_option` SET `action_poi_id` = 345 WHERE `action_menu_id` = 2842 AND `action_poi_id` = 347 LIMIT 1;

-- Undercity Guardian sends you to Skinning trainer instead of Mining trainer
UPDATE `gossip_menu_option` SET `action_poi_id` = 347 WHERE `action_menu_id` = 2843 AND `action_poi_id` = 346 LIMIT 1;

-- Ironforge Mountaineer sends you to Undercity Enchanting trainer instead of Dun Morogh Mining trainer (Yarr Hammerstone)
UPDATE `gossip_menu_option` SET `action_poi_id` = 402 WHERE `action_menu_id` = 3555 AND `action_poi_id` = 339 LIMIT 1;

-- Stormwind City Guard/Patroller sends you to Enchanting trainer instead of Cooking trainer
UPDATE `gossip_menu_option` SET `action_poi_id` = 42 WHERE `action_menu_id` = 424 AND `action_poi_id` = 43 LIMIT 1;

-- Stormwind Guard sends you to Silvermoon City Mage Trainer instead of Elwynn Forest Herbalism trainer
UPDATE `gossip_menu_option` SET `action_poi_id` = 269 WHERE `action_menu_id` = 3527 AND `action_poi_id` = 363 LIMIT 1;
