-- increased patcwerks movementspeed slightly
UPDATE `creature_template` SET `speed_walk`='1.5', `speed_run`='1.5' WHERE `entry`=16028;

-- patchwerk slightly larger hitbox
UPDATE `creature_model_info` SET `combat_reach`='5' WHERE `entry` = 16174;