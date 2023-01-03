DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221117065844');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221117065844');
-- Add your query below.


-- Store allowed client versions in the database.
CREATE TABLE IF NOT EXISTS `allowed_clients` (
  `major_version` tinyint(3) unsigned NOT NULL,
  `minor_version` tinyint(3) unsigned NOT NULL,
  `bugfix_version` tinyint(3) unsigned NOT NULL,
  `hotfix_version` char(1) COLLATE latin1_bin NOT NULL,
  `build` mediumint(8) unsigned NOT NULL,
  `os` char(50) COLLATE latin1_bin NOT NULL,
  `platform` char(50) COLLATE latin1_bin NOT NULL,
  `integrity_hash` varchar(40) COLLATE latin1_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

INSERT INTO `allowed_clients` (`major_version`, `minor_version`, `bugfix_version`, `hotfix_version`, `build`, `os`, `platform`, `integrity_hash`) VALUES
(3, 3, 5, 'a', 13930, 'Win', 'x86', ''),
(3, 3, 5, 'a', 13930, 'OSX', 'x86', ''),
(3, 3, 5, 'a', 13930, 'OSX', 'PPC', ''),
(3, 3, 5, 'a', 12340, 'Win', 'x86', 'CDCBBD5188315E6B4D19449D492DBCFAF156A347'),
(3, 3, 5, 'a', 12340, 'OSX', 'x86', 'B706D13FF2F4018839729461E3F8A0E2B5FDC034'),
(3, 3, 5, 'a', 12340, 'OSX', 'PPC', 'B706D13FF2F4018839729461E3F8A0E2B5FDC034'),
(3, 3, 3, 'a', 11723, 'Win', 'x86', ''),
(3, 3, 3, 'a', 11723, 'OSX', 'x86', ''),
(3, 3, 3, 'a', 11723, 'OSX', 'PPC', ''),
(3, 3, 2, '', 11403, 'Win', 'x86', ''),
(3, 3, 2, '', 11403, 'OSX', 'x86', ''),
(3, 3, 2, '', 11403, 'OSX', 'PPC', ''),
(3, 3, 0, 'a', 11159, 'Win', 'x86', ''),
(3, 3, 0, 'a', 11159, 'OSX', 'x86', ''),
(3, 3, 0, 'a', 11159, 'OSX', 'PPC', ''),
(3, 2, 2, 'a', 10505, 'Win', 'x86', ''),
(3, 2, 2, 'a', 10505, 'OSX', 'x86', ''),
(3, 2, 2, 'a', 10505, 'OSX', 'PPC', ''),
(2, 4, 3, '', 8606, 'Win', 'x86', '319AFAA3F2559682F9FF658BE01456255F456FB1'),
(2, 4, 3, '', 8606, 'OSX', 'x86', 'D8B0ECFE534BC1131E19BAD1D4C0E813EEE4994F'),
(2, 4, 3, '', 8606, 'OSX', 'PPC', 'D8B0ECFE534BC1131E19BAD1D4C0E813EEE4994F'),
(1, 12, 3, '', 6141, 'Win', 'x86', '2E5236E566AEA9BFFA0CC041679C2DB52E21C9DC'),
(1, 12, 3, '', 6141, 'OSX', 'x86', ''),
(1, 12, 3, '', 6141, 'OSX', 'PPC', ''),
(1, 12, 2, '', 6005, 'Win', 'x86', '0697323876569641487928FDC7C9E33B4470C880'),
(1, 12, 2, '', 6005, 'OSX', 'x86', ''),
(1, 12, 2, '', 6005, 'OSX', 'PPC', ''),
(1, 12, 1, '', 5875, 'Win', 'x86', '95EDB27C7823B363CBDDAB56A392E7CB73FCCA20'),
(1, 12, 1, '', 5875, 'OSX', 'x86', '8D173CC381961EEBABF336F5E6675B101BB513E5'),
(1, 12, 1, '', 5875, 'OSX', 'PPC', '8D173CC381961EEBABF336F5E6675B101BB513E5'),
(1, 11, 2, '', 5464, 'Win', 'x86', '4DF8A505E4FE8D8333508C0E858465E357178683'),
(1, 11, 2, '', 5464, 'OSX', 'x86', ''),
(1, 11, 2, '', 5464, 'OSX', 'PPC', ''),
(1, 10, 2, '', 5302, 'Win', 'x86', '70DD183CE671E79909E02554E94CBE3F2C338C55'),
(1, 10, 2, '', 5302, 'OSX', 'x86', ''),
(1, 10, 2, '', 5302, 'OSX', 'PPC', ''),
(1, 9, 4, '', 5086, 'Win', 'x86', 'C561B52B3BDDDD176A46433C6D067BA745E6B000'),
(1, 9, 4, '', 5086, 'OSX', 'x86', ''),
(1, 9, 4, '', 5086, 'OSX', 'PPC', ''),
(1, 8, 4, '', 4878, 'Win', 'x86', '03DFB3C3F72479F9BCC5EDD8DCA1025E8D11AF0F'),
(1, 8, 4, '', 4878, 'OSX', 'x86', ''),
(1, 8, 4, '', 4878, 'OSX', 'PPC', ''),
(1, 7, 1, '', 4695, 'Win', 'x86', '37C01291271CBB891D8FEEC15B2F147AA3E40C80'),
(1, 7, 1, '', 4695, 'OSX', 'x86', ''),
(1, 7, 1, '', 4695, 'OSX', 'PPC', ''),
(1, 6, 3, '', 4620, 'Win', 'x86', '3C77ED95D600F9D4270DA1A291C7F645CA4F2AAC'),
(1, 6, 3, '', 4620, 'OSX', 'x86', ''),
(1, 6, 3, '', 4620, 'OSX', 'PPC', ''),
(1, 6, 2, '', 4565, 'Win', 'x86', '1AC02CE93E7B82D17E8718758D67F59FB0CA4B5D'),
(1, 6, 2, '', 4565, 'OSX', 'x86', ''),
(1, 6, 2, '', 4565, 'OSX', 'PPC', ''),
(1, 6, 1, '', 4544, 'Win', 'x86', 'D7AC290CC2E42F9CC83A9023803A43244359F030'),
(1, 6, 1, '', 4544, 'OSX', 'x86', ''),
(1, 6, 1, '', 4544, 'OSX', 'PPC', '');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
