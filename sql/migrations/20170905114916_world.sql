INSERT INTO `migrations` VALUES ('20170905114916'); 

-- Update Viscidus spawn to be more central
UPDATE `creature` SET `position_x` = -7993.956, `position_y` = 926.309, `position_z` = -52.699 WHERE `guid` = 87938;
-- Update the teleport too
UPDATE `spell_target_position` SET `target_position_x` = -7993.956, `target_position_y` = 926.309, `target_position_z` = -52.699 WHERE `id` = 25904;

-- Update glob spawn positions on shatter to be evenly distributed around the spawn
-- at a radius of 52 units
UPDATE `spell_target_position` SET `target_position_x` = -7977.887, `target_position_y` = 975.764, `target_position_z` = -41.550 WHERE `id` = 25865;
UPDATE `spell_target_position` SET `target_position_x` = -7963.391, `target_position_y` = 968.378, `target_position_z` = -41.910 WHERE `id` = 25866;
UPDATE `spell_target_position` SET `target_position_x` = -7951.887, `target_position_y` = 956.874, `target_position_z` = -41.402 WHERE `id` = 25867;
UPDATE `spell_target_position` SET `target_position_x` = -7944.501, `target_position_y` = 942.378, `target_position_z` = -42.751 WHERE `id` = 25868;
UPDATE `spell_target_position` SET `target_position_x` = -7941.956, `target_position_y` = 926.309, `target_position_z` = -45.383 WHERE `id` = 25869;
UPDATE `spell_target_position` SET `target_position_x` = -7944.501, `target_position_y` = 910.240, `target_position_z` = -48.013 WHERE `id` = 25870;
UPDATE `spell_target_position` SET `target_position_x` = -7951.887, `target_position_y` = 895.744, `target_position_z` = -49.610 WHERE `id` = 25871;
UPDATE `spell_target_position` SET `target_position_x` = -7963.391, `target_position_y` = 884.240, `target_position_z` = -50.245 WHERE `id` = 25872;
UPDATE `spell_target_position` SET `target_position_x` = -7977.887, `target_position_y` = 876.854, `target_position_z` = -50.808 WHERE `id` = 25873;
UPDATE `spell_target_position` SET `target_position_x` = -7993.956, `target_position_y` = 874.309, `target_position_z` = -50.599 WHERE `id` = 25874;
UPDATE `spell_target_position` SET `target_position_x` = -8010.025, `target_position_y` = 876.854, `target_position_z` = -47.834 WHERE `id` = 25875;
UPDATE `spell_target_position` SET `target_position_x` = -8024.521, `target_position_y` = 884.240, `target_position_z` = -45.808 WHERE `id` = 25876;
UPDATE `spell_target_position` SET `target_position_x` = -8036.025, `target_position_y` = 895.744, `target_position_z` = -45.091 WHERE `id` = 25877;
UPDATE `spell_target_position` SET `target_position_x` = -8043.411, `target_position_y` = 910.240, `target_position_z` = -42.251 WHERE `id` = 25878;
UPDATE `spell_target_position` SET `target_position_x` = -8045.956, `target_position_y` = 926.309, `target_position_z` = -39.046 WHERE `id` = 25879;
UPDATE `spell_target_position` SET `target_position_x` = -8043.411, `target_position_y` = 942.378, `target_position_z` = -39.008 WHERE `id` = 25880;
UPDATE `spell_target_position` SET `target_position_x` = -8036.025, `target_position_y` = 956.874, `target_position_z` = -39.475 WHERE `id` = 25881;
UPDATE `spell_target_position` SET `target_position_x` = -8024.521, `target_position_y` = 968.378, `target_position_z` = -40.223 WHERE `id` = 25882;
UPDATE `spell_target_position` SET `target_position_x` = -8010.025, `target_position_y` = 975.764, `target_position_z` = -42.047 WHERE `id` = 25883;
UPDATE `spell_target_position` SET `target_position_x` = -7993.956, `target_position_y` = 978.309, `target_position_z` = -42.000 WHERE `id` = 25884;
