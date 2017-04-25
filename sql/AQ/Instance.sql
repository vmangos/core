
-- Setting 7day respawn timer on all AQ bosses. Note for ouro it's the spawner creature we need to set the respawn timer on.
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='88075';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='88076';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='88077';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='87938';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='88014';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='87911';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='87602';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='87648';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='87601';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='87603';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='87559';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='88073';

/*
SELECT * FROM mangos.creature where id in(
15275, -- twins
15276, -- twins
15263, -- skeram
15299, -- viscidus
15509, -- huhuran
15510, -- fankriss
15511, -- kri
15516, -- sartura
15517, -- ouro
15543, -- yauj
15544, -- vem
15727, -- cthun
15957) -- ouro spawner
*/