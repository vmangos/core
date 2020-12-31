DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200422192535');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200422192535');
-- Add your query below.

REPLACE INTO `page_text` (`entry`, `text`) VALUES (692, 'You led a quiet life of love and good deeds.   You gave to the poor, cured the sick, and comforted the dying.   You waited with joyful certain, secure in the belief that you would be granted an afterlife of everlasting peace.$B$BYou were betrayed.$B$BI cannot offer you comfort.   Revenge, on the other hand, is well within my power.   Come to the old church in Deathknell, and I will teach you how to inflict deadly damage through the very faith you were taught.$B$B   -Dark Cleric Duesten, Priest Trainer.');
REPLACE INTO `page_text` (`entry`, `text`) VALUES (693, 'Revel in your new state of undeath, and wield your powers to cleanse the world of those who would see us eradicated.   Although our enemies are legion, we will destroy them with flame and shadow.$B$BWhen you are ready for me to teach you the ways of darkness and summoning you will find me in the old Deathknell church.$B$B   -Maximillion, Warlock Trainer.');
REPLACE INTO `page_text` (`entry`, `text`) VALUES (694, 'Get your bones up and out of that crypt; there''s work to be done!   The Scarlet Crusade moves swiftly against our people, and other humans kill us whenever they can.   We have need of your sword.$B$BWhen you want to learn more of weapons, come find me in the ruined tavern in Deathknell.   I will teach you.$B$B   -Dannal Stern, Warrior Trainer.');
REPLACE INTO `page_text` (`entry`, `text`) VALUES (695, 'Don''t get all weepy about being undead and losing your family and all that rot.   You live, and that''s what matters.   Even though you are now undead, possession is still nine tenths of the law.   Sneak past your enemies, or kill them and take what they had.$B$BI can teach you what you need to know about deadly strikes and stealth.   Come look for me in the ruined tavern in Deathknell.$B$B   -David Trias, Rogue Trainer.');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
