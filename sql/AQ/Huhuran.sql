-- Change damage of Huhuran Wyvern Sting casted on dispelled Wyvern Sting
DELETE FROM spell_effect_mod WHERE Id = 26233;
INSERT INTO spell_effect_mod (Id, EffectBasePoints, Comment) VALUES (26233, 3000, "Huhuran wyvern sting should do 3-4k damage on dispelled");

-- add flag SPELL_ATTR_EX4_IGNORE_RESISTANCES to Huhuran acid spit
DELETE FROM spell_mod WHERE Id = 26050;
INSERT INTO spell_mod (Id, AttributesEx4, Comment) VALUES (26050, 1, "Huhuran acid spit ignore resistances");
