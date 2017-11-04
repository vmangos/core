DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171026072519');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171026072519');
-- Add your query below.

-- -------------------------------
-- 
-- NAXXRAMAS PATCH 1
-- 
-- Buff removal on instance entering
-- Creature script changes
-- Enchant quests repeatable
-- Creature faction corrections
-- Scarlet Monastery Ashbringer event implementation
-- -------------------------------

-- Fate of Ramaladni 1% droprate
update creature_loot_template set ChanceOrQuestChance = -1 where Item = 22708;

-- Lightning totem chain lightning aura application timer
UPDATE `creature_ai_scripts` SET `event_type`=0, `event_param1`=2000, `event_param2`=2500 WHERE `id`=1638501;

-- Living Monstrosity lightning totem spawntimer
UPDATE `creature_ai_scripts` SET `event_param3`=10000, `event_param4`=15000 WHERE `id`=1602103;

-- Unholy Axe mortal strike on target instead of self
UPDATE `creature_ai_scripts` SET `action1_param2`=1 WHERE `id`=1619402;

-- Make the shadow/ice guard repetable
UPDATE `quest_template` SET `SpecialFlags`='1' WHERE `entry`='9211';
UPDATE `quest_template` SET `SpecialFlags`='1' WHERE `entry`='9213';

-- correct a misunderstanding with faction vs faction template -_-
UPDATE creature_template SET faction_A=21, faction_H=21 where entry in(
16419,
16474,
16286,
16447,
16243,
16244,
16168,
15954,
16297,
16037,
16034,
15936,
16011,
16446,
16057,
16056,
16017,
16018,
16024,
16028,
16025,
15931,
15932,
15975,
15976,
15977,
15974,
16453,
15956,
16194,
16163,
16215,
16216,
16165,
16146,
16145,
16164,
16154,
16158,
16156,
16193,
16167,
16157,
16061,
16067,
16060,
15928,
15952,
16861,
15953,
15981,
15980,
15978,
16020,
16022,
16021,
16211,
16029,
16064,
16065,
16063,
16062,
15989,
16451,
16452,
16368,
15990,
16449,
16448,
15979,
15929,
15930,
16027,
16124,
16125,
16126,
16127,
16142,
16148,
16149,
16150,
16236,
16290,
16360,
16363,
16375,
16385,
16427,
16428,
16429,
16441,
16505,
16506,
16573,
16698,
16803,
16981,
16982,
16983,
16984,
16036,
16129);

/*
 Ashbringer periodic trigger aura.
 This spell must be negative as it should display as negative to player,
 but that also means it puts player in combat with any creature within the radius.
 To avoid this we set attributes SPELL_ATTR_EX3_NO_INITIAL_AGGRO to avoid combat,
 and SPELL_ATTR_EX_NOT_BREAK_STEALTH to not break stealth of everything in range
 */
DELETE FROM `spell_mod` where Id in (28441, 28282);
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`,
`AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, 
`StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `Comment`) 
VALUES                                                              
('28441', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1',   '-1', '32 ', '-1', '131072', '-1',   '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'AB Effect 000'),
('28282', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1',   '320', '-1 ', '-1', '-1', '-1',   '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Ashbringer to passive');

-- ashbringer in SM event scripttexts 
delete from script_texts where entry between -1999928 and -1999916;
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`)
VALUES 
(-1999927,'Have you come to save the world? To cleanse it?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Ashbringer event'),
(-1999928,'And it begins...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Ashbringer event'),
(-1999916,'Ashbringer...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Ashbringer event'),
(-1999917,'Kneel! Kneel before the Ashbringer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Ashbringer event'),
(-1999918,'My Lord, please allow me to live long enough to see you purge this world of the infidles.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Ashbringer event'),
(-1999919,'Take me with you, Sir.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Ashbringer event'),

(-1999920,'You hold my father\'s blade. My soldiers are yours to control, my Lord. Take them... Lead them... The impure must be purged. They must be cleansed of their taint.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Ashbringer event'),
(-1999921,'Father... But... How?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Ashbringer event'),
(-1999922,'Forgive me, father! Please...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Ashbringer event'),
(-1999923,'Renault...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Ashbringer event'),
(-1999924,'Did you think that your betrayal would be forgotten? Lost in the carefully planned cover up of my death? Blood of my blood, the blade felt your cruelty long after my heart had stopped beating. And in death, I knew what you had done. But now, the chains of Kel\'thuzad hold me no more. I come to serve justice. I AM ASHBRINGER.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Ashbringer event'),
(-1999925,'You are forgiven...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Ashbringer event'),

(-1999926,'Bow down! Kneel before the Ashbringer! A new dawn approaches, brothers and sisters! Our message will be delivered to the filth of this world through the chosen one!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,6,0,0,'Ashbringer event');

-- scholomance scourge boss, make that dude attackable
UPDATE creature_template SET faction_A='14', faction_H='14' WHERE entry=14695;



DELETE FROM gossip_menu where entry between 30101 and 30117;
INSERT INTO gossip_menu (entry, text_id, condition_id) VALUES
(30101, 30117, 0),
(30102, 30118, 0),
(30103, 30119, 0),
(30104, 30120, 0),
(30105, 30121, 0),
(30106, 30122, 0),
(30107, 30123, 0),
(30108, 30124, 0),
(30109, 30125, 0),
(30110, 30126, 0),
(30111, 30127, 0),
(30112, 30128, 0),
(30113, 30129, 0),
(30114, 30130, 0),
(30115, 30131, 0),
(30116, 30132, 0),
(30117, 30133, 0);

DELETE FROM gossip_menu_option where menu_id  between 30101 and 30116;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text,                               option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('30101', '0', '0', 'Curse? What\'s going on here, Fairbanks?',                                              '1', '1',                 '30102',         '0', '0', '0', '0', NULL, '0'),
('30102', '0', '0', 'Mograine?',                                                                             '1', '1',                 '30103',         '0', '0', '0', '0', NULL, '0'),
('30103', '0', '0', 'What do you mean?',                                                                     '1', '1',                 '30104',         '0', '0', '0', '0', NULL, '0'),
('30104', '0', '0', 'I still do not fully understand.',                                                      '1', '1',                 '30105',         '0', '0', '0', '0', NULL, '0'),
('30105', '0', '0', 'Incredible story. So how did he die?',                                                  '1', '1',                 '30106',         '0', '0', '0', '0', NULL, '0'),
('30106', '0', '0', 'You mean...',                                                                           '1', '1',                 '30107',         '0', '0', '0', '0', NULL, '0'),
('30107', '0', '0', 'How do you know all of this?',                                                          '1', '1',                 '30108',         '0', '0', '0', '0', NULL, '0'),
('30108', '0', '0', 'A thousand? For one man?',                                                              '1', '1',                 '30109',         '0', '0', '0', '0', NULL, '0'),
('30109', '0', '0', 'Yet? Yet what??',                                                                       '1', '1',                 '30110',         '0', '0', '0', '0', NULL, '0'),
('30110', '0', '0', 'And did he?',                                                                           '1', '1',                 '30111',         '0', '0', '0', '0', NULL, '0'),
('30111', '0', '0', 'Continue please, Fairbanks.',                                                           '1', '1',                 '30112',         '0', '0', '0', '0', NULL, '0'),
('30112', '0', '0', 'You mean...',                                                                           '1', '1',                 '30113',         '0', '0', '0', '0', NULL, '0'),
('30113', '0', '0', 'You were right, Fairbanks. That is tragic.',                                            '1', '1',                 '30114',         '0', '0', '0', '0', NULL, '0'),
('30114', '0', '0', 'And you did...',                                                                        '1', '1',                 '30115',         '0', '0', '0', '0', NULL, '0'),
('30115', '0', '0', 'You tell an incredible tale, Fairbanks. What of the blade? Is it beyond redemption?',   '1', '1',                 '30116',         '0', '0', '0', '0', NULL, '0'),
('30116', '0', '0', 'But his son is dead.',                                                                  '1', '1',                 '30117',         '0', '0', '0', '0', NULL, '0');

-- todo: emotes
DELETE FROM `npc_text` where ID between 30117 and 30133;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, 
`em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, 
`text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`,
 `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) 
 VALUES
(30117, 'At last, the curse is lifted. Thank you, hero.','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30118, 'You mean, you don\'t know? The sword that you carry on your back - it is known as Ashbringer; named after its original owner.','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30119, 'Aye, the Highlord Mograine: A founder of the original order of the Scarlet Crusade. A knight of unwavering faith and purity; Mograine would be betrayed by his own son and slain by Kel\'Thuzad\'s forces inside Stratholme. It is how I ended up here...','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30120, 'It was High General Abbendis, High Inquisitor Isillien, and Highlord Mograine that formed the Crusade. In its infancy, the Crusade was a noble order. The madness and insane zealotry that you see now did not exist. It was not until the one known as the Grand Crusader appeared that the wheels of corruption were set in motion.','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30121, 'The Highlord was the lynchpin of the Crusade. Aye, Mograine was called the Ashbringer because of his exploits versus the armies of the Lich King. With only blade and faith, Mograine would walk into whole battalions of undead and emerge unscathed - the ashes of his foes being the only indication that he had been there at all. Do you not understand? The very face of death feared him! It trembled in his presence!','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30122, 'The only way a hero can die, $r: Through tragedy. The Grand Crusader struck a deal with Kel\'Thuzad himself! An ambush would be staged that would result in the death of Mograine. The type of betrayal that could only be a result of the actions of one\'s most trusted and loved companions.','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30123, '<High Inquisitor Fairbanks nods.>$B$BAye, the lesser Mograine, the one known as the Scarlet Commander, through - what I suspect - the dealings of the Grand Crusader. He led his father to the ambush like a lamb to the slaughter.','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30124, '<High Inquisitor Fairbanks lifts up his tabard revealing several gruesome scars.>$B$BBecause I was there... I was the Highlord\'s most trusted advisor. I should have known... I felt that something was amiss yet I allowed it to happen. Would you believe that there were a thousand or more Scourge?','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30125, 'This was the Ashbringer, fool! As the Scourge began to materialize around us, Mograine\'s blade began to glow... to hum... the younger Mograine would take that as a sign to make his escape. They descended upon us with a hunger the likes of which I had never seen. Yet...','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30126, 'It was not enough.$B$B<Fairbanks smirks briefly, lost in a memory.>$B$BA thousand came and a thousand died. By the Light! By the might of Mograine! He would smite them down as fast as they could come. Through the chaos, I noticed that the lesser Mograine was still there, off in the distance. I called to him, \"Help us, Renault! Help your father, boy!\"','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30127, '<High Inquisitor Fairbanks shakes his head.>$B$BNo... He stood in the background, watching as the legion of undead descended upon us. Soon after, my powers were exhausted. I was the first to fall... Surely they would tear me limb from limb as I lay there unconscious; but they ignored me completely, focusing all of their attention on the Highlord. ','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30128, 'It was all I could do to feign death as the corpses of the Scourge piled upon me. There was darkness and only the muffled sounds of the battle above me. The clashing of iron, the gnashing and grinding... gruesome, terrible sounds. And then there was silence. He called to me! \"Fairbanks! Fairbanks where are you? Talk to me Fairbanks!\" And then came the sound of incredulousness. The bite of betrayal, $r...','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30129, 'The boy had picked up the Ashbringer and driven it through his father\'s heart as his back was turned. His last words will haunt me forever: \"What have you done, Renault? Why would you do this?\"','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30130, 'The blade and Mograine were a singular entity. Do you understand? This act corrupted the blade and lead to Mograine\'s own corruption as a death knight of Kel\'Thuzad. I swore that if I lived, I would expose the perpetrators of this heinous crime. For two days I remained under the rot and contagion of Scourge - gathering as much strength as possible to escape the razed city.\n','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30131, 'Aye, I did. Much to the dismay of the lesser Mograine, I made my way back to the Scarlet Monastery. I shouted and screamed. I told the tale to any that would listen. And I would be murdered in cold blood for my actions, dragged to this chamber - the dark secret of the order. But some did listen... some heard my words. Thus was born the Argent Dawn...','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30132, 'I\'m afraid that the blade which you hold in your hands is beyond saving. The hatred runs too deep. But do not lose hope, $c. Where one chapter has ended, a new one begins.$B$BFind his son - a more devout and pious man you may never meet. It is rumored that he is able to build the Ashbringer anew, without requiring the old, tainted blade.','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(30133, '<High Inquisitor Fairbanks shakes his head.>$B$BNo, $r; only one of his sons is dead. The other lives...$B$B<High Inquisitor Fairbanks points to the sky.>$B$BThe Outland... Find him there... ','', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `gossip_menu_id`='30101', `npcflag`=1 WHERE `entry`=16439;
UPDATE `creature_template` SET `gossip_menu_id`=30101 WHERE `entry`=4542;


UPDATE `creature_template` SET `mindmg`=5000, `maxdmg`=10000 WHERE `entry`=16116;
UPDATE `creature_template` SET `mindmg`=5000, `maxdmg`=10000 WHERE `entry`=16113;
UPDATE `creature_template` SET `mindmg`=5000, `maxdmg`=10000 WHERE `entry`=16115;
UPDATE `creature_template` SET `mindmg`=5000, `maxdmg`=10000 WHERE `entry`=16112;
-- make Archmage Angela Dosantos (naxx attunement npc) respawn after 60 sec
update `creature` SET `spawntimesecs`=60 where `id`=16116;

-- lord blackwood
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry`=14695;
UPDATE creature SET spawntimesecs='3600' WHERE guid='2353';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
