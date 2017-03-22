-- cmangos unit flags Viscidus trigger TOD : search flags name
UPDATE creature_template SET unit_flags = unit_flags | 33587968 WHERE entry = 15922;

-- Viscidus trigger aren't targettable and can't fight players
UPDATE creature_template SET unit_flags = unit_flags | (33554432 + 512), AIName = "NullAI" WHERE entry = 15922;

-- Viscidus texts from cmangos
DELETE FROM script_texts WHERE entry BETWEEN -1531046 AND -1531041;
INSERT INTO script_texts (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, type, language, emote, comment) VALUES
(-1531046, "%s explodes!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, "viscidus EMOTE_EXPLODE"),
(-1531045, "%s looks ready to shatter!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, "viscidus EMOTE_SHATTER"),
(-1531044, "%s begins to crack!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, "viscidus EMOTE_CRACK"),
(-1531043, "%s is frozen solid!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, "viscidus EMOTE_FROZEN"),
(-1531042, "%s is freezing up!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, "viscidus EMOTE_FREEZE"),
(-1531041, "%s begins to slow!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, "viscidus EMOTE_SLOW");

-- Summon glob of Viscidus spell target position
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
