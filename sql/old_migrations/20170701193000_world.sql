INSERT INTO `migrations` VALUES ('20170701193000'); 

-- Set RequiredLevel for Beheading Blade (ID: 15253) to 57:
UPDATE item_template SET RequiredLevel = 57 WHERE entry = 15253;
