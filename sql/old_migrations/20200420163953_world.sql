DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200420163953');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200420163953');
-- Add your query below.


-- add quest Chillwind Point (5149) to Brandur Ironhammer (5149)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(5149, 8415, 6, 10);

-- update completion text for The Tome of Nobility (1661)
UPDATE `quest_template` SET `OfferRewardText` = "Congratulations, and may the Light protect you." WHERE `entry` = 1661;

-- update The Tome of Valor (1794) to Tiza Battleforge (6179)
UPDATE `creature_questrelation` SET `id` = 6179 WHERE `quest` = 1794;

-- update involved relation to Tiza Battleforge (6179) for The Tome of Valor (1794)
UPDATE `creature_involvedrelation` SET `id` = 6179 WHERE `quest` = 1794;

-- add completion text for Tome of Valor (1794)
UPDATE `quest_template` SET `OfferRewardText` = "It has been proven that the Light is with you, $n, but as times grow more dangerous, it becomes important to know what strength lies beneath the flesh. When demons, dragons, or any other evil set foot in your lands, your mettle will be tested. Will you be strong enough?$b$bBravery, regardless of the situation, is as much a part of paladinhood as the Light, your armor, and your weapon. Protecting the weak, and not losing faith are two more lessons you must master while you study in the Cathedral of Light." WHERE `entry` = 1794;

-- add completion text for The Tome of Nobility (4485)
UPDATE `quest_template` SET `OfferRewardText` = "Ah, you've returned to the Cathedral, $n. Good. A lot has happened recently, and I would seek your aid if you prove worthy.$b$bMany treacherous enemies are about. I will need your help to stop them." WHERE `entry` IN (4485, 4486);

-- add completion text for The Test of Righteousness (1653)
UPDATE `quest_template` SET `OfferRewardText` = "Good day, $n. The Light is with you, I trust?$b$bWhat's that? You were sent by Duthorian!? My wife, how is she? I knew there was going to be trouble if I left. Please tell me she's... oh, thank goodness. I'm so glad that she's safe. The Defias were a threat long before these attacks, but now the King's advisors cannot deny it.$b$bWhat else did Duthorian have to say?$b$bYou're the one that was sent to protect my wife? Then I thank you again, $n. I couldn't think of a better test of valor than that." WHERE `entry` = 1653;

-- add The Tome of Nobility (1661) to exclusive group (4485)
UPDATE `quest_template` SET `ExclusiveGroup` = 4485 WHERE `entry` = 1661;

-- add progress text for The Tome of Valor (1651)
UPDATE `quest_template` SET `RequestItemsText` = "We'll make our stand at the house!" WHERE `entry` = 1651;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
