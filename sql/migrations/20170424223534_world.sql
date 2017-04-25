INSERT INTO `migrations` VALUES ('20170424223534'); 

-- Need to create a separate template entry for every chest so they can drop different notes.
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`) VALUES (190484, 3, 10, 'Document Chest', 0, 4, 1.5, 93, 190484, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`) VALUES (190483, 3, 10, 'Document Chest', 0, 4, 1.5, 93, 190483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_loot_template` WHERE `entry`=2774 && `item` IN (12766, 12768);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (190484, 12768, -100, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (190483, 12766, -100, 0, 1, 1, 0);
DELETE FROM `conditions` WHERE `condition_entry` IN (30,31);
UPDATE `gameobject` SET `spawntimesecs`=180 WHERE `guid`=17201;
UPDATE `gameobject` SET `id`=190484, `spawntimesecs`=180 WHERE `guid`=17200;
UPDATE `gameobject` SET `id`=190483, `spawntimesecs`=180 WHERE `guid`=17199;
