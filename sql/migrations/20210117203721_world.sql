DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210117203721');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210117203721');
-- Add your query below.
REPLACE INTO `quest_template` VALUES (2865, 0, 2, 978, 40, 0, 45, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 2864, 0, 0, 0, 0, 0, 0, 'Scarab Shells', 'The scarabs of Tanaris have very hard shells!  Hard enough to use as a building material for lots of things.  So many things!$B$BIn fact, those shells are so useful... the scarabs were hunted all to near extinction!$B$BI know where there are more scarabs, and if you promise to bring me their shells then I\'ll tell you where they are.  Promise?$B$BOk, the scarabs have a colony in Zul\'Farrak.  I guess the trolls don\'t hunt them for their shells.$B$BBut you can!  Go to Zul\'Farrak and get me uncracked shells!', 'Bring 9 Uncracked Scarab Shells to Tran\'rek in Gadgetzan.', 'Oh, great!  You got them!$B$BThanks, $N.  You\'re a real lifesaver!', 'Do you have the shells?  My cousin in Booty Bay is waiting for a load of them, and he\'s getting impatient!', '', '', '', '', '', 9238, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 0, 0, 0, 0, 100, 0, 0, 0, 0, 3900, 6500, 2340, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `quest_template` VALUES (2865, 1, 2, 978, 40, 0, 45, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 2864, 0, 0, 0, 0, 0, 0, 'Scarab Shells', 'The scarabs of Tanaris have very hard shells!  Hard enough to use as a building material for lots of things.  So many things!$B$BIn fact, those shells are so useful... the scarabs were hunted all to near extinction!$B$BI know where there are more scarabs, and if you promise to bring me their shells then I\'ll tell you where they are.  Promise?$B$BOk, the scarabs have a colony in Zul\'Farrak.  I guess the trolls don\'t hunt them for their shells.$B$BBut you can!  Go to Zul\'Farrak and get me uncracked shells!', 'Bring 5 Uncracked Scarab Shells to Tran\'rek in Gadgetzan.', 'Oh, great!  You got them!$B$BThanks, $N.  You\'re a real lifesaver!', 'Do you have the shells?  My cousin in Booty Bay is waiting for a load of them, and he\'s getting impatient!', '', '', '', '', '', 9238, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 0, 0, 0, 0, 100, 0, 0, 0, 0, 3900, 6500, 2340, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
