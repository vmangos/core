DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260320221111');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260320221111');
-- Add your query below.
-- Add Frost Mage Winter's Chill Spec ID
INSERT INTO `player_premade_spell_template` (`entry`, `class`, `level`, `role`, `name`) VALUES (59, 8, 60, 2, 'frost-winterschill-pve');

-- Add the actual build
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 130);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 475);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 759);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 1953);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 2139);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 2855);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 3552);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 3561);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 3562);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 3565);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 7301);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10053);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10054);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10059);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10139);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10157);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10161);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10170);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10174);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10187);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10193);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10199);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10202);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10207);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10216);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10220);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10225);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 10230);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 11175);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 11416);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 11419);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 11426);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 11958);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 12051);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 12469);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 12472);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 12488);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 12519);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 12577);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 12592);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 12826);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 12840);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 12953);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 15053);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 16758);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 16766);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 18464);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 22783);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 23028);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 25304);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 25306);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 25345);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 28272);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 28574);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 28595);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 28609);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 28612);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 29440);
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES (59, 29441);



-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
