-- key requirement added to Large scarab coffer
UPDATE `gameobject_template` SET `flags`='2' WHERE `entry`='180690';

-- large scarab coffer drop 1-3 idols, all 25% chance to drop from what I can find (some sources give varying droprates, but i cant see why that would be the case)
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20874';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20875';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20876';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20877';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20878';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20879';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20881';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20882';

-- large scarab coffer can drop 1-3 bags, and always drop one
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='100', `maxcount`='3' WHERE `entry`='17533' and`item`='21156';

-- regular scarab coffer bag droprate set to 85%
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='85' WHERE `entry`='17532' and`item`='21156';
