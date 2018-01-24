
-- Move updated versions of Epic PVP to 1.10 rather than 1.11
UPDATE item_template SET patch = 8 WHERE itemset IN (402, 384, 395, 389, 388, 397, 392, 394, 383, 386, 396, 390, 387, 398, 391, 393) and patch = 9;

-- Move new epic weapons to 1.10
UPDATE item_template SET patch = 8 WHERE entry IN (23451, 23452, 23453, 23454, 23455, 23456, 23464, 23465, 23466, 23467, 23468, 23469);
-- Forbidden <= 1.9
UPDATE forbidden_items SET patch = 7 WHERE entry IN (23451, 23452, 23453, 23454, 23455, 23456, 23464, 23465, 23466, 23467, 23468, 23469);

-- Move vendor from 1.11 to 1.10
UPDATE creature_template SET patch = 8 WHERE patch = 9 AND entry  IN (12794, 12784);

-- Warsong Epic leg rewards
UPDATE item_template SET patch = 8 WHERE entry IN (22651, 22673, 22676, 22740, 22741, 22747, 22672, 22748, 22749, 22750, 22752, 22753);
UPDATE forbidden_items SET patch = 7 WHERE entry IN (22651, 22673, 22676, 22740, 22741, 22747, 22672, 22748, 22749, 22750, 22752, 22753);
