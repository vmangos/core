ALTER TABLE `item_template` ADD INDEX `patch_idx` (`patch` ASC);
ALTER TABLE `item_template` ADD INDEX `itemset_idx` (`itemset` ASC);
ALTER TABLE `forbidden_items` ADD INDEX `patch_idx` (`patch` ASC);

# Change new blue PvP sets to 1.09 from 1.11
UPDATE item_template SET patch = 7 WHERE itemset IN (542, 537, 541, 522, 540, 543, 539, 538, 546, 545, 547, 548, 549, 550, 544, 551);

# Restrict sale of original blue PvP sets to < 1.09
UPDATE forbidden_items SET patch = 7 WHERE patch = 9 AND AfterOrBefore = 0 AND entry IN (SELECT entry FROM item_template WHERE itemset IN (281, 301, 361, 342, 341, 382, 345, 347, 401, 282, 362, 344, 343, 381, 346, 348));

# Allow sale of new blue PvP sets in 1.09
UPDATE forbidden_items SET patch = 6 WHERE patch = 8 AND entry IN (SELECT entry FROM item_template WHERE itemset IN (542, 537, 541, 522, 540, 543, 539, 538, 546, 545, 547, 548, 549, 550, 544, 551));

# Swap set vendors from 1.11 to 1.09
UPDATE creature_template SET patch = 7 WHERE patch = 9 AND entry IN (12795, 12785);