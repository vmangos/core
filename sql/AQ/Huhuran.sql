-- Change damage of Huhuran Wyvern Sting casted on dispelled Wyvern Sting
DELETE FROM spell_mod WHERE Id = 26233;
INSERT INTO spell_effect_mod (Id, EffectBasePoints, Comment) VALUES (26233, 3000, "Huhuran wyvern sting should do 3-4k damage on dispelled");
