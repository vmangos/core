DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='202509170000');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('202509170000');
-- Add your query below.

-- Source: mod-playerbots-wotlk/data/sql/playerbots/updates/2025_09_17_00_paladin_buff_reagent_texts.sql
SET SESSION sql_mode=(SELECT REPLACE(@@SESSION.sql_mode,'NO_BACKSLASH_ESCAPES',''));

DELETE FROM ai_playerbot_texts
WHERE name IN (
  'rp_missing_reagent_greater_blessing',
  'rp_missing_reagent_gift_of_the_wild',
  'rp_missing_reagent_arcane_brilliance',
  'rp_missing_reagent_generic'
);

DELETE FROM ai_playerbot_texts_chance
WHERE name IN (
  'rp_missing_reagent_greater_blessing',
  'rp_missing_reagent_gift_of_the_wild',
  'rp_missing_reagent_arcane_brilliance',
  'rp_missing_reagent_generic'
);

INSERT INTO ai_playerbot_texts (name, text, say_type, reply_type, text_loc1, text_loc2, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES
  ('rp_missing_reagent_greater_blessing',
    'By the Light... I forgot my Symbols of Kings. We’ll make do with %base_spell!', 0, 0,
    '', 'Par la Lumière... J''ai oublié mes Symboles du roi. On se contentera de %base_spell !', '', '', '', '', '', ''),
  ('rp_missing_reagent_gift_of_the_wild',
    'Nature is generous, my bags are not... out of herbs for %group_spell. Take %base_spell for now!', 0, 0,
    '', 'La nature est généreuse, pas mes sacs... plus d''herbes pour %group_spell. Prenez %base_spell pour l''instant !', '', '', '', '', '', ''),
  ('rp_missing_reagent_arcane_brilliance',
    'Out of Arcane Powder... %group_spell will have to wait. Casting %base_spell!', 0, 0,
    '', 'Plus de poudre des arcanes... %group_spell attendra. Je lance %base_spell !', '', '', '', '', '', ''),
  ('rp_missing_reagent_generic',
    'Oops, I’m out of components for %group_spell. We’ll go with %base_spell!', 0, 0,
    '', 'Oups, je n''ai plus de composants pour %group_spell. On fera avec %base_spell !', '', '', '', '', '', '');

INSERT INTO ai_playerbot_texts_chance (name, probability) VALUES
  ('rp_missing_reagent_greater_blessing', 100),
  ('rp_missing_reagent_gift_of_the_wild', 100),
  ('rp_missing_reagent_arcane_brilliance', 100),
  ('rp_missing_reagent_generic', 100);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
