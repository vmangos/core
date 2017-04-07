-- C'Thun portals aren't targettable
UPDATE creature_template SET unit_flags = unit_flags | 33554432 WHERE entry IN (15896, 15904, 15910);

-- Correct eye tentacle model
UPDATE creature_template SET modelid_1 = 15788 WHERE entry = 15726;

-- Correct giant eye tentacle scale
UPDATE creature_template SET scale = 5 WHERE entry = 15334;
-- Correct eye tentacle scale
UPDATE creature_template SET `scale`='1' WHERE `entry`='15726';

-- Correct giant claw tentacle scale
UPDATE creature_template SET scale = 5 WHERE entry = 15728;

-- Setting correct scale of claw tentacle
UPDATE creature_template SET `scale`='2' WHERE `entry`='15725';



  -- cmangos unit flags C'Thun tentacles TOD : search flags name
  UPDATE creature_template SET unit_flags = unit_flags | 32768 WHERE entry IN (15334, 15725, 15726, 15728, 15802);

  -- Bigger melee range for c'thun in p1
  UPDATE creature_model_info set `combat_reach` = 15, `bounding_radius` = 15  where `modelid` = 15556;
  
  
  -- flesh tentacle fix melee range
  UPDATE creature_model_info set `combat_reach` = 10, `bounding_radius` = 1.2  where `modelid` = 15793;	
  
  -- Giant claw tentacle fix melee range
  UPDATE creature_model_info set `combat_reach` = 10, `bounding_radius` = 1.2  where `modelid` = 15790;	
  -- Claw tentacle fix melee range
  UPDATE creature_model_info set `combat_reach` = 3.5, `bounding_radius` = 1.89  where `modelid` = 15789;	
  
  -- combat reach fixes for eye tentacles. Since they use same modelId atm it may need to be overwritten in code
   -- if 2 and 10 seems wrong.
  -- Giant Eye tentacle fix melee range
  UPDATE creature_model_info set `combat_reach` = 2, `bounding_radius` = 1.2  where `modelid` = 15788;	  
  -- Eye tentacle
  -- UPDATE creature_model_info set `combat_reach` = 3.5, `bounding_radius` = 1.2  where `modelid` = 15788;	
  

  
  
  -- moved c'thun eye and body slightly towards entrance
UPDATE creature SET `position_x`='-8577.270', `position_y`='1986.942' WHERE `guid`='87560';

UPDATE creature SET `position_x`='-8577.270', `position_y`='1986.942' WHERE `guid`='87559';


-- Set Giant claw dmg to around 2500 dmg per hit on a full t2 geared tank, with demo shout up. ~3200 without demo shout.
UPDATE creature_template SET `mindmg`='8500', `maxdmg`='9500' WHERE `entry`='15728';

-- Set Giant eye dmg to around 2500 dmg per hit on a full t2 geared tank, with demo shout up. ~3200 without demo shout.
UPDATE creature_template SET `mindmg`='8500', `maxdmg`='9500', `baseattacktime`='2000' WHERE `entry`='15334';

-- Set eye tentacle damage 350-450 on 38% armor (need a good source for what this dmg should be)
UPDATE creature_template SET `mindmg`='500', `maxdmg`='800', `baseattacktime`='2000' WHERE `entry`='15726';

-- Claw tentacle damage 350-450 on 38% armor (french pdf say top 200-300dmg, so maybe reduce)
UPDATE creature_template SET `mindmg`='500', `maxdmg`='800', `baseattacktime`='2000' WHERE `entry`='15725';


-- stomach of cthun area triggers
DELETE FROM scripted_areatrigger WHERE entry IN (4033, 4034, 4036);
INSERT INTO scripted_areatrigger (`entry`, `ScriptName`) VALUES ('4033', 'at_temple_ahnqiraj');
INSERT INTO scripted_areatrigger (`entry`, `ScriptName`) VALUES ('4034', 'at_temple_ahnqiraj');
INSERT INTO scripted_areatrigger (`entry`, `ScriptName`) VALUES ('4036', 'at_temple_ahnqiraj');

-- flags update on trigger unit used to knock players out of cthuns body after being ported. Flags copied from viscidus trigger.
-- UPDATE `mangos`.`creature_template` SET `unit_flags`='33587968', `ScriptName`='boss cthun knockback trigger' WHERE `entry`='15800';


-- to remove c'thuns eye
DELETE FROM `mangos`.`creature` WHERE `guid`='87560';

-- to re-add c'thuns eye
-- INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) 
-- VALUES ('87560', '15589	', '531', '15556', '0', '-8577.27', '1986.94', '100.4', '3.44', '6380', '0', '0', '1269434', '0', '0', '0');


-- Remove CREATURE_FLAG_EXTRA_AGGRO_ZONE from C'thun as we want to manually handle his combat with zone.
UPDATE creature_template SET flags_extra = flags_extra & ~512 WHERE entry = 15727;