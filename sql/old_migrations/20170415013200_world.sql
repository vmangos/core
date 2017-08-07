INSERT INTO `migrations` VALUES ('20170415013200');

-- Bluffwatcher sends you to Undercity Locksmith instead of Thunder Bluff Bank
UPDATE `gossip_menu_option` SET `action_poi_id` = 275 WHERE `action_menu_id` = 743 AND `action_poi_id` = 325 LIMIT 1;

-- Bluffwatcher sends you to Undercity Inn instead of Thunder Bluff Wind Rider
UPDATE `gossip_menu_option` SET `action_poi_id` = 276 WHERE `action_menu_id` = 744 AND `action_poi_id` = 324 LIMIT 1;

-- Bluffwatcher sends you to Undercity Guild Master instead of Thunder Bluff Civic Information
UPDATE `gossip_menu_option` SET `action_poi_id` = 277 WHERE `action_menu_id` = 742 AND `action_poi_id` = 323 LIMIT 1;

-- Bluffwatcher sends you to Battlemasters Undercity instead of Thunder Bluff Inn
UPDATE `gossip_menu_option` SET `action_poi_id` = 278 WHERE `action_menu_id` = 2461 AND `action_poi_id` = 322 LIMIT 1;

-- Bluffwatcher sends you to Undercity Bat Handler instead of Thunder Bluff Mailbox
UPDATE `gossip_menu_option` SET `action_poi_id` = 279 WHERE `action_menu_id` = 2462 AND `action_poi_id` = 321 LIMIT 1;

-- Bluffwatcher sends you to Undercity Barber instead of Thunder Bluff Auction House
UPDATE `gossip_menu_option` SET `action_poi_id` = 280 WHERE `action_menu_id` = 2463 AND `action_poi_id` = 320 LIMIT 1;

-- Bluffwatcher sends you to Undercity Bank instead of Ansekhwa (TB weapon master)
UPDATE `gossip_menu_option` SET `action_poi_id` = 281 WHERE `action_menu_id` = 3725 AND `action_poi_id` = 319 LIMIT 1;

-- Bluffwatcher sends you to Undercity Auction House instead of Bulrug (TB stable master)
UPDATE `gossip_menu_option` SET `action_poi_id` = 282 WHERE `action_menu_id` = 4904 AND `action_poi_id` = 318 LIMIT 1;

-- Bluffwatcher sends you to Orgrimmar Cloth shit instead of Battlemasters Thunder Bluff
UPDATE `gossip_menu_option` SET `action_poi_id` = 283 WHERE `action_menu_id` = 8223 AND `action_poi_id` = 317 LIMIT 1;
