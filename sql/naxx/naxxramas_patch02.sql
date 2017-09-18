
-- Guardian of Icecrown
UPDATE `creature_template` SET `mindmg`=2258, `maxdmg`=2759, `MechanicImmuneMask`=1019427442 WHERE `entry`=16441;

-- misc missing creature linking
delete from creature_linking where guid in (2530344,2530568,2530709,2530710);
insert into creature_linking (`guid`,`master_guid`,`flag`)  VALUES 
(2530344, 88496, 3072), /*carrion spider, faerlina*/ 
(2530568, 88303, 3073), /*stitched giant, grobbulus*/
(2530709, 88205, 3072), /*mutated grub, heigan*/
(2530710, 88205, 3072); /*frenzied bat, heigan*/