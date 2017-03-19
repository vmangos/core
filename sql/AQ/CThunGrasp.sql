-- Update creatures position
UPDATE creature SET position_x = -8652.2, position_y = 2020.92, position_z = 108.58, orientation = 3.65 WHERE id = 15378;
UPDATE creature SET position_x = -8660.63, position_y = 2022.4, position_z = 108.58, orientation = 4.09 WHERE id = 15379;
UPDATE creature SET position_x = -8663.34, position_y = 2029.9, position_z = 108.58, orientation = 4.31 WHERE id = 15380;

-- Apply faction brood of Nozdormu to npcs after C'Thun
UPDATE creature_template SET faction_H = 35, faction_A = 35 WHERE entry BETWEEN 15378 AND 15380;

-- Add Grasps
DELETE FROM gameobject WHERE guid BETWEEN 21797 AND 21799;
INSERT INTO gameobject (guid, id, map, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state, spawnFlags) VALUES
(21797, 180745, 531, -8660.63, 2022.4, 108.577, 3.64774, 0, 0, -0.968147, 0.250381, 7200, 100, 1, 0),
(21798, 180745, 531, -8652.2, 2020.92, 108.577, 0.244346, 0, 0, 0.121869, 0.992546, 7200, 100, 1, 0),
(21799, 180745, 531, -8663.34, 2029.9, 108.577, 4.45059, 0, 0, -0.793353, 0.608762, 7200, 100, 1, 0);

-- Set Grasps untargettables
UPDATE gameobject_template SET flags = 32 WHERE entry = 180745;
