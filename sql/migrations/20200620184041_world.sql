DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200620184041');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200620184041');
-- Add your query below.

-- Unstable Rift Crystal
INSERT INTO `gameobject` VALUES (3998643, 180601, 0, -7509.66, -1036.72, 182.287, -0.10472, 0, 0, 0, 0, 7200, 7200, 100, 1, 0, 0, 5, 8);

-- Patch 1.3 to 1.4
-- This quest was made a duplicate of 7848 in later patches, 7848 is currently used for all patches.
UPDATE `quest_template` SET `Objectives`='Venture to the Molten Core and recover a Core Fragment. Return to Lothos Riftwaker when you have recovered the Core Fragment.
', `Details`='Rifts stir, tear, and collapse all around us, $r. Not two paces from where I stand is a tear leading through the depths of Blackrock Mountain, into the maw of the Firelord.$B$BSurprised? Pity... The mortal races cannot comprehend that which they cannot see, touch, or feel.$B$BI assure you, the portal is there and access is possible.$B$BI\'ve piqued your interest? Attunement is simple. Venture into the Molten Core and retrieve a core fragment. Return it to me and I shall attune your essence with the portal.' WHERE `entry`=7487; 
UPDATE `creature_questrelation` SET `patch_max`='1' WHERE  `id`=14387 AND `quest`=7487;
UPDATE `creature_questrelation` SET `patch_min`='2' WHERE  `id`=14387 AND `quest`=7848;

-- Patch 1.3 to 1.7
UPDATE `quest_template` SET  `OfferRewardText`='Step through the opening to my right and you shall find yourself inside the Molten Core.' WHERE `entry`=7848; 
UPDATE `quest_template` SET  `RequestItemsText`='Jumping through the opening now could end in disaster... for you.' WHERE `entry`=7848; 

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
