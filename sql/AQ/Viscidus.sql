-- cmangos unit flags Viscidus trigger TOD : search flags name
UPDATE creature_template SET unit_flags = unit_flags | 33587968 WHERE entry = 15922;

-- Viscidus trigger aren't targettable and can't fight players
UPDATE creature_template SET minlevel = 63, maxlevel = 63, unit_flags = unit_flags | (33554432 + 512), scriptname = "boss_viscidus_trigger" WHERE entry = 15922;

-- Viscidus trigger must be hostile (faction 14 = moster) to work, both in viscidus logic and in c'thuns stomach.
UPDATE creature_template SET faction_A = 14, faction_H= 14 WHERE entry=15922;

-- Summon glob of Viscidus spell target position
DELETE FROM spell_target_position WHERE id BETWEEN 25865 AND 25884;
INSERT INTO spell_target_position (id , target_map, target_position_x, target_position_y, target_position_z, target_orientation) VALUES
(25865, 531, -8023.59, 964.772, -41.229, 5.376),
(25866, 531, -8042.13, 911.263, -42.841, 6.2),
(25867, 531, -7999.36, 860.525, -47.206, 1.417),
(25868, 531, -7971.3, 862.581, -48.099, 2.148),
(25869, 531, -7943.21, 903.804, -48.473, 3.078),
(25870, 531, -7954.38, 958.562, -41.609, 3.962),
(25871, 531, -7997.19, 979.192, -41.653, 4.896),
(25872, 531, -8037.89, 929.679, -43.416, 6.024),
(25873, 531, -8015.41, 867.734, -45.607, 1.103),
(25874, 531, -7982.8, 857.172, -48.212, 1.5),
(25875, 531, -7952.12, 883.183, -48.194, 2.43),
(25876, 531, -7947.22, 939.122, -44.014, 3.718),
(25877, 531, -7975.77, 974.82, -41.584, 4.417),
(25878, 531, -8032.75, 948.274, -41.919, 5.595),
(25879, 531, -8037.08, 887.268, -43.581, 0.675),
(25880, 531, -7992.21, 857.5, -47.762, 1.664),
(25881, 531, -7960.71, 872.483, -48.759, 2.36),
(25882, 531, -7942.98, 918.616, -46.401, 3.306),
(25883, 531, -7964.32, 967.879, -42.112, 4.087),
(25884, 531, -8015.24, 976.553, -41.647, 4.947);

-- correct glob of Viscidus modelid and unit flags
UPDATE creature_template SET modelid_1 = 12349, unit_flags = 32768 WHERE entry = 15667;

-- Remove silver drops from Glob of Viscidus
UPDATE creature_template SET mingold = 0, maxgold = 0 WHERE entry = 15667;

-- Update Glob of Viscidus immunities
UPDATE creature_template SET MechanicImmuneMask = 617299803 WHERE entry = 15667;

-- Viscidus teleport spell
INSERT INTO spell_target_position (id, target_map, target_position_x, target_position_y, target_position_z, target_orientation) VALUES (25904, 531, -7992.36, 908.19, -52.62, 1.68);

-- Not tauntable
UPDATE creature_template SET flags_extra = 257 WHERE entry = 15299;

-- Update speed
UPDATE creature_template SET speed_walk = 3, speed_run = 3 WHERE entry = 15299;
UPDATE creature_template SET speed_run = 1 WHERE entry = 15667;