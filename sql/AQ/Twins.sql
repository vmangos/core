-- Twins intro texts
DELETE FROM script_texts WHERE entry BETWEEN -1531018 AND -1531012;
INSERT INTO script_texts (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, type, language, emote, comment) VALUES
(-1531018, "The feast of souls begin now...", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, "veknilash SAY_INTRO_6"),
(-1531017, "Come, little ones.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, "veklor SAY_INTRO_5"),
(-1531016, "Oh so much pain...", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, "veknilash SAY_INTRO_4"),
(-1531015, "There will be pain...", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, "veklor SAY_INTRO_3"),
(-1531014, "Where are your manners, brother. Let us properly welcome our guests.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, "veknilash SAY_INTRO_2"),
(-1531013, "Only flesh and bone. Mortals are such easy prey...", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, "veklor SAY_INTRO_1"),
(-1531012, "The massive floating eyeball in the center of the chamber turns its gaze upon you. You stand before a god.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, "eye cthun EMOTE_INTRO");
