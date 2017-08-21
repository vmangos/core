INSERT INTO `migrations` VALUES ('20170611155039');

-- Enable Gravemoss spawns
-- Affected GUIDs: 4432, 4433, 4435, 4437, 4438, 4439, 4440, 4443, 4446, 4447, 4448, 4449, 4451, 4452, 4454, 4455, 4458, 4459, 4461, 4463, 4464, 4465, 4466, 4467, 4469, 4472, 4473, 4474, 4476, 4477, 4479, 4480, 4481, 4484, 4485, 4487, 4488, 4489, 4491, 4494, 4495, 4499, 4500, 4502, 4503, 4504, 4505, 4507, 18680, 18677, 18676, 17892, 16751, 14026, 33336, 33483, 39995
UPDATE `gameobject` SET `spawnFlags` = `spawnFlags` & ~2 WHERE `id` = 1628;

-- Only one Gravemoss with animprogress 0
UPDATE `gameobject` SET `animprogress` = 100 WHERE `guid` = 39995 AND `id` = 1628;

-- Add pool templates for various Gravemoss zones
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`) VALUES
(104,  2,  'Grave Moss (x7) - Stromgarde',    0,  0),
(105,  5,  'Grave Moss (x27) - Raven Hill',    0,  0),
(106,  2,  'Grave Moss (x6) - Tranquil Gardens',    0,  0),
(107,  3,  'Grave Moss (x13) - Kodo Graveyard',    0,  0);

-- Stromgarde Gravemoss Pool
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES
(4467,   104,   0,  'Grave Moss - Stromgarde',   0),
(16751,  104,   0,  'Grave Moss - Stromgarde',   0),
(4449,   104,   0,  'Grave Moss - Stromgarde',   0),
(4469,   104,   0,  'Grave Moss - Stromgarde',   0),
(4459,   104,   0,  'Grave Moss - Stromgarde',   0),
(4464,   104,   0,  'Grave Moss - Stromgarde',   0),
(4472,   104,   0,  'Grave Moss - Stromgarde',   0);

-- Raven Hill Gravemoss Pool
REPLACE INTO `pool_gameobject` VALUES
(4447,   105,   0,  'Grave Moss - Raven Hill',   0),
(4446,   105,   0,  'Grave Moss - Raven Hill',   0),
(4432,   105,   0,  'Grave Moss - Raven Hill',   0),
(4465,   105,   0,  'Grave Moss - Raven Hill',   0),
(4504,   105,   0,  'Grave Moss - Raven Hill',   0),
(4448,   105,   0,  'Grave Moss - Raven Hill',   0),
(4502,   105,   0,  'Grave Moss - Raven Hill',   0),
(4452,   105,   0,  'Grave Moss - Raven Hill',   0),
(4491,   105,   0,  'Grave Moss - Raven Hill',   0),
(4438,   105,   0,  'Grave Moss - Raven Hill',   0),
(33483,  105,   0,  'Grave Moss - Raven Hill',   0),
(4474,   105,   0,  'Grave Moss - Raven Hill',   0),
(14026,  105,   0,  'Grave Moss - Raven Hill',   0),
(4439,   105,   0,  'Grave Moss - Raven Hill',   0),
(4484,   105,   0,  'Grave Moss - Raven Hill',   0),
(4500,   105,   0,  'Grave Moss - Raven Hill',   0),
(4485,   105,   0,  'Grave Moss - Raven Hill',   0),
(4463,   105,   0,  'Grave Moss - Raven Hill',   0),
(39995,  105,   0,  'Grave Moss - Raven Hill',   0),
(4488,   105,   0,  'Grave Moss - Raven Hill',   0),
(4494,   105,   0,  'Grave Moss - Raven Hill',   0),
(4461,   105,   0,  'Grave Moss - Raven Hill',   0),
(4435,   105,   0,  'Grave Moss - Raven Hill',   0),
(4458,   105,   0,  'Grave Moss - Raven Hill',   0),
(4479,   105,   0,  'Grave Moss - Raven Hill',   0),
(4433,   105,   0,  'Grave Moss - Raven Hill',   0),
(17892,  105,   0,  'Grave Moss - Raven Hill',   0);

-- Tranquil Garden Cemetery Grave Moss Pool
REPLACE INTO `pool_gameobject` VALUES
(4473,   106,   0,  'Grave Moss - Tranquil Gardens',   0),
(4480,   106,   0,  'Grave Moss - Tranquil Gardens',   0),
(4454,   106,   0,  'Grave Moss - Tranquil Gardens',   0),
(4466,   106,   0,  'Grave Moss - Tranquil Gardens',   0),
(4440,   106,   0,  'Grave Moss - Tranquil Gardens',   0),
(4455,   106,   0,  'Grave Moss - Tranquil Gardens',   0);

-- Kodo Graveyard Gravemoss Pool
REPLACE INTO `pool_gameobject` VALUES
(4499,   107,   0,  'Grave Moss - Kodo Graveyard',   0),
(4443,   107,   0,  'Grave Moss - Kodo Graveyard',   0),
(4505,   107,   0,  'Grave Moss - Kodo Graveyard',   0),
(4451,   107,   0,  'Grave Moss - Kodo Graveyard',   0),
(4487,   107,   0,  'Grave Moss - Kodo Graveyard',   0),
(4503,   107,   0,  'Grave Moss - Kodo Graveyard',   0),
(4507,   107,   0,  'Grave Moss - Kodo Graveyard',   0),
(4437,   107,   0,  'Grave Moss - Kodo Graveyard',   0),
(4489,   107,   0,  'Grave Moss - Kodo Graveyard',   0),
(4477,   107,   0,  'Grave Moss - Kodo Graveyard',   0),
(4495,   107,   0,  'Grave Moss - Kodo Graveyard',   0),
(4476,   107,   0,  'Grave Moss - Kodo Graveyard',   0),
(4481,   107,   0,  'Grave Moss - Kodo Graveyard',   0);
