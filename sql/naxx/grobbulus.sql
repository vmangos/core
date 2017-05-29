
-- Fallout should do a lot more dmg (no exact sources, but videos show tanks dropping quite a bit)
UPDATE `creature_template` SET `mindmg`=5045, `maxdmg`=6115 WHERE `entry`=16290;

-- Giving grobbulus cloud creature a scriptname and make it invisible and give it a proper level so the cloud spell dosent resist. and faction
UPDATE `creature_template` SET `ScriptName`="boss_grobbulus_cloud", `unit_class`='1', `unit_flags` = 33587968, `minlevel`='63', `maxlevel`='63', `faction_A`='20', `faction_H`='20' WHERE `entry`=16363;
