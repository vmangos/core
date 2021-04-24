DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200424152628');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200424152628');
-- Add your query below.


-- Add missing quest greetings from classic sniffs.
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (1952, 0, 'Hello, $C.  If you\'re here, then you must know that Silverpine is saturated with our enemies.  To survive, the Forsaken must drive them back!', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (10321, 0, '<Emberstrife acknowledges your presence.>', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (11596, 0, 'My business plan never accounted for housing giant kodos... maybe I should have gone into the underwater basket weaving business instead.', 1, 0);

-- Add missing quest greetings from cmangos db.
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (7777, 0, 'The Gordunni Ogres encroach upon our lands.  We send as many as are willing to face them in the desecrated ruins of Feralas.', 1, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (16361, 0, 'The Lich King has brought war against us from the frozen north, and only we of the Argent Dawn stand in his way.', 1, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (16478, 0, 'Good day to you, citizen. Have you come to aid us against the Scourge?', 1, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (16786, 0, 'Greetings, $n. If you bring me necrotic stones from the undead invaders, I can give you access to the stores of the Argent Dawn.', 66, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (16788, 0, 'Greetings, $c. I am the Flamekeeper. During the Midsummer Fire Festival, it is my duty to keep this fire beside me burning brightly. It is an honor to be selected for such a task; I fill it gladly.$b$b How can I help you?', 1, 0);

-- Change naming style emote fields.
ALTER TABLE `quest_greeting`
	CHANGE COLUMN `Emote` `emote_id` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `content_loc8`,
	CHANGE COLUMN `EmoteDelay` `emote_delay` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `emote_id`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
