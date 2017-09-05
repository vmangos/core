INSERT INTO migrations VALUES ('20170526010757');

UPDATE spell_bonus_data SET direct_bonus=0.325, dot_bonus=0.0733 WHERE entry=8936;
