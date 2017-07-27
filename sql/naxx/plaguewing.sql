-- Stoneskin gargoyle switch from eventAI to script. Immune to pmuch everything
UPDATE `creature_template` SET `AIName`='', `MechanicImmuneMask`=1073725439, `ScriptName`='naxxramas_gargoyle_ai' WHERE `entry`=16168;

-- Plague Slime switch from eventAI to script
UPDATE `creature_template` SET `AIName`='', `MechanicImmuneMask`=1073725439, `ScriptName`='naxxramas_plague_slime_ai' WHERE `entry`=16243;

-- Plague slime creating creature_template entries for all 4 colors
DELETE FROM `creature_template` where entry in (16243, 16783, 16784, 16785);
INSERT INTO `creature_template` (`entry`,`KillCredit1`,`KillCredit2`,`modelid_1`,`modelid_2`,`modelid_3`,`modelid_4`,`name`,`subname`,`gossip_menu_id`,`minlevel`,`maxlevel`,`minhealth`,`maxhealth`,`minmana`,`maxmana`,`armor`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`PetSpellDataId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Civilian`,`RacialLeader`,`RegenHealth`,`equipment_id`,`trainer_id`,`vendor_id`,`MechanicImmuneMask`,`SchoolImmuneMask`,`flags_extra`,`ScriptName`) 
VALUES 
/* black (shadow) */
(16243,0,0,11140,0,0,0,'Plague Slime','',0,61,61,140943,140943,0,0,4091,21,21,0,1,0.35,2,1,7500,9000,0,278,1,1150,1265,0,0,0,0,0,0,0,0,172.1,240.07,100,10,8,16243,0,0,0,5,5,5,5,5,0,0,0,0,0,6051,7906,'',0,3,0,0,1,0,0,0,0,32,0,'naxxramas_plague_slime_ai'),

/*blue (frost) */
(16783,0,0,11139,0,0,0,'Plague Slime','',0,61,61,140943,140943,0,0,4091,21,21,0,1,0.35,2,1,7500,9000,0,278,1,1150,1265,0,0,0,0,0,0,0,0,172.1,240.07,100,10,8,16243,0,0,0,5,5,5,5,5,0,0,0,0,0,6051,7906,'',0,3,0,0,1,0,0,0,0,16,0,'naxxramas_plague_slime_ai'),

/*red (fire) */
(16784,0,0,11138,0,0,0,'Plague Slime','',0,61,61,140943,140943,0,0,4091,21,21,0,1,0.35,2,1,7500,9000,0,278,1,1150,1265,0,0,0,0,0,0,0,0,172.1,240.07,100,10,8,16243,0,0,0,5,5,5,5,5,0,0,0,0,0,6051,7906,'',0,3,0,0,1,0,0,0,0,4,0,'naxxramas_plague_slime_ai'),

/*green (nature) */
(16785,0,0,11137,0,0,0,'Plague Slime','',0,61,61,140943,140943,0,0,4091,21,21,0,1,0.35,2,1,7500,9000,0,278,1,1150,1265,0,0,0,0,0,0,0,0,172.1,240.07,100,10,8,16243,0,0,0,5,5,5,5,5,0,0,0,0,0,6051,7906,'',0,3,0,0,1,0,0,0,0,8,0,'naxxramas_plague_slime_ai');

-- plague beast keep positive auras on evade
UPDATE `creature_template` SET `flags_extra`=4096 WHERE `entry`=16034;