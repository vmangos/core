DROP PROCEDURE IF EXISTS add_migration;
DELIMITER $$
CREATE PROCEDURE add_migration()
BEGIN
    DECLARE v INT DEFAULT 1;
    SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250301081546');
    IF v=0 THEN
        INSERT INTO `migrations` VALUES ('20250301081546');
        
        -- Update the Witherbark Witch Doctor to only use Healing Ward spell
        UPDATE `creature_template` 
        SET `spell_list_id` = 0,  -- Clear spell_list_id to avoid conflict with creature_spells
            `spell_id1` = 5605,   -- Healing Ward
            `spell_id2` = 0,      -- Remove the misnamed spell (actually Magma Totem, not Lightning Shield)
            `spell_id3` = 0, 
            `spell_id4` = 0
        WHERE `entry` = 2555;    -- Witherbark Witch Doctor
        
        -- Fix the misnamed spell (spell ID 8190) that was incorrectly labeled as Lightning Shield but is actually Magma Totem
        UPDATE `spell_template` 
        SET `SpellName` = 'Magma Totem' 
        WHERE `entry` = 8190 AND `SpellName` = 'Lightning Shield';
    END IF;
END$$
DELIMITER ;

CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration; 