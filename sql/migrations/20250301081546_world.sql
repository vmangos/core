DROP PROCEDURE IF EXISTS add_migration;
DELIMITER $$
CREATE PROCEDURE add_migration()
BEGIN
    DECLARE v INT DEFAULT 1;
    SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250301081546');
    IF v=0 THEN
        INSERT INTO `migrations` VALUES ('20250301081546');
        
        -- Create a spell list with both the Healing Ward and Magma Totem
                DELETE FROM `creature_spells` WHERE `entry` = 25550;
        INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`) 
        VALUES (25550, 'Arathi Highlands - Witherbark Witch Doctor', 
               5605, 80, 0, 0, 0, 0, 10, 13, 14, 21, 0, -- Healing Ward with higher probability (80%)
               8190, 20, 0, 0, 0, 0, 8, 12, 0, 0, 0);    -- Magma Totem with lower probability (20%)
        
        -- Update the Witherbark Witch Doctor to use our updated spell list
        UPDATE `creature_template` 
        SET `spell_list_id` = 25550,  -- Use the spell list we just created/updated
            `spell_id1` = 0,          -- Clear direct spells since we're using spell_list
            `spell_id2` = 0,
            `spell_id3` = 0, 
            `spell_id4` = 0
        WHERE `entry` = 2555;         -- Witherbark Witch Doctor
    END IF;
END$$
DELIMITER ;

CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
