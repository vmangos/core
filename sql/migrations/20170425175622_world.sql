INSERT INTO `migrations` VALUES ('20170425175622');

-- Add 2 min global CD to Poison Resistance Elixir
UPDATE `item_template` SET `spellcooldown_1` = 120000, `spellcategorycooldown_1` = 120000, `spellcategory_1` = 4
WHERE `entry` = 3386;
