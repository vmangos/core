DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230903173317');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230903173317');
-- Add your query below.


-- Touch of Weakness R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (2652, 10, 0, 0);
-- Touch of Weakness R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19261, 20, 0, 0);
-- Touch of Weakness R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19262, 30, 0, 0);
-- Touch of Weakness R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19264, 40, 0, 0);
-- Touch of Weakness R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19265, 50, 0, 0);
-- Touch of Weakness R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19266, 60, 0, 0);

-- Nature's Grasp R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (16689, 10, 0, 0);
-- Nature's Grasp R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (16810, 18, 0, 0);
-- Nature's Grasp R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (16811, 28, 0, 0);
-- Nature's Grasp R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (16812, 38, 0, 0);
-- Nature's Grasp R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (16813, 48, 0, 0);
-- Nature's Grasp R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (17329, 58, 0, 0);

-- Nature's Grasp Entangling Roots proc R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19975, 16, 1, 0);
-- Nature's Grasp Entangling Roots proc R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19974, 36, 1, 0);
-- Nature's Grasp Entangling Roots proc R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19973, 56, 1, 0);
-- Nature's Grasp Entangling Roots proc R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19972, 76, 1, 0);
-- Nature's Grasp Entangling Roots proc R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19971, 96, 1, 0);
-- Nature's Grasp Entangling Roots proc R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19970, 116, 1, 0);

-- Fear Ward 
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (6346, 20, 0, 0);

-- Touch of Weakness proc R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (2943, 20, 1, 0);
-- Touch of Weakness proc R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19249, 40, 1, 0);
-- Touch of Weakness proc R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19251, 60, 1, 0);
-- Touch of Weakness proc R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19252, 80, 1, 0);
-- Touch of Weakness proc R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19253, 100, 1, 0);
-- Touch of Weakness proc R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19254, 120, 1, 0);

-- Remove Blessing of Wisdom
-- It had 0 threat value and should not exist in spell_threat
DELETE FROM `spell_threat` WHERE  `entry`=19742;

-- Feral Charge
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (16979, 52, 0, 0);

-- Bash R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (5211, 42, 0, 0);
-- Bash R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (6798, 90, 0, 0);
-- Bash R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8983, 138, 0, 0);

-- Remove Curse
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (2782, 24, 0, 0);

-- Deterrence
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19263, 20, 0, 0);

-- Trueshot Aura R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19506, 40, 0, 0);
-- Trueshot Aura R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20905, 50, 0, 0);
-- Trueshot Aura R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20906, 60, 0, 0);

-- Power Infusion
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10060, 40, 0, 0);

-- Faerie Fire (Feral) R1
UPDATE `spell_threat` SET `Threat` = 50 WHERE `entry` = 16857;
-- Faerie Fire (Feral) R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (17390, 60, 0, 0);
-- Faerie Fire (Feral) R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (17391, 84, 0, 0);
-- Faerie Fire (Feral) R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (17392, 108, 0, 0);

-- Elune's Grace R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (2651, 20, 0, 0);
-- Elune's Grace R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19289, 30, 0, 0);
-- Elune's Grace R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19291, 40, 0, 0);
-- Elune's Grace R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19292, 50, 0, 0);
-- Elune's Grace R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19293, 60, 0, 0);

-- Feedback R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (13896, 20, 0, 0);
-- Feedback R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19271, 30, 0, 0);
-- Feedback R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19273, 40, 0, 0);
-- Feedback R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19274, 50, 0, 0);
-- Feedback R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19275, 60, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
