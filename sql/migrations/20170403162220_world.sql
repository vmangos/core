INSERT INTO `migrations` VALUES ('20170403162220'); 

-- Update Skeletal Flayers, Scourge Soldiers, Scourge Warders and Scourge Champions to be immune to skeleton things
update creature_template set MechanicImmuneMask = 213521 where entry = 8523 or entry = 8525 or entry = 8529 or entry = 1783;
