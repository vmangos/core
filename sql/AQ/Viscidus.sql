-- cmangos unit flags Viscidus trigger TOD : search flags name
UPDATE creature_template SET unit_flags = unit_flags | 33587968 WHERE entry = 15922;

-- Viscidus trigger aren't targettable and can't fight players
UPDATE creature_template SET unit_flags = unit_flags | (33554432 + 512), AIName = "NullAI" WHERE entry = 15922;

-- Viscidus texts from cmangos
DELETE FROM script_texts WHERE entry BETWEEN -1531046 AND -1531041;
INSERT INTO script_texts (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, type, language, emote, comment) VALUES
(-1531046, "%s explodes!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, "viscidus EMOTE_EXPLODE"),
(-1531045, "%s looks ready to shatter!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, "viscidus EMOTE_SHATTER"),
(-1531044, "%s begins to crack!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, "viscidus EMOTE_CRACK"),
(-1531043, "%s is frozen solid!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, "viscidus EMOTE_FROZEN"),
(-1531042, "%s is freezing up!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, "viscidus EMOTE_FREEZE"),
(-1531041, "%s begins to slow!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, "viscidus EMOTE_SLOW");
