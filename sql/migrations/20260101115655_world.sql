DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260101115655');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260101115655');
-- Add your query below.


-- Add missing area requirements to spells.
INSERT INTO `spell_area` (`spell`, `area`) VALUES(12851, 16); -- Release the Hounds requires Azshara
INSERT INTO `spell_area` (`spell`, `area`) VALUES(15958, 1583); -- Collect Rookery Egg requires Blackrock Spire
INSERT INTO `spell_area` (`spell`, `area`) VALUES(16712, 367); -- Special Brew requires Sen'jin Village
INSERT INTO `spell_area` (`spell`, `area`) VALUES(17623, 2298); -- Visions of the Past requires Caer Darrow
INSERT INTO `spell_area` (`spell`, `area`) VALUES(20475, 2717); -- Living Bomb requires Molten Core
INSERT INTO `spell_area` (`spell`, `area`) VALUES(21134, 1584); -- Will of Ragnaros requires Blackrock Depths
INSERT INTO `spell_area` (`spell`, `area`) VALUES(21403, 2597); -- Ryson's All Seeing Eye requires Alterac Valley
INSERT INTO `spell_area` (`spell`, `area`) VALUES(21546, 2597); -- Ryson's All Seeing Eye requires Alterac Valley
INSERT INTO `spell_area` (`spell`, `area`) VALUES(21736, 2964); -- Winterax Wisdom requires Winterax Hold
INSERT INTO `spell_area` (`spell`, `area`) VALUES(21989, 2597); -- Waiting to Resurrect requires Alterac Valley
INSERT INTO `spell_area` (`spell`, `area`) VALUES(22563, 2597); -- Recall requires Alterac Valley
INSERT INTO `spell_area` (`spell`, `area`) VALUES(22564, 2597); -- Recall requires Alterac Valley
INSERT INTO `spell_area` (`spell`, `area`) VALUES(22799, 2557); -- King of the Gordok requires Dire Maul
INSERT INTO `spell_area` (`spell`, `area`) VALUES(23478, 2677); -- Burning Adrenaline requires Blackwing Lair
INSERT INTO `spell_area` (`spell`, `area`) VALUES(23513, 2677); -- Essence of the Red requires Blackwing Lair
INSERT INTO `spell_area` (`spell`, `area`) VALUES(23538, 2597); -- Battle Standard requires Alterac Valley
INSERT INTO `spell_area` (`spell`, `area`) VALUES(23620, 2677); -- Burning Adrenaline requires Blackwing Lair
INSERT INTO `spell_area` (`spell`, `area`) VALUES(23865, 1977); -- Parasitic Serpent requires Zul'Gurub
INSERT INTO `spell_area` (`spell`, `area`) VALUES(23866, 1977); -- Summon Parasitic Serpent requires Zul'Gurub
INSERT INTO `spell_area` (`spell`, `area`) VALUES(23964, 2597); -- Bloodrager's Requiem requires Alterac Valley
INSERT INTO `spell_area` (`spell`, `area`) VALUES(24325, 3419); -- Pagle's Point Cast - Create Mudskunk Lure requires Pagle's Pointe
INSERT INTO `spell_area` (`spell`, `area`) VALUES(24328, 1977); -- Corrupted Blood requires Zul'Gurub
INSERT INTO `spell_area` (`spell`, `area`) VALUES(25678, 440); -- Siren's Song requires Tanaris
INSERT INTO `spell_area` (`spell`, `area`) VALUES(25688, 618); -- Narain! requires Winterspring
INSERT INTO `spell_area` (`spell`, `area`) VALUES(25863, 3428); -- Summon Black Qiraji Battle Tank requires Ahn'Qiraj
INSERT INTO `spell_area` (`spell`, `area`) VALUES(25953, 3428); -- Summon Blue Qiraji Battle Tank requires Ahn'Qiraj
INSERT INTO `spell_area` (`spell`, `area`) VALUES(26054, 3428); -- Summon Red Qiraji Battle Tank requires Ahn'Qiraj
INSERT INTO `spell_area` (`spell`, `area`) VALUES(26055, 3428); -- Summon Yellow Qiraji Battle Tank requires Ahn'Qiraj
INSERT INTO `spell_area` (`spell`, `area`) VALUES(26056, 3428); -- Summon Green Qiraji Battle Tank requires Ahn'Qiraj
INSERT INTO `spell_area` (`spell`, `area`) VALUES(28169, 3456); -- Mutating Injection requires Naxxramas
INSERT INTO `spell_area` (`spell`, `area`) VALUES(28206, 3456); -- Mutagen Explosion requires Naxxramas
INSERT INTO `spell_area` (`spell`, `area`) VALUES(28240, 3456); -- Poison Cloud requires Naxxramas
INSERT INTO `spell_area` (`spell`, `area`) VALUES(28442, 796); -- AB Effect 001 requires Scarlet Monastery
INSERT INTO `spell_area` (`spell`, `area`) VALUES(29533, 1377); -- Sillithus Flag Drop (DND) requires Silithus


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
