DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200413213416');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200413213416');
-- Add your query below.


-- update Heeding the Call (5925) to Kal (3602)
UPDATE `creature_questrelation` SET `id` = 3602 WHERE `quest` = 5925;

-- update Heeding the Call (5924) to Theridran (5505)
UPDATE `creature_questrelation` SET `id` = 5505 WHERE `quest` = 5924;

-- update Heeding the Call (5923) to Denatharion (4218)
UPDATE `creature_questrelation` SET `id` = 4218 WHERE `quest` = 5923;

-- update Heeding the Call (5926) to Innkeeper Pala (6746)
UPDATE `creature_questrelation` SET `id` = 6746 WHERE `quest` = 5926;

-- update Heeding the Call (5928) to Gennia Runetotem (3064)
UPDATE `creature_questrelation` SET `id` = 3064 WHERE `quest` = 5928;

-- remove quest Heeding the Call (5927) from Gart Mistrunner  (3060)
DELETE FROM `creature_questrelation` WHERE `quest` = 5927 AND `id` = 3060;

-- remove all incorrect trainers from Torwa Pathfinder (9063)
DELETE FROM `creature_questrelation` WHERE `quest` = 9063 AND `id` NOT IN(3033, 4217, 5505, 12042);

-- add correct progress text for Great Bear Spirit (5929)
UPDATE `quest_template` SET `RequestItemsText` = "Return only when the Great Bear Spirit has released you back unto me.  Your training cannot continue without its blessing." WHERE `entry` = 5929;

-- add correct progress text for Great Bear Spirit (5930)
UPDATE `quest_template` SET `RequestItemsText` = "Return only when the Great Bear Spirit has released you back unto me.  Your training cannot continue without its blessing." WHERE `entry` = 5930;

-- add correct progress text for Trial of the Lake (28)
UPDATE `quest_template` SET `RequestItemsText` = "To complete the Trial of the Lake, you must use the Shrine Bauble within the boundaries of this shrine.  Until you do so, your trial remains unfinished and it is at risk of failure." WHERE `entry` = 28;

-- add correct progress text for Trial of the Lake (29)
UPDATE `quest_template` SET `RequestItemsText` = "To complete the Trial of the Lake, you must use the Shrine Bauble within the boundaries of this shrine.  Until you do so, your trial remains unfinished and it is at risk of failure." WHERE `entry` = 29;

-- add correct progress text for Body and Heart (6002)
UPDATE `quest_template` SET `RequestItemsText` = "When you have faced the challenge that lies before you, your understanding of strength of body and strength of heart will be fully realized.  Until that time, I cannot help you further." WHERE `entry` = 6002;

-- add correct progress text for Body and Heart (6001)
UPDATE `quest_template` SET `RequestItemsText` = "When you have faced the challenge that lies before you, your understanding of strength of body and strength of heart will be fully realized.  Until that time, I cannot help you further." WHERE `entry` = 6001;

-- fix typo for Trial of the Sea Lion (30)
UPDATE `quest_template` SET `OfferRewardText` = "You've completed the Trial of the Sea Lion, $n - congratulations.$B$BEach task in acquiring the pendant shows that both agility and endurance are necessary to act in harmony with what you desire to do underwater. Neither can exist without the other, and both cannot be done without your willingness to embrace the aspect of the sea lion.$b$bRemember these lessons well, and count on them once you have gained your aquatic form." WHERE `entry` = 30;

-- fix typo for Trial of the Sea Lion (272)
UPDATE `quest_template` SET `OfferRewardText` = "You've completed the Trial of the Sea Lion, $n - congratulations.$B$BEach task in acquiring the pendant shows that both agility and endurance are necessary to act in harmony with what you desire to do underwater. Neither can exist without the other, and both cannot be done without your willingness to embrace the aspect of the sea lion.$b$bRemember these lessons well, and count on them once you have gained your aquatic form." WHERE `entry` = 272;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
