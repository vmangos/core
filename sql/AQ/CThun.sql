-- C'Thun portals aren't targettable
UPDATE creature_template SET unit_flags = unit_flags | 33554432 WHERE entry IN (15896, 15904, 15910);

-- Correct eye tentacle model
UPDATE creature_template SET modelid_1 = 15788 WHERE entry = 15726;

-- Correct giant eye tentacle scale
UPDATE creature_template SET scale = 5 WHERE entry = 15334;

-- cmangos unit flags C'Thun tentacles TOD : search flags name
UPDATE creature_template SET unit_flags = unit_flags | 32768 WHERE entry IN (15334, 15725, 15726, 15728, 15802);

  -- Bigger melee range for c'thun in p1
  UPDATE `creature_model_info` set `combat_reach` = 15, `bounding_radius` = 15  where `modelid` = 15556;
  
  -- flesh tentacle bigger melee-range (source: https://youtu.be/46yJL8eFxaQ?t=6m16s)
  UPDATE `creature_model_info` set `combat_reach` = 10, `bounding_radius` = 10  where `modelid` = 15793;	
  
  -- Giant claw tentacle bigger melee-range 
  UPDATE `creature_model_info` set `combat_reach` = 10, `bounding_radius` = 10  where `modelid` = 15790;	