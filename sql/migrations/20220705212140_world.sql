DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220705212140');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220705212140');
-- Add your query below.


-- Correct position of Raven Hill Spirit Healer
UPDATE `creature` SET  `position_x` = -10599.2, `position_y` = 294.208, `position_z` = 31.7003, `orientation` = 3.14159 WHERE `guid` = 12783;
-- Correct position of Crown Guard Tower Spirit Healer
UPDATE `creature` SET  `position_x` = 1978.22, `position_y` = -3666.04, `position_z` = 119.364, `orientation` = 1.36136 WHERE `guid` = 9386;
-- Correct position of Scarab Wall Spirit Healer
UPDATE `creature` SET  `position_x` = -7988.49, `position_y` = 1557.96, `position_z` = 4.73619, `orientation` = 3.10669 WHERE `guid` = 7716;
-- Correct position of Booty Bay Spirit Healer
UPDATE `creature` SET  `position_x` = -14280.6, `position_y` = 300.899, `position_z` = 31.2034, `orientation` = 4.50295 WHERE `guid` = 40519;
-- Correct position of Flame Crest Spirit Healer
UPDATE `creature` SET  `position_x` = -7493.53, `position_y` = -2115.28, `position_z` = 136.081, `orientation` = 4.7473 WHERE `guid` = 40528;
-- Correct position of Kargath Spirit Healer
UPDATE `creature` SET  `position_x` = -6811.41, `position_y` = -2284.96, `position_z` = 280.836, `orientation` = 5.88176 WHERE `guid` = 40529;
-- Correct position of Thelsamar Spirit Healer
UPDATE `creature` SET  `position_x` = -5351.07, `position_y` = -2890.37, `position_z` = 341.881, `orientation` = 1.7693 WHERE `guid` = 40533;
-- Correct position of Baradin Bay Spirit Healer
UPDATE `creature` SET  `position_x` = -3341.49, `position_y` = -874.43, `position_z` = 1.05191, `orientation` = 1.93732 WHERE `guid` = 40535;
-- Correct position of Southshore Spirit Healer
UPDATE `creature` SET  `position_x` = -1466.13, `position_y` = -2623.03, `position_z` = 48.3792, `orientation` = 2.62308 WHERE `guid` = 40537;
-- Correct position of Southshore Spirit Healer
UPDATE `creature` SET  `position_x` = -722.308, `position_y` = -589.772, `position_z` = 25.0115, `orientation` = 3.31613 WHERE `guid` = 40538;
-- Correct position of Overlook Cliffs Spirit Healer
UPDATE `creature` SET  `position_x` = -280.818, `position_y` = -4373.96, `position_z` = 106.71, `orientation` = 3.01942 WHERE `guid` = 40539;
-- Correct position of Tarren Mill Spirit Healer
UPDATE `creature` SET  `position_x` = -20.4097, `position_y` = -970.476, `position_z` = 55.656, `orientation` = 5.34071 WHERE `guid` = 40540;
-- Correct position of Aerie Peak Spirit Healer
UPDATE `creature` SET  `position_x` = 315.853, `position_y` = -2225.2, `position_z` = 136.471, `orientation` = 6.00393 WHERE `guid` = 40541;
-- Correct position of Chillwind Camp Spirit Healer
UPDATE `creature` SET  `position_x` = 913.108, `position_y` = -1541.12, `position_z` = 55.1592, `orientation` = 1.74533 WHERE `guid` = 40543;
-- Correct position of Darrowshire Spirit Healer
UPDATE `creature` SET  `position_x` = 1410.04, `position_y` = -3699.86, `position_z` = 76.3213, `orientation` = 3.1765 WHERE `guid` = 40545;
-- Correct position of Un'goro Spirit Healer
UPDATE `creature` SET  `position_x` = -7192.84, `position_y` = -2428.27, `position_z` = -217.691, `orientation` = 3.64774 WHERE `guid` = 40553;
-- Correct position of Gadgetzan Spirit Healer
UPDATE `creature` SET  `position_x` = -7199.64, `position_y` = -3940.97, `position_z` = 9.53764, `orientation` = 6.03884 WHERE `guid` = 40554;
-- Correct position of Cenarion Hold Spirit Healer
UPDATE `creature` SET  `position_x` = -6853.79, `position_y` = 898.679, `position_z` = 33.1247, `orientation` = 6.05629 WHERE `guid` = 40555;
-- Correct position of Valor's Rest Spirit Healer
UPDATE `creature` SET  `position_x` = -6415.84, `position_y` = -274.837, `position_z` = 2.84721, `orientation` = 3.33358 WHERE `guid` = 40556;
-- Correct position of Shimmering Flats Spirit Healer
UPDATE `creature` SET  `position_x` = -5532.44, `position_y` = -3477.58, `position_z` = -49.5378, `orientation` = 1.41372 WHERE `guid` = 40557;
-- Correct position of Great Lift Spirit Healer
UPDATE `creature` SET  `position_x` = -4656.07, `position_y` = -1775.79, `position_z` = -42.8399, `orientation` = 1.51844 WHERE `guid` = 40559;
-- Correct position of Feathermoon Stronghold Spirit Healer
UPDATE `creature` SET  `position_x` = -4588.59, `position_y` = 3248.58, `position_z` = 9.04429, `orientation` = 4.41568 WHERE `guid` = 40560;
-- Correct position of Dire Maul Spirit Healer
UPDATE `creature` SET  `position_x` = -4576.97, `position_y` = 1632.26, `position_z` = 94.4312, `orientation` = 3.12414 WHERE `guid` = 40561;
-- Correct position of Camp Mojache Spirit Healer
UPDATE `creature` SET  `position_x` = -4450.49, `position_y` = 370.985, `position_z` = 51.8063, `orientation` = 6.21337 WHERE `guid` = 40562;
-- Correct position of Bloodhoof Village Spirit Healer
UPDATE `creature` SET  `position_x` = -2176.47, `position_y` = -336.678, `position_z` = -6.02402, `orientation` = 4.99164 WHERE `guid` = 40567;
-- Correct position of Kodo Graveyard Spirit Healer
UPDATE `creature` SET  `position_x` = -1433, `position_y` = 1973.57, `position_z` = 86.7027, `orientation` = 3.24631 WHERE `guid` = 40568;
-- Correct position of Thunder Bluff Spirit Healer
UPDATE `creature` SET  `position_x` = -972.723, `position_y` = -74.6611, `position_z` = 17.9388, `orientation` = 3.15905 WHERE `guid` = 40570;
-- Correct position of Sen'jin Village Spirit Healer
UPDATE `creature` SET  `position_x` = -774.081, `position_y` = -5002.68, `position_z` = 18.0194, `orientation` = 1.76278 WHERE `guid` = 40571;
-- Correct position of Valley of Trials Spirit Healer
UPDATE `creature` SET  `position_x` = -637.768, `position_y` = -4300.84, `position_z` = 40.9094, `orientation` = 1.16937 WHERE `guid` = 40572;
-- Correct position of Razor Hill Spirit Healer
UPDATE `creature` SET  `position_x` = 241.866, `position_y` = -4791.44, `position_z` = 10.3538, `orientation` = 3.64774 WHERE `guid` = 40574;
-- Correct position of Webwinder Path Spirit Healer
UPDATE `creature` SET  `position_x` = 898.506, `position_y` = 442.058, `position_z` = 65.6664, `orientation` = 4.66003 WHERE `guid` = 40575;
-- Correct position of Orgrimmar Spirit Healer
UPDATE `creature` SET  `position_x` = 1188.5, `position_y` = -4450.08, `position_z` = 21.4571, `orientation` = 4.18879 WHERE `guid` = 40576;
-- Correct position of Nightsong Woods Spirit Healer
UPDATE `creature` SET  `position_x` = 2442.74, `position_y` = -2952.63, `position_z` = 123.782, `orientation` = 3.19395 WHERE `guid` = 40577;
-- Correct position of Astranaar Spirit Healer
UPDATE `creature` SET  `position_x` = 2629.61, `position_y` = -613.735, `position_z` = 107.361, `orientation` = 4.90438 WHERE `guid` = 40578;
-- Correct position of Talrendis Point Spirit Healer
UPDATE `creature` SET  `position_x` = 2680.21, `position_y` = -4014.14, `position_z` = 108.24, `orientation` = 1.62316 WHERE `guid` = 40579;
-- Correct position of Southridge Beach Spirit Healer
UPDATE `creature` SET  `position_x` = 2928.09, `position_y` = -6032, `position_z` = 5.49124, `orientation` = 5.96903 WHERE `guid` = 40580;
-- Correct position of Morlos'Aran Spirit Healer
UPDATE `creature` SET  `position_x` = 3812.72, `position_y` = -1594.08, `position_z` = 219.511, `orientation` = 3.82227 WHERE `guid` = 40581;
-- Correct position of Twilight Vale Spirit Healer
UPDATE `creature` SET  `position_x` = 4302.35, `position_y` = 90.721, `position_z` = 42.8665, `orientation` = 2.98451 WHERE `guid` = 40582;
-- Correct position of Legash Encampment Spirit Healer
UPDATE `creature` SET  `position_x` = 4814, `position_y` = -6847.45, `position_z` = 90.2365, `orientation` = 3.01942 WHERE `guid` = 40583;
-- Correct position of Auberdine Spirit Healer
UPDATE `creature` SET  `position_x` = 6741.53, `position_y` = 195.583, `position_z` = 23.1948, `orientation` = 1.78024 WHERE `guid` = 40585;
-- Correct position of Moonglade Spirit Healer
UPDATE `creature` SET  `position_x` = 7418.56, `position_y` = -2816.22, `position_z` = 464.307, `orientation` = 0.802851 WHERE `guid` = 40587;
-- Correct position of North Badlands Spirit Healer
UPDATE `creature` SET  `position_x` = -6298.81, `position_y` = -3497.08, `position_z` = 250.634, `orientation` = 0.418879 WHERE `guid` = 40593;
-- Correct position of Kharanos Spirit Healer
UPDATE `creature` SET  `position_x` = -5686.38, `position_y` = -514.7, `position_z` = 396.358, `orientation` = 5.71036 WHERE `guid` = 87045;
-- Correct position of Dolanaar Spirit Healer
UPDATE `creature` SET  `position_x` = 9683.94, `position_y` = 953.23, `position_z` = 1291.72, `orientation` = 5.67232 WHERE `guid` = 87048;
-- Correct position of Darnassus Spirit Healer
UPDATE `creature` SET  `position_x` = 10046.3, `position_y` = 2123.84, `position_z` = 1329.64, `orientation` = 5.60251 WHERE `guid` = 87049;
-- Correct position of Deadwind Pass Spirit Healer
UPDATE `creature` SET  `position_x` = -11119.0186, `position_y` = -1832.66321, `position_z` = 71.94753, `orientation` = 6.24827862 WHERE `guid` = 17649;
-- Correct position of Deathknell Spirit Healer
UPDATE `creature` SET  `position_x` = 1882.77588, `position_y` = 1622.23645, `position_z` = 94.28485, `orientation` = 1.47358 WHERE `guid` = 40547;
-- Correct position of Red Cloud Mesa Spirit Healer
UPDATE `creature` SET  `position_x` = -2947.77124, `position_y` = -142.5038, `position_z` = 66.97109, `orientation` = 5.113815 WHERE `guid` = 40565;
-- Correct position of Coldridge Valley Spirit Healer
UPDATE `creature` SET  `position_x` = -6169.81445, `position_y` = 346.84375, `position_z` = 400.1516, `orientation` = 5.323141 WHERE `guid` = 87046;
-- Correct position of Northshire Valley Spirit Healer
UPDATE `creature` SET  `position_x` = -8946.229, `position_y` = -183.477219, `position_z` = 79.99528, `orientation` = 5.825852 WHERE `guid` = 87047;
-- Correct position of Ironforge Spirit Healer
UPDATE `creature` SET  `position_x` = -5156.31348, `position_y` = -864.9803, `position_z` = 507.6792, `orientation` = 3.931262 WHERE `guid` = 87044;
-- Correct postion of Shadowglen Spirit Healer
UPDATE `creature` SET  `position_x` = 10391.8535, `position_y` = 826.4149, `position_z` = 1317.60156, `orientation` = 4.118977 WHERE `guid` = 87050;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
