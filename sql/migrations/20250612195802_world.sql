DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250612195802');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250612195802');
-- Add your query below.


-- Azshara
SET @GGUID = 20238;
SET @PTEMPLATE = 2900;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, 2006.71, -6443.73, 8.77095, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 1, 2277.1, -5971.03, 118.579, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1734, 1, 2310.18, -6733.72, 14.1142, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 1, 2544.78, -6086.42, 105.894, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1734, 1, 2681.72, -6717.88, 22.23, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1734, 1, 2689.48, -6350.98, 96.3382, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1734, 1, 2764.06, -6848.54, 16.7568, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1734, 1, 2807.62, -6055.96, 114.058, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1734, 1, 2822.44, -6454.93, -4.0609, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1734, 1, 2855.09, -5104.65, 118.711, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1734, 1, 3214.56, -5565.67, 51.2146, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1734, 1, 4258.01, -7748.26, 15.1625, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 1734, 1, 4453.96, -7709.05, 29.4606, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 1734, 1, 4559.1, -7258.93, 121.025, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 1734, 1, 4595.45, -7525.61, 81.3806, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 1734, 1, 4663.93, -7183.38, 117.92, 3.99681, 0, 0, -0.909961, 0.414694, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 1734, 1, 4708.22, -6843.86, 127.386, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 1734, 1, 4854.59, -6338.67, 121.691, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+18, 1734, 1, 4867.67, -7575.6, 18.2725, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+19, 1734, 1, 5082.54, -6940.99, 19.7926, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+20, 1734, 1, 5150.37, -5951.36, -15.0347, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+21, 2047, 1, 2006.71, -6443.73, 8.77095, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+22, 2047, 1, 2277.1, -5971.03, 118.579, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+23, 2047, 1, 2310.18, -6733.72, 14.1142, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+24, 2047, 1, 2544.78, -6086.42, 105.894, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+25, 2047, 1, 2681.72, -6717.88, 22.23, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+26, 2047, 1, 2689.48, -6350.98, 96.3382, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+27, 2047, 1, 2764.06, -6848.54, 16.7568, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+28, 2047, 1, 2807.62, -6055.96, 114.058, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+29, 2047, 1, 2822.44, -6454.93, -4.0609, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+30, 2047, 1, 2855.09, -5104.65, 118.711, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+31, 2047, 1, 3214.56, -5565.67, 51.2146, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+32, 2047, 1, 4258.01, -7748.26, 15.1625, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+33, 2047, 1, 4453.96, -7709.05, 29.4606, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+34, 2047, 1, 4559.1, -7258.93, 121.025, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+35, 2047, 1, 4595.45, -7525.61, 81.3806, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+36, 2047, 1, 4663.93, -7183.38, 117.92, 3.99681, 0, 0, -0.909961, 0.414694, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+37, 2047, 1, 4708.22, -6843.86, 127.386, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+38, 2047, 1, 4854.59, -6338.67, 121.691, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+39, 2047, 1, 4867.67, -7575.6, 18.2725, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+40, 2047, 1, 5082.54, -6940.99, 19.7926, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+41, 2047, 1, 5150.37, -5951.36, -15.0347, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+42, 2040, 1, 2006.71, -6443.73, 8.77095, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+43, 2040, 1, 2277.1, -5971.03, 118.579, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+44, 2040, 1, 2310.18, -6733.72, 14.1142, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+45, 2040, 1, 2544.78, -6086.42, 105.894, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+46, 2040, 1, 2681.72, -6717.88, 22.23, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+47, 2040, 1, 2689.48, -6350.98, 96.3382, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+48, 2040, 1, 2764.06, -6848.54, 16.7568, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+49, 2040, 1, 2807.62, -6055.96, 114.058, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+50, 2040, 1, 2822.44, -6454.93, -4.0609, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+51, 2040, 1, 2855.09, -5104.65, 118.711, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+52, 2040, 1, 3214.56, -5565.67, 51.2146, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+53, 2040, 1, 4258.01, -7748.26, 15.1625, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+54, 2040, 1, 4453.96, -7709.05, 29.4606, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+55, 2040, 1, 4559.1, -7258.93, 121.025, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+56, 2040, 1, 4595.45, -7525.61, 81.3806, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+57, 2040, 1, 4663.93, -7183.38, 117.92, 3.99681, 0, 0, -0.909961, 0.414694, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+58, 2040, 1, 4708.22, -6843.86, 127.386, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+59, 2040, 1, 4854.59, -6338.67, 121.691, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+60, 2040, 1, 4867.67, -7575.6, 18.2725, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+61, 2040, 1, 5082.54, -6940.99, 19.7926, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+62, 2040, 1, 5150.37, -5951.36, -15.0347, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+10, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+11, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+12, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+13, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+14, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+15, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+16, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+17, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+18, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+19, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+20, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+7, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+8, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+9, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+10, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+11, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+12, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+13, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+14, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+15, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+16, @PTEMPLATE+16, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+17, @PTEMPLATE+17, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+18, @PTEMPLATE+18, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+19, @PTEMPLATE+19, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+20, @PTEMPLATE+20, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+21, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+22, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+23, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+24, @PTEMPLATE+3, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+25, @PTEMPLATE+4, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+26, @PTEMPLATE+5, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+27, @PTEMPLATE+6, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+28, @PTEMPLATE+7, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+29, @PTEMPLATE+8, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+30, @PTEMPLATE+9, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+31, @PTEMPLATE+10, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+32, @PTEMPLATE+11, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+33, @PTEMPLATE+12, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+34, @PTEMPLATE+13, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+35, @PTEMPLATE+14, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+36, @PTEMPLATE+15, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+37, @PTEMPLATE+16, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+38, @PTEMPLATE+17, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+39, @PTEMPLATE+18, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+40, @PTEMPLATE+19, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+41, @PTEMPLATE+20, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+42, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+43, @PTEMPLATE+1, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+44, @PTEMPLATE+2, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+45, @PTEMPLATE+3, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+46, @PTEMPLATE+4, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+47, @PTEMPLATE+5, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+48, @PTEMPLATE+6, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+49, @PTEMPLATE+7, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+50, @PTEMPLATE+8, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+51, @PTEMPLATE+9, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+52, @PTEMPLATE+10, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+53, @PTEMPLATE+11, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+54, @PTEMPLATE+12, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+55, @PTEMPLATE+13, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+56, @PTEMPLATE+14, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+57, @PTEMPLATE+15, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+58, @PTEMPLATE+16, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+59, @PTEMPLATE+17, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+60, @PTEMPLATE+18, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+61, @PTEMPLATE+19, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10),
(@GGUID+62, @PTEMPLATE+20, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+6, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+7, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+8, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+9, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+10, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+11, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+12, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+13, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+14, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+15, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+16, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+17, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+18, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+19, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+20, 2338, 0, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Tanaris
SET @GGUID = 21960;
SET @PTEMPLATE = 3210;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, -9528.06, -3715.37, 19.7956, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 1, -9514.78, -2426.96, 29.4373, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1734, 1, -9505.18, -3027.37, 26.3328, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 1, -9501.84, -3650.66, 17.5296, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1734, 1, -9500.19, -2300.37, 26.823, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1734, 1, -9485.2, -3520.05, 24.0447, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1734, 1, -9448.11, -3242.33, 30.9762, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1734, 1, -9440.47, -2858.51, 23.1982, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1734, 1, -9414.91, -3913.26, 22.1043, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1734, 1, -9375.39, -3063.52, 17.3809, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1734, 1, -9337.35, -4248.36, 31.5042, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1734, 1, -9317.54, -4210.49, 23.3972, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 1734, 1, -9233.92, -3915.35, 9.26526, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 1734, 1, -8590.12, -4568.85, 9.00052, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 1734, 1, -8573.07, -4745.34, 7.60582, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 1734, 1, -8458.25, -3462.57, 34.2398, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 1734, 1, -8417.29, -4857.95, 9.27712, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 1734, 1, -7423.53, -2976.6, 11.0841, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+18, 2047, 1, -9528.06, -3715.37, 19.7956, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+19, 2047, 1, -9514.78, -2426.96, 29.4373, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+20, 2047, 1, -9505.18, -3027.37, 26.3328, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+21, 2047, 1, -9501.84, -3650.66, 17.5296, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+22, 2047, 1, -9500.19, -2300.37, 26.823, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+23, 2047, 1, -9485.2, -3520.05, 24.0447, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+24, 2047, 1, -9448.11, -3242.33, 30.9762, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+25, 2047, 1, -9440.47, -2858.51, 23.1982, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+26, 2047, 1, -9414.91, -3913.26, 22.1043, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+27, 2047, 1, -9375.39, -3063.52, 17.3809, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+28, 2047, 1, -9337.35, -4248.36, 31.5042, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+29, 2047, 1, -9317.54, -4210.49, 23.3972, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+30, 2047, 1, -9233.92, -3915.35, 9.26526, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+31, 2047, 1, -8590.12, -4568.85, 9.00052, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+32, 2047, 1, -8573.07, -4745.34, 7.60582, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+33, 2047, 1, -8458.25, -3462.57, 34.2398, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+34, 2047, 1, -8417.29, -4857.95, 9.27712, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+35, 2047, 1, -7423.53, -2976.6, 11.0841, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+36, 2040, 1, -9528.06, -3715.37, 19.7956, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+37, 2040, 1, -9514.78, -2426.96, 29.4373, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+38, 2040, 1, -9505.18, -3027.37, 26.3328, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+39, 2040, 1, -9501.84, -3650.66, 17.5296, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+40, 2040, 1, -9500.19, -2300.37, 26.823, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+41, 2040, 1, -9485.2, -3520.05, 24.0447, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+42, 2040, 1, -9448.11, -3242.33, 30.9762, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+43, 2040, 1, -9440.47, -2858.51, 23.1982, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+44, 2040, 1, -9414.91, -3913.26, 22.1043, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+45, 2040, 1, -9375.39, -3063.52, 17.3809, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+46, 2040, 1, -9337.35, -4248.36, 31.5042, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+47, 2040, 1, -9317.54, -4210.49, 23.3972, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+48, 2040, 1, -9233.92, -3915.35, 9.26526, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+49, 2040, 1, -8590.12, -4568.85, 9.00052, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+50, 2040, 1, -8573.07, -4745.34, 7.60582, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+51, 2040, 1, -8458.25, -3462.57, 34.2398, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+52, 2040, 1, -8417.29, -4857.95, 9.27712, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+53, 2040, 1, -7423.53, -2976.6, 11.0841, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+10, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+11, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+12, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+13, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+14, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+15, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+16, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10),
(@PTEMPLATE+17, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+7, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+8, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+9, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+10, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+11, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+12, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+13, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+14, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+15, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+16, @PTEMPLATE+16, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+17, @PTEMPLATE+17, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+18, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+19, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+20, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+21, @PTEMPLATE+3, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+22, @PTEMPLATE+4, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+23, @PTEMPLATE+5, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+24, @PTEMPLATE+6, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+25, @PTEMPLATE+7, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+26, @PTEMPLATE+8, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+27, @PTEMPLATE+9, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+28, @PTEMPLATE+10, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+29, @PTEMPLATE+11, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+30, @PTEMPLATE+12, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+31, @PTEMPLATE+13, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+32, @PTEMPLATE+14, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+33, @PTEMPLATE+15, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+34, @PTEMPLATE+16, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+35, @PTEMPLATE+17, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+36, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+37, @PTEMPLATE+1, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+38, @PTEMPLATE+2, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+39, @PTEMPLATE+3, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+40, @PTEMPLATE+4, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+41, @PTEMPLATE+5, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+42, @PTEMPLATE+6, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+43, @PTEMPLATE+7, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+44, @PTEMPLATE+8, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+45, @PTEMPLATE+9, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+46, @PTEMPLATE+10, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+47, @PTEMPLATE+11, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+48, @PTEMPLATE+12, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+49, @PTEMPLATE+13, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+50, @PTEMPLATE+14, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+51, @PTEMPLATE+15, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+52, @PTEMPLATE+16, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+53, @PTEMPLATE+17, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+6, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+7, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+8, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+9, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+10, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+11, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+12, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+13, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+14, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+15, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+16, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+17, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Desolace
SET @GGUID = 9805;
SET @PTEMPLATE = 2885;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, -1936.1, 1310.55, 95.6484, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 1, -1806.31, 799.707, 108.15, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1734, 1, -177.584, 2792.13, -7.16658, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 1, -151.788, 643.204, 99.1837, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1734, 1, -40.2136, 2379.6, -8.22313, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1734, 1, -39.5373, 2462.06, -19.9778, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1734, 1, 91.1241, 935.352, 162.346, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1734, 1, 133.831, 2453.66, -17.9917, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1734, 1, 171.409, 2583.08, -74.3176, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1734, 1, 215.468, 2874.83, 10.166, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 2047, 1, -1936.1, 1310.55, 95.6484, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 2047, 1, -1806.31, 799.707, 108.15, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 2047, 1, -177.584, 2792.13, -7.16658, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 2047, 1, -151.788, 643.204, 99.1837, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 2047, 1, -40.2136, 2379.6, -8.22313, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 2047, 1, -39.5373, 2462.06, -19.9778, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 2047, 1, 91.1241, 935.352, 162.346, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 2047, 1, 133.831, 2453.66, -17.9917, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+18, 2047, 1, 171.409, 2583.08, -74.3176, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+19, 2047, 1, 215.468, 2874.83, 10.166, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+20, 2040, 1, -1936.1, 1310.55, 95.6484, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+21, 2040, 1, -1806.31, 799.707, 108.15, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+22, 2040, 1, -177.584, 2792.13, -7.16658, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+23, 2040, 1, -151.788, 643.204, 99.1837, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+24, 2040, 1, -40.2136, 2379.6, -8.22313, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+25, 2040, 1, -39.5373, 2462.06, -19.9778, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+26, 2040, 1, 91.1241, 935.352, 162.346, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+27, 2040, 1, 133.831, 2453.66, -17.9917, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+28, 2040, 1, 171.409, 2583.08, -74.3176, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+29, 2040, 1, 215.468, 2874.83, 10.166, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+7, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+8, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+9, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+3, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+4, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+5, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+16, @PTEMPLATE+6, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+17, @PTEMPLATE+7, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+18, @PTEMPLATE+8, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+19, @PTEMPLATE+9, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+20, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+21, @PTEMPLATE+1, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+22, @PTEMPLATE+2, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+23, @PTEMPLATE+3, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+24, @PTEMPLATE+4, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+25, @PTEMPLATE+5, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+26, @PTEMPLATE+6, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+27, @PTEMPLATE+7, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+28, @PTEMPLATE+8, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+29, @PTEMPLATE+9, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+6, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+7, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+8, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+9, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Hinterlands
SET @GGUID = 6583;
SET @PTEMPLATE = 2997;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 0, -667.825, -3920.26, 245.978, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 0, -351.676, -2744.9, 98.3678, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1734, 0, -246.163, -2991.56, 128.808, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 0, -155.457, -2558.44, 126.175, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1734, 0, 400.208, -3212.93, 171.973, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1734, 0, 608.484, -3381.76, 104.346, 4.79966, 0, 0, -0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1734, 0, 963.838, -3804.26, 120.842, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1734, 0, 1150.9, -4254.94, 238.294, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 2047, 0, -667.825, -3920.26, 245.978, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 2047, 0, -351.676, -2744.9, 98.3678, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 2047, 0, -246.163, -2991.56, 128.808, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 2047, 0, -155.457, -2558.44, 126.175, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 2047, 0, 400.208, -3212.93, 171.973, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 2047, 0, 608.484, -3381.76, 104.346, 4.79966, 0, 0, -0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 2047, 0, 963.838, -3804.26, 120.842, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 2047, 0, 1150.9, -4254.94, 238.294, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 2040, 0, -667.825, -3920.26, 245.978, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 2040, 0, -351.676, -2744.9, 98.3678, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+18, 2040, 0, -246.163, -2991.56, 128.808, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+19, 2040, 0, -155.457, -2558.44, 126.175, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+20, 2040, 0, 400.208, -3212.93, 171.973, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+21, 2040, 0, 608.484, -3381.76, 104.346, 4.79966, 0, 0, -0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+22, 2040, 0, 963.838, -3804.26, 120.842, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+23, 2040, 0, 1150.9, -4254.94, 238.294, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 0, 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+7, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+3, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+4, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+5, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+6, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+7, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+16, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+17, @PTEMPLATE+1, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+18, @PTEMPLATE+2, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+19, @PTEMPLATE+3, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+20, @PTEMPLATE+4, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+21, @PTEMPLATE+5, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+22, @PTEMPLATE+6, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10),
(@GGUID+23, @PTEMPLATE+7, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+6, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+7, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Shalzaru's Lair
SET @GGUID = 6209;
SET @PTEMPLATE = 2872;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, -5656.86, 3491.89, 1.01712, 2.82743, 0, 0, 0.987688, 0.156434, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 1, -5621.37, 3563.23, 8.37834, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1734, 1, -5519.6, 3571.31, 22.6286, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 1, -5513.58, 3528.67, -7.01885, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1734, 1, -5512.9, 3619.79, -2.88971, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1734, 1, -5484, 3646.85, -0.048251, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 2047, 1, -5656.86, 3491.89, 1.01712, 2.82743, 0, 0, 0.987688, 0.156434, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 2047, 1, -5621.37, 3563.23, 8.37834, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 2047, 1, -5519.6, 3571.31, 22.6286, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 2047, 1, -5513.58, 3528.67, -7.01885, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 2047, 1, -5512.9, 3619.79, -2.88971, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 2047, 1, -5484, 3646.85, -0.048251, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 2040, 1, -5656.86, 3491.89, 1.01712, 2.82743, 0, 0, 0.987688, 0.156434, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 2040, 1, -5621.37, 3563.23, 8.37834, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 2040, 1, -5519.6, 3571.31, 22.6286, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 2040, 1, -5513.58, 3528.67, -7.01885, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 2040, 1, -5512.9, 3619.79, -2.88971, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 2040, 1, -5484, 3646.85, -0.048251, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+3, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+4, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+5, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+1, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+2, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+3, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+16, @PTEMPLATE+4, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10),
(@GGUID+17, @PTEMPLATE+5, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Shalzaru\'s Lair', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 330, 0, 'Feralas - Shalzaru\'s Lair - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 330, 0, 'Feralas - Shalzaru\'s Lair - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 330, 0, 'Feralas - Shalzaru\'s Lair - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 330, 0, 'Feralas - Shalzaru\'s Lair - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 330, 0, 'Feralas - Shalzaru\'s Lair - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 330, 0, 'Feralas - Shalzaru\'s Lair - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Feralas
SET @GGUID = 4115;
SET @PTEMPLATE = 2921;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, -4953.46, 1345.4, 61.4293, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 1, -4949.25, 173.447, 67.5708, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1734, 1, -4575.85, 1725.1, 104.179, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 1, -3557.9, 2875.15, 89.9723, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 2047, 1, -4953.46, 1345.4, 61.4293, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 2047, 1, -4949.25, 173.447, 67.5708, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 2047, 1, -4575.85, 1725.1, 104.179, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 2047, 1, -3557.9, 2875.15, 89.9723, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 2040, 1, -4953.46, 1345.4, 61.4293, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 2040, 1, -4949.25, 173.447, 67.5708, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 2040, 1, -4575.85, 1725.1, 104.179, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 2040, 1, -3557.9, 2875.15, 89.9723, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+3, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+1, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+2, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+3, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1197, 0, 'Feralas - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 1197, 0, 'Feralas - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1197, 0, 'Feralas - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 1197, 0, 'Feralas - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Felwood
SET @GGUID = 4877;
SET @PTEMPLATE = 3094;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 181109, 1, 3763.35, -1716.1, 269.617, -1.79769, 0, 0, 0.782608, -0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 181109, 1, 5608.74, -473.306, 381.546, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 181109, 1, 5721.71, -837.485, 394.952, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 181109, 1, 6420.11, -1376.15, 389.619, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 181108, 1, 3763.35, -1716.1, 269.617, -1.79769, 0, 0, 0.782608, -0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 181108, 1, 5608.74, -473.306, 381.546, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 181108, 1, 5721.71, -837.485, 394.952, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 181108, 1, 6420.11, -1376.15, 389.619, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 176645, 1, 3763.35, -1716.1, 269.617, -1.79769, 0, 0, 0.782608, -0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 176645, 1, 5608.74, -473.306, 381.546, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 176645, 1, 5721.71, -837.485, 394.952, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 176645, 1, 6420.11, -1376.15, 389.619, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+3, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+1, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+2, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+3, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 328, 0, 'Felwood - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 328, 0, 'Felwood - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 328, 0, 'Felwood - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 328, 0, 'Felwood - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Alterac Mountains
SET @GGUID = 3587;
SET @PTEMPLATE = 2780;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 0, 680.153, -149.288, 143.951, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 0, 851.408, -414.81, 143.713, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1734, 0, 904.442, -601.193, 157.972, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 2047, 0, 680.153, -149.288, 143.951, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 2047, 0, 851.408, -414.81, 143.713, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 2047, 0, 904.442, -601.193, 157.972, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 2040, 0, 680.153, -149.288, 143.951, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 2040, 0, 851.408, -414.81, 143.713, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 2040, 0, 904.442, -601.193, 157.972, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+1, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+2, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9901, 0, 'Alterac Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 9901, 0, 'Alterac Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 9901, 0, 'Alterac Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Garrison Armory
SET @GGUID = 3649;
SET @PTEMPLATE = 2851;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 150081, 0, -10801.8, -3554.11, -7.67958, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 150081, 0, -10773.2, -3383.68, -9.40466, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 150081, 0, -10718.5, -3096.47, 35.6884, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 150080, 0, -10801.8, -3554.11, -7.67958, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 150080, 0, -10773.2, -3383.68, -9.40466, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 150080, 0, -10718.5, -3096.47, 35.6884, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 150079, 0, -10801.8, -3554.11, -7.67958, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 150079, 0, -10773.2, -3383.68, -9.40466, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 150079, 0, -10718.5, -3096.47, 35.6884, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+2, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+1, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+2, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1280, 0, 'Blasted Lands - Garrison Armory - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 1280, 0, 'Blasted Lands - Garrison Armory - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1280, 0, 'Blasted Lands - Garrison Armory - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Uldaman 
SET @GGUID = 3537;
SET @PTEMPLATE = 2895;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 70, -60.9316, 199.971, -47.0473, 4.39823, 0, 0, -0.809016, 0.587786, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 70, 24.0401, 378.206, -40.9178, 1.39626, 0, 0, 0.642787, 0.766045, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2047, 70, -60.9316, 199.971, -47.0473, 4.39823, 0, 0, -0.809016, 0.587786, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 2047, 70, 24.0401, 378.206, -40.9178, 1.39626, 0, 0, 0.642787, 0.766045, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 2040, 70, -60.9316, 199.971, -47.0473, 4.39823, 0, 0, -0.809016, 0.587786, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 2040, 70, 24.0401, 378.206, -40.9178, 1.39626, 0, 0, 0.642787, 0.766045, 604800, 604800, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 2996, 0, 'Uldaman - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 2996, 0, 'Uldaman - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Maraudon 
SET @GGUID = 3547;
SET @PTEMPLATE = 2925;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 349, 533.888, 10.6027, -96.3128, 5.00909, 0, 0, -0.594823, 0.803857, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 349, 591.887, -392.592, -52.0194, 0, 0, 0, 0, 1, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2047, 349, 533.888, 10.6027, -96.3128, 5.00909, 0, 0, -0.594823, 0.803857, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 2047, 349, 591.887, -392.592, -52.0194, 0, 0, 0, 0, 1, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 2040, 349, 533.888, 10.6027, -96.3128, 5.00909, 0, 0, -0.594823, 0.803857, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 2040, 349, 591.887, -392.592, -52.0194, 0, 0, 0, 0, 1, 604800, 604800, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 3525, 0, 'Maraudon - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 3525, 0, 'Maraudon - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Rage Scar Hold
SET @GGUID = 3556;
SET @PTEMPLATE = 3005;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, -3920.04, 1655.92, 120.918, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 1, -3839.05, 1647.65, 145.326, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2047, 1, -3920.04, 1655.92, 120.918, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 2047, 1, -3839.05, 1647.65, 145.326, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 2040, 1, -3920.04, 1655.92, 120.918, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 2040, 1, -3839.05, 1647.65, 145.326, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Rage Scar Hold', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Rage Scar Hold', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Rage Scar Hold', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Rage Scar Hold', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Rage Scar Hold', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Rage Scar Hold', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Rage Scar Hold', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Rage Scar Hold', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 321, 0, 'Feralas - Rage Scar Hold - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 321, 0, 'Feralas - Rage Scar Hold - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Gaping Chasm
SET @GGUID = 3617;
SET @PTEMPLATE = 3088;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, -9449.04, -4059.81, -45.5162, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 1, -9437.38, -3994.06, -38.0223, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2047, 1, -9449.04, -4059.81, -45.5162, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 2047, 1, -9437.38, -3994.06, -38.0223, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 2040, 1, -9449.04, -4059.81, -45.5162, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 2040, 1, -9437.38, -3994.06, -38.0223, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris - Gaping Chasm', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris - Gaping Chasm', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris - Gaping Chasm', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris - Gaping Chasm', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris - Gaping Chasm', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris - Gaping Chasm', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris - Gaping Chasm', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris - Gaping Chasm', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8141, 0, 'Tanaris - Gaping Chasm - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 8141, 0, 'Tanaris - Gaping Chasm - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Blasted Lands
SET @GGUID = 2627;
SET @PTEMPLATE = 1347;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 0, -11635, -3190.86, 14.4105, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2047, 0, -11635, -3190.86, 14.4105, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2040, 0, -11635, -3190.86, 14.4105, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1279, 0, 'Blasted Lands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Firewatch Ridge
SET @GGUID = 2722;
SET @PTEMPLATE = 1350;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 0, -6725.47, -704.071, 235.588, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2047, 0, -6725.47, -704.071, 235.588, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2040, 0, -6725.47, -704.071, 235.588, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Searing Gorge - Firewatch Ridge', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Searing Gorge - Firewatch Ridge', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Searing Gorge - Firewatch Ridge', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Searing Gorge - Firewatch Ridge', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 331, 0, 'Searing Gorge - Firewatch Ridge - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Feral Scar Vale
SET @GGUID = 2772;
SET @PTEMPLATE = 1352;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, -5183.34, 1769.67, 94.8643, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2047, 1, -5183.34, 1769.67, 94.8643, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2040, 1, -5183.34, 1769.67, 94.8643, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Feral Scar Vale', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Feral Scar Vale', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Feral Scar Vale', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Feral Scar Vale', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 297, 0, 'Feralas - Feral Scar Vale - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Noxious Lair
SET @GGUID = 2805;
SET @PTEMPLATE = 1353;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, -7995.1, -2393.72, -24.7835, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2047, 1, -7995.1, -2393.72, -24.7835, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2040, 1, -7995.1, -2393.72, -24.7835, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris - Noxious Lair Hive 1', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris - Noxious Lair Hive 1', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris - Noxious Lair Hive 1', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris - Noxious Lair Hive 1', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8139, 0, 'Tanaris - Noxious Lair Hive 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Maraudon Entrance
SET @GGUID = 2816;
SET @PTEMPLATE = 1356;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, -1250.3, 2951.87, 63.9549, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2047, 1, -1250.3, 2951.87, 63.9549, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2040, 1, -1250.3, 2951.87, 63.9549, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace - Maraudon Entrance', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace - Maraudon Entrance', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace - Maraudon Entrance', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace - Maraudon Entrance', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8148, 0, 'Desolace - Maraudon Entrance - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Slaughter Hollow
SET @GGUID = 2824;
SET @PTEMPLATE = 1357;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 0, 883.7, -546.099, 143.087, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2047, 0, 883.7, -546.099, 143.087, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2040, 0, 883.7, -546.099, 143.087, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains - Slaughter Hollow', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains - Slaughter Hollow', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains - Slaughter Hollow', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains - Slaughter Hollow', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8106, 0, 'Alterac Mountains - Slaughter Hollow - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Shrine of the Deceiver
SET @GGUID = 2840;
SET @PTEMPLATE = 1385;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 181108, 1, 4788.81, -536.96, 286.511, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 181109, 1, 4788.81, -536.96, 286.511, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 176645, 1, 4788.81, -536.96, 286.511, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood - Shrine of the Deceiver', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood - Shrine of the Deceiver', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood - Shrine of the Deceiver', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood - Shrine of the Deceiver', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8116, 0, 'Felwood - Shrine of the Deceiver - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Shadow Hold
SET @GGUID = 2913;
SET @PTEMPLATE = 1407;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 181108, 1, 5104.57, -495.274, 296.677, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 181109, 1, 5104.57, -495.274, 296.677, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 176645, 1, 5104.57, -495.274, 296.677, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood - Shadow Hold', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood - Shadow Hold', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood - Shadow Hold', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood - Shadow Hold', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8115, 0, 'Felwood - Shadow Hold - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Irontree
SET @GGUID = 2925;
SET @PTEMPLATE = 1467;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 181108, 1, 6325.67, -1790.15, 421.579, 2.32129, 0, 0, 0.91706, 0.398749, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 181109, 1, 6325.67, -1790.15, 421.579, 2.32129, 0, 0, 0.91706, 0.398749, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 176645, 1, 6325.67, -1790.15, 421.579, 2.32129, 0, 0, 0.91706, 0.398749, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood - Irontree Cavern', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood - Irontree Cavern', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood - Irontree Cavern', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood - Irontree Cavern', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8117, 0, 'Felwood - Irontree Cavern - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

UPDATE `gameobject` SET `id`=2047 WHERE  `guid`=27843;
UPDATE `gameobject` SET `id`=2040 WHERE  `guid`=27853;
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands' WHERE  `entry`=21485 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands' WHERE  `guid`=27833;
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands' WHERE  `guid`=27843;
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands' WHERE  `guid`=27853;
UPDATE `pool_pool` SET `mother_pool`=1067, `description`='Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit' WHERE  `pool_id`=21485;

UPDATE `pool_template` SET `description`='Tin Vein / Silver Vein - Duskwood - Roland\'s Doom' WHERE  `entry`=2136 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein - Duskwood - Roland\'s Doom' WHERE  `guid`=3262;
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein - Duskwood - Roland\'s Doom' WHERE  `guid`=3269;
UPDATE `pool_pool` SET `mother_pool`=267, `description`='Duskwood - Roland\'s Doom - Tin Vein / Silver Vein' WHERE  `pool_id`=2136;

UPDATE `pool_template` SET `description`='Tin Vein / Silver Vein - Silverpine Forest - Deep Elem Mine' WHERE  `entry`=2858 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein - Silverpine Forest - Deep Elem Mine' WHERE  `guid`=427016;
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein - Silverpine Forest - Deep Elem Mine' WHERE  `guid`=42061;
UPDATE `pool_pool` SET `mother_pool`=8098, `description`='Silverpine Forest - Deep Elem Mine - Tin Vein / Silver Vein' WHERE  `pool_id`=2858;

DELETE FROM `gameobject` WHERE `guid` IN (34708, 34640);
DELETE FROM `pool_gameobject` WHERE `guid` IN (34708, 34640);
DELETE FROM `pool_template` WHERE `entry` = 1899;
DELETE FROM `pool_pool` WHERE `pool_id` = 1899;

UPDATE `pool_pool` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon' WHERE  `pool_id`=405;

UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `id` IN (2040, 150079, 176645, 123310) AND `map` IN (0, 1);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
