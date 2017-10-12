DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171010012002');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171010012002');

-- ZG Enchant Quest Deliver method, not auto complete
UPDATE `quest_template` SET `Method` = 2 WHERE `entry` IN (8184, 8185, 8186, 8187, 8188, 8189, 8190, 8191, 8192);

-- ZG Enchant Quest class requirements
UPDATE `quest_template` SET `RequiredClasses` = 1 WHERE `entry` = 8184; -- Warrior
UPDATE `quest_template` SET `RequiredClasses` = 1 << 1 WHERE `entry` = 8185; -- Paladin
UPDATE `quest_template` SET `RequiredClasses` = 1 << 3 WHERE `entry` = 8186; -- Rogue
UPDATE `quest_template` SET `RequiredClasses` = 1 << 2 WHERE `entry` = 8187; -- Hunter
UPDATE `quest_template` SET `RequiredClasses` = 1 << 6 WHERE `entry` = 8188; -- Shaman
UPDATE `quest_template` SET `RequiredClasses` = 1 << 7 WHERE `entry` = 8189; -- Mage
UPDATE `quest_template` SET `RequiredClasses` = 1 << 8 WHERE `entry` = 8190; -- Warlock
UPDATE `quest_template` SET `RequiredClasses` = 1 << 4 WHERE `entry` = 8191; -- Priest
UPDATE `quest_template` SET `RequiredClasses` = 1 << 10 WHERE `entry` = 8192; -- Druid

-- Double line breaks between ZG quest desc paragraphs
UPDATE `quest_template` 
    SET `Details` = 'Zanza can create the ancient troll enchantments with the right components. $B$BThe first is a primal token that must be taken from the most powerful of the Hakkari.$B$BThe second is a punctured voodoo doll. These can be found in the piles of refuse that litter this foul place. Look inside the jinxed hoodoo piles.$B$BThe last is the high elven facsimile of troll magic known as the Arcanum. I do not know where they can be found.'
    WHERE `entry` IN (8184, 8185, 8186, 8187, 8188, 8189, 8190, 8191, 8192) AND `patch` = 5;

UPDATE `quest_template` 
    SET `Details` = 'Zanza can create the ancient troll enchantments with the right components. $B$BThe first is a primal Hakkari idol that must be taken from the most powerful of the Hakkari lieutenants: Jin\'do and the Bloodlord.$B$BThe second is a punctured voodoo doll. These can be found in the piles of refuse that litter this foul place. Look inside the jinxed hoodoo piles.'
    WHERE `entry` IN (8184, 8185, 8186, 8187, 8188, 8189, 8190, 8191, 8192) AND `patch` = 9;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
