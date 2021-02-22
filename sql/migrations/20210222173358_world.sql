DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210222173358');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210222173358');
-- Add your query below.

-- Morbent fel should be level 35 pre patch 1.6
UPDATE `creature_template` SET `patch`='4' WHERE  `entry`=1200 AND `patch`=0;
INSERT INTO `creature_template` VALUES (1200, 0, 4272, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Morbent Fel', '', 0, 35, 35, 3609, 3609, 3543, 3543, 694, 21, 0, 1, 1.14286, 20, 5, 0, 1, 1, 193, 249, 0, 128, 1, 2000, 2000, 8, 32832, 0, 0, 0, 0, 0, 0, 44.84, 61.655, 100, 7, 0, 1200, 1200, 0, 0, 0, 0, 0, 0, 0, 3108, 3109, 8909, 0, 12000, 0, NULL, 209, 277, 'EventAI', 1, 3, 0, 0, 3, 1200, 0, 0, 0, 0, 0, 'spell_dummy_npc');

-- Stalvan Mistmantle should be level 35 pre patch 1.6
UPDATE `creature_template` SET `patch`='4' WHERE  `entry`=315 AND `patch`=0;
INSERT INTO `creature_template` VALUES (315, 0, 1562, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Stalvan Mistmantle', '', 0, 35, 35, 1585, 1585, 0, 0, 1270, 14, 0, 1, 1.14286, 20, 5, 0, 0, 1, 59, 72, 0, 128, 1, 1500, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 53.8384, 74.0278, 100, 6, 0, 315, 315, 0, 0, 0, 0, 0, 0, 0, 3105, 0, 0, 0, 3150, 0, NULL, 58, 81, 'EventAI', 0, 3, 0, 0, 3, 315, 0, 0, 8388624, 0, 0, '');

-- Zzarc' Vul should be level 33 pre patch 1.6
UPDATE `creature_template` SET `patch`='4' WHERE  `entry`=300 AND `patch`=0;
INSERT INTO `creature_template` VALUES (300, 0, 655, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Zzarc\' Vul', '', 0, 33, 33, 1050, 1050, 0, 0, 1200, 45, 0, 1, 1.14286, 20, 5, 0, 0, 1, 43, 53, 0, 132, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 53.8384, 74.0278, 100, 7, 0, 300, 300, 0, 0, 0, 0, 0, 0, 0, 8716, 0, 0, 0, 3000, 0, NULL, 44, 62, '', 0, 3, 0, 0, 3, 300, 0, 0, 0, 0, 0, '');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
