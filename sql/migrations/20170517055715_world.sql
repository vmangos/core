INSERT INTO `migrations` VALUES ('20170517055715'); 

# Make Eye of C'Thun immune to interrupt - added C'Thun too, even though he doesn't cast anything
UPDATE `creature_template` SET `MechanicImmuneMask`='650854235' WHERE `entry`='15589';
UPDATE `creature_template` SET `MechanicImmuneMask`='650854235' WHERE `entry`='15727';