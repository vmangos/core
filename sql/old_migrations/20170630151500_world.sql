INSERT INTO `migrations` VALUES ('20170630151500'); 

-- Set ItemeLevel for Manaweave Robe (ID: 7509) to 15:
UPDATE item_template SET ItemLevel = 15 WHERE entry = 7509;

-- Set BuyPrice for Manaweave Robe (ID: 7509) to 13s 76c:
UPDATE item_template SET BuyPrice = 1376 WHERE entry = 7509;
-- Set SellPrice for Manaweave Robe (ID: 7509) to 2s 76c:
UPDATE item_template SET SellPrice = 275 WHERE entry = 7509;
