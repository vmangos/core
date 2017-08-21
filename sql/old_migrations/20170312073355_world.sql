INSERT INTO `migrations` VALUES ('20170312073355'); 
-- FIX for Extinguishing the Idol quest, where involvedrelation entry is missing for brazier

-- Allow quest to be turned in to Belnistrasz's Brazier
INSERT INTO `gameobject_involvedrelation` VALUES ('152097','3525');
