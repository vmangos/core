DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='202509280000');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('202509280000');
-- Add your query below.

-- Source: mod-playerbots-wotlk/data/sql/playerbots/updates/2025_09_28_00_netherspite_beam_blocker_texts.sql
SET SESSION sql_mode=(SELECT REPLACE(@@SESSION.sql_mode,'NO_BACKSLASH_ESCAPES',''));

DELETE FROM ai_playerbot_texts WHERE name IN (
  'netherspite_beam_blocking_red',
  'netherspite_beam_blocking_blue',
  'netherspite_beam_blocking_green',
  'netherspite_beam_leaving_blue',
  'netherspite_beam_leaving_green'
);

DELETE FROM ai_playerbot_texts_chance WHERE name IN (
  'netherspite_beam_blocking_red',
  'netherspite_beam_blocking_blue',
  'netherspite_beam_blocking_green',
  'netherspite_beam_leaving_blue',
  'netherspite_beam_leaving_green'
);

INSERT INTO ai_playerbot_texts (name, text, say_type, reply_type, text_loc1, text_loc2, text_loc3, text_loc4, text_loc5, text_loc6, text_loc7, text_loc8) VALUES
  ('netherspite_beam_blocking_red',   '%player is moving to block the red beam!',   0, 0, '', '', '', '', '', '', '', ''),
  ('netherspite_beam_blocking_blue',  '%player is moving to block the blue beam!',  0, 0, '', '', '', '', '', '', '', ''),
  ('netherspite_beam_blocking_green', '%player is moving to block the green beam!', 0, 0, '', '', '', '', '', '', '', ''),
  ('netherspite_beam_leaving_blue',   '%player is leaving the blue beam--next blocker up!', 0, 0, '', '', '', '', '', '', '', ''),
  ('netherspite_beam_leaving_green',  '%player is leaving the green beam--next blocker up!', 0, 0, '', '', '', '', '', '', '', '');

INSERT INTO ai_playerbot_texts_chance (name, probability) VALUES
  ('netherspite_beam_blocking_red',   100),
  ('netherspite_beam_blocking_blue',  100),
  ('netherspite_beam_blocking_green', 100),
  ('netherspite_beam_leaving_blue',   100),
  ('netherspite_beam_leaving_green',  100);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
