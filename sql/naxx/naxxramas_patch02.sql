
-- Guardian of Icecrown
UPDATE `creature_template` SET `mindmg`=2258, `maxdmg`=2759, `MechanicImmuneMask`=1019427442 WHERE `entry`=16441;

-- misc missing creature linking
insert into creature_linking (`guid`,`master_guid`,`flag`)  VALUES (2530344, 88496, 3072), /*carrion spider, faerlina*/ (2530568, 88303, 3073); /*stitched giant, grobbulus*/