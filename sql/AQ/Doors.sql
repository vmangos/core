-- Spawn AQ doors
DELETE FROM gameobject WHERE guid BETWEEN 21783 AND 21785;
INSERT INTO gameobject (guid, id, map, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state, spawnFlags) VALUES
(21783, 180634, 531, -8929.61, 1344.38, -104.211, 3.84846, 0, 0, -0.938191, 0.346119, 7200, 100, 1, 0),
(21784, 180635, 531, -9016.36, 1330.68, -104.211, 2.80125, 0, 0, 0.985556, 0.169352, 7200, 100, 1, 0),
(21785, 180636, 531, -8429.59, 2048.81, 153.309, 3.51685, 0, 0, -0.982449, 0.186529, 7200, 100, 1, 0);

-- Makes doors untargettable and no despawn
UPDATE gameobject_template SET flags = 36 WHERE entry BETWEEN 180634 AND 180636;
