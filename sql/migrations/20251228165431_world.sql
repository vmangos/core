DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251228165431');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251228165431');
-- Add your query below.


-- Pool Rich Thorium in Azshara
SET @PTEMPLATE = 3602;

-- Bitter Reaches
DELETE FROM `pool_pool` WHERE `pool_id` IN (1235, 3241, 3242, 3243, 9804);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Bitter Reaches' WHERE `entry` IN (1235, 3241, 3242, 3243, 9804);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Bitter Reaches' WHERE `pool_entry` IN (1235, 3241, 3242, 3243, 9804);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Azshara - Bitter Reaches - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1235, @PTEMPLATE+1, 0, 'Azshara - Bitter Reaches - Truesilver Deposit / Rich Thorium Vein', 0),
(3241, @PTEMPLATE+1, 0, 'Azshara - Bitter Reaches - Truesilver Deposit / Rich Thorium Vein', 0),
(3242, @PTEMPLATE+1, 0, 'Azshara - Bitter Reaches - Truesilver Deposit / Rich Thorium Vein', 0),
(3243, @PTEMPLATE+1, 0, 'Azshara - Bitter Reaches - Truesilver Deposit / Rich Thorium Vein', 0),
(9804, @PTEMPLATE+1, 0, 'Azshara - Bitter Reaches - Truesilver Deposit / Rich Thorium Vein', 0);

-- Legash Encampment
DELETE FROM `pool_pool` WHERE `pool_id` IN (3238, 9808, 9809, 9810, 9823);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Legash Encampment' WHERE `entry` IN (3238, 9808, 9809, 9810, 9823);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Legash Encampment' WHERE `pool_entry` IN (3238, 9808, 9809, 9810, 9823);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Azshara - Legash Encampment - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3238, @PTEMPLATE+2, 0, 'Azshara - Legash Encampment - Truesilver Deposit / Rich Thorium Vein', 0),
(9808, @PTEMPLATE+2, 0, 'Azshara - Legash Encampment - Truesilver Deposit / Rich Thorium Vein', 0),
(9809, @PTEMPLATE+2, 0, 'Azshara - Legash Encampment - Truesilver Deposit / Rich Thorium Vein', 0),
(9810, @PTEMPLATE+2, 0, 'Azshara - Legash Encampment - Truesilver Deposit / Rich Thorium Vein', 0),
(9823, @PTEMPLATE+2, 0, 'Azshara - Legash Encampment - Truesilver Deposit / Rich Thorium Vein', 0);

-- Ursolan
DELETE FROM `pool_pool` WHERE `pool_id` IN (3239, 9813, 9816, 9824, 9806);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Ursolan' WHERE `entry` IN (3239, 9813, 9816, 9824, 9806);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Ursolan' WHERE `pool_entry` IN (3239, 9813, 9816, 9824, 9806);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Azshara - Ursolan - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3239, @PTEMPLATE+3, 0, 'Azshara - Ursolan - Truesilver Deposit / Rich Thorium Vein', 0),
(9813, @PTEMPLATE+3, 0, 'Azshara - Ursolan - Truesilver Deposit / Rich Thorium Vein', 0),
(9816, @PTEMPLATE+3, 0, 'Azshara - Ursolan - Truesilver Deposit / Rich Thorium Vein', 0),
(9824, @PTEMPLATE+3, 0, 'Azshara - Ursolan - Truesilver Deposit / Rich Thorium Vein', 0),
(9806, @PTEMPLATE+3, 0, 'Azshara - Ursolan - Truesilver Deposit / Rich Thorium Vein', 0);

-- Shattered Strand
DELETE FROM `pool_pool` WHERE `pool_id` IN (3240, 3244, 9807, 3984, 9820);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Shattered Strand' WHERE `entry` IN (3240, 3244, 9807, 3984, 9820);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Shattered Strand' WHERE `pool_entry` IN (3240, 3244, 9807, 3984, 9820);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Azshara - Shattered Strand - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3240, @PTEMPLATE+4, 0, 'Azshara - Shattered Strand - Truesilver Deposit / Rich Thorium Vein', 0),
(3244, @PTEMPLATE+4, 0, 'Azshara - Shattered Strand - Truesilver Deposit / Rich Thorium Vein', 0),
(9807, @PTEMPLATE+4, 0, 'Azshara - Shattered Strand - Truesilver Deposit / Rich Thorium Vein', 0),
(3984, @PTEMPLATE+4, 0, 'Azshara - Shattered Strand - Truesilver Deposit / Rich Thorium Vein', 0),
(9820, @PTEMPLATE+4, 0, 'Azshara - Shattered Strand - Truesilver Deposit / Rich Thorium Vein', 0);

-- Bay of Storms
DELETE FROM `pool_pool` WHERE `pool_id` IN (3245, 3246, 3247, 9812, 3988);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Bay of Storms' WHERE `entry` IN (3245, 3246, 3247, 9812, 3988);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Bay of Storms' WHERE `pool_entry` IN (3245, 3246, 3247, 9812, 3988);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Azshara - Bay of Storms - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3245, @PTEMPLATE+5, 0, 'Azshara - Bay of Storms - Truesilver Deposit / Rich Thorium Vein', 0),
(3246, @PTEMPLATE+5, 0, 'Azshara - Bay of Storms - Truesilver Deposit / Rich Thorium Vein', 0),
(3247, @PTEMPLATE+5, 0, 'Azshara - Bay of Storms - Truesilver Deposit / Rich Thorium Vein', 0),
(9812, @PTEMPLATE+5, 0, 'Azshara - Bay of Storms - Truesilver Deposit / Rich Thorium Vein', 0),
(3988, @PTEMPLATE+5, 0, 'Azshara - Bay of Storms - Truesilver Deposit / Rich Thorium Vein', 0);

-- Southridge Beach
DELETE FROM `pool_pool` WHERE `pool_id` IN (3248, 3249, 9814, 9821, 3982);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Southridge Beach' WHERE `entry` IN (3248, 3249, 9814, 9821, 3982);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Southridge Beach' WHERE `pool_entry` IN (3248, 3249, 9814, 9821, 3982);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Azshara - Southridge Beach - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3248, @PTEMPLATE+6, 0, 'Azshara - Southridge Beach - Truesilver Deposit / Rich Thorium Vein', 0),
(3249, @PTEMPLATE+6, 0, 'Azshara - Southridge Beach - Truesilver Deposit / Rich Thorium Vein', 0),
(9814, @PTEMPLATE+6, 0, 'Azshara - Southridge Beach - Truesilver Deposit / Rich Thorium Vein', 0),
(9821, @PTEMPLATE+6, 0, 'Azshara - Southridge Beach - Truesilver Deposit / Rich Thorium Vein', 0),
(3982, @PTEMPLATE+6, 0, 'Azshara - Southridge Beach - Truesilver Deposit / Rich Thorium Vein', 0);

-- Ravencrest Monument
DELETE FROM `pool_pool` WHERE `pool_id` IN (3250, 9822, 9805, 3981);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Ravencrest Monument' WHERE `entry` IN (3250, 9822, 9805, 3981);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Ravencrest Monument' WHERE `pool_entry` IN (3250, 9822, 9805, 3981);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Azshara - Ravencrest Monument - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3250, @PTEMPLATE+7, 0, 'Azshara - Ravencrest Monument - Truesilver Deposit / Rich Thorium Vein', 0),
(9822, @PTEMPLATE+7, 0, 'Azshara - Ravencrest Monument - Truesilver Deposit / Rich Thorium Vein', 0),
(9805, @PTEMPLATE+7, 0, 'Azshara - Ravencrest Monument - Truesilver Deposit / Rich Thorium Vein', 0),
(3981, @PTEMPLATE+7, 0, 'Azshara - Ravencrest Monument - Truesilver Deposit / Rich Thorium Vein', 0);

-- Ruined Reaches
DELETE FROM `pool_pool` WHERE `pool_id` IN (3251, 3252, 3253, 9815, 3983);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Ruined Reaches' WHERE `entry` IN (3251, 3252, 3253, 9815, 3983);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Ruined Reaches' WHERE `pool_entry` IN (3251, 3252, 3253, 9815, 3983);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 1, 'Azshara - Ruined Reaches - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3251, @PTEMPLATE+8, 0, 'Azshara - Ruined Reaches - Truesilver Deposit / Rich Thorium Vein', 0),
(3252, @PTEMPLATE+8, 0, 'Azshara - Ruined Reaches - Truesilver Deposit / Rich Thorium Vein', 0),
(3253, @PTEMPLATE+8, 0, 'Azshara - Ruined Reaches - Truesilver Deposit / Rich Thorium Vein', 0),
(9815, @PTEMPLATE+8, 0, 'Azshara - Ruined Reaches - Truesilver Deposit / Rich Thorium Vein', 0),
(3983, @PTEMPLATE+8, 0, 'Azshara - Ruined Reaches - Truesilver Deposit / Rich Thorium Vein', 0);

-- Ruins of Eldarath
DELETE FROM `pool_pool` WHERE `pool_id` IN (9811, 9817, 9818, 9819, 9803);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Ruins of Eldarath' WHERE `entry` IN (9811, 9817, 9818, 9819, 9803);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Azshara - Ruins of Eldarath' WHERE `pool_entry` IN (9811, 9817, 9818, 9819, 9803);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 1, 'Azshara - Ruins of Eldarath - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(9811, @PTEMPLATE+9, 0, 'Azshara - Ruins of Eldarath - Truesilver Deposit / Rich Thorium Vein', 0),
(9817, @PTEMPLATE+9, 0, 'Azshara - Ruins of Eldarath - Truesilver Deposit / Rich Thorium Vein', 0),
(9818, @PTEMPLATE+9, 0, 'Azshara - Ruins of Eldarath - Truesilver Deposit / Rich Thorium Vein', 0),
(9819, @PTEMPLATE+9, 0, 'Azshara - Ruins of Eldarath - Truesilver Deposit / Rich Thorium Vein', 0),
(9803, @PTEMPLATE+9, 0, 'Azshara - Ruins of Eldarath - Truesilver Deposit / Rich Thorium Vein', 0);

DELETE FROM `pool_template` WHERE `entry` = 2337;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
