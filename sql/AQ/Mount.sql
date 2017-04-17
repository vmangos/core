# Black Qiraji mount fixes
DELETE FROM spell_mod WHERE Id = 25863;
UPDATE item_template SET spellid_1 = 26656 WHERE entry = 21176;
UPDATE item_template SET spellcooldown_1 =1 WHERE entry = 21176;