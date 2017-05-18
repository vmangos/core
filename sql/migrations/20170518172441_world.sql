INSERT INTO `migrations` VALUES ('20170518172441'); 

# Fang of the Mystics pre-1.10 damage values
UPDATE `item_template` SET `dmg_min1`='54', `dmg_max1`='101' WHERE `entry`='17070';
