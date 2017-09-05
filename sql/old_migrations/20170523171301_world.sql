INSERT INTO `migrations` VALUES ('20170523171301'); 

-- Update remaining crabs that cant swim
update creature_template set InhabitType = 3 where entry in (2231, 2232, 2233, 2234, 2235, 2236, 3228, 6250); 
