
-- for type, 0=CHAT_TYPE_SAY, 1=CHAT_TYPE_YELL, 2=CHAT_TYPE_TEXT_EMOTE, 3=CHAT_TYPE_BOSS_EMOTE, 4=CHAT_TYPE_WHISPER, 5=CHAT_TYPE_BOSS_WHISPER (4 and 5 are handled equally)

-- Found a much more complete list of aq text scripts here: https://github.com/scriptdev2/scriptdev2-classic/blob/master/sql/scriptdev2_script_full.sql
-- These are copied from there, with some modifcations:

-- -1531012: changed type to 3, todo: make sure it actually works... 2(prev val) worked, but 3 should have higher distance

-- NOTE FOR ELYSIUM: QUick and dirty delete and replace. There are some french translations in the nost database. If you want to keep these, make a more fancy update
DELETE FROM script_texts WHERE entry BETWEEN -1531046 AND -1531000;
INSERT INTO script_texts (entry, content_default, sound, type, language, emote, comment) VALUES


-- Skeram
(-1531000,'Are you so eager to die? I would be happy to accomodate you.',8615,1,0,0,'skeram SAY_AGGRO1'),
(-1531001,'Cower mortals! The age of darkness is at hand.',     8616,1,0,0,'skeram SAY_AGGRO2'),
(-1531002,'Tremble! The end is upon you.',                      8621,1,0,0,'skeram SAY_AGGRO3'),
(-1531003,'Let your death serve as an example!',                8617,1,0,0,'skeram SAY_SLAY1'),
(-1531004,'Spineless wretches! You will drown in rivers of blood!',8619,1,0,0,'skeram SAY_SLAY2'),
(-1531005,'The screams of the dying will fill the air. A symphony of terror is about to begin!',8620,1,0,0,'skeram SAY_SLAY3'),
(-1531006,'Prepare for the return of the ancient ones!',        8618,1,0,0,'skeram SAY_SPLIT'),
(-1531007,'You only delay... the inevetable.',                  8622,1,0,0,'skeram SAY_DEATH'),

-- Sartura 
(-1531008,'You will be judged for defiling these sacred grounds! The laws of the Ancients will not be challenged! Trespassers will be annihilated!',8646,1,0,0,'sartura SAY_AGGRO'),
(-1531009,'I sentence you to death!',                           8647,1,0,0,'sartura SAY_SLAY'),
(-1531010,'I serve to the last!',                               8648,1,0,0,'sartura SAY_DEATH'),

-- C'thun weakened
(-1531011,'%s is weakened!',                                    0,2,0,0,'cthun EMOTE_WEAKENED'),

-- Twin emperors intro
(-1531012,'The massive floating eyeball in the center of the chamber turns its gaze upon you. You stand before a god.', 0,3,0,0,'eye cthun EMOTE_INTRO'),
(-1531013,'Only flesh and bone. Mortals are such easy prey...', 0,1,0,0,'veklor SAY_INTRO_1'),
(-1531014,'Where are your manners, brother. Let us properly welcome our guests.', 0,1,0,0,'veknilash SAY_INTRO_2'),
(-1531015,'There will be pain...',                              0,1,0,0,'veklor SAY_INTRO_3'),
(-1531016,'Oh so much pain...',                                 0,1,0,0,'veknilash SAY_INTRO_4'),
(-1531017,'Come, little ones.',                                 0,1,0,0,'veklor SAY_INTRO_5'),
(-1531018,'The feast of souls begins now...',                    0,1,0,0,'veknilash SAY_INTRO_6'),

-- Vek'lor yells
(-1531019,'It\'s too late to turn away.', 		                8623,1,0,0,'veklor SAY_AGGRO_1'),
(-1531020,'Prepare to embrace oblivion!', 		                8626,1,0,0,'veklor SAY_AGGRO_2'),
(-1531021,'Like a fly to the web.',         		            8624,1,0,0,'veklor SAY_AGGRO_3'),
(-1531022,'Your brash arrogance!',        		                8628,1,0,0,'veklor SAY_AGGRO_4'),
(-1531023,'You will not escape death!',                         8629,1,0,0,'veklor SAY_SLAY'),
(-1531024,'My brother...NO!',                                   8625,1,0,0,'veklor SAY_DEATH'),
(-1531025,'To decorate our halls!',                             8627,1,0,0,'veklor SAY_SPECIAL'),

-- Vek'nilash yells
(-1531026,'Ah, lambs to the slaughter!',                        8630,1,0,0,'veknilash SAY_AGGRO_1'),
(-1531027,'Let none survive!',                                  8632,1,0,0,'veknilash SAY_AGGRO_2'),
(-1531028,'Join me brother, there is blood to be shed!',        8631,1,0,0,'veknilash SAY_AGGRO_3'),
(-1531029,'Look brother, fresh blood!',                         8633,1,0,0,'veknilash SAY_AGGRO_4'),
(-1531030,'Your fate is sealed!',                               8635,1,0,0,'veknilash SAY_SLAY'),
(-1531031,'Vek\'lor, I feel your pain!',                        8636,1,0,0,'veknilash SAY_DEATH'),
(-1531032,'Shall be your undoing!',                             8634,3,0,0,'veknilash SAY_SPECIAL'),

-- C'thun whispers 
(-1531033,'Death is close...',				                    8580,4,0,0,'cthun SAY_WHISPER_1'),
(-1531034,'You are already dead.',                              8581,4,0,0,'cthun SAY_WHISPER_2'),
(-1531035,'Your courage will fail.',                            8582,4,0,0,'cthun SAY_WHISPER_3'),
(-1531036,'Your friends will abandon you.',                     8583,4,0,0,'cthun SAY_WHISPER_4'),
(-1531037,'You will betray your friends.',                      8584,4,0,0,'cthun SAY_WHISPER_5'),
(-1531038,'You will die.',                                      8585,4,0,0,'cthun SAY_WHISPER_6'),
(-1531039,'You are weak.',                                      8586,4,0,0,'cthun SAY_WHISPER_7'),
(-1531040,'Your heart will explode.',                           8587,4,0,0,'cthun SAY_WHISPER_8'),

-- Viscidus emotes
(-1531041,'%s begins to slow!',                                 0,3,0,0,'viscidus EMOTE_SLOW'),
(-1531042,'%s is freezing up!',                                 0,3,0,0,'viscidus EMOTE_FREEZE'),
(-1531043,'%s is frozen solid!',                                0,3,0,0,'viscidus EMOTE_FROZEN'),
(-1531044,'%s begins to crack!',                                0,3,0,0,'viscidus EMOTE_CRACK'),
(-1531045,'%s looks ready to shatter!',                         0,3,0,0,'viscidus EMOTE_SHATTER'),
(-1531046,'%s explodes!',                                       0,3,0,0,'viscidus EMOTE_EXPLODE');
