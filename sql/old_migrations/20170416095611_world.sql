INSERT INTO `migrations` VALUES ('20170416095611');

-- Update Meredith's menu option
UPDATE `gossip_menu_option` SET `option_text` = 'A kiss!', `condition_id` = 57 WHERE `menu_id` = 15526;

-- Make Narain cry when completing "Love Song for Narain"
UPDATE `quest_template` SET `OfferRewardEmote1` = 18, `OfferRewardEmoteDelay1` = 1500 WHERE `entry` = 8599;

-- Make "The Only Perscription" obtainable at neutral rep
UPDATE `quest_template` SET `RequiredMinRepValue` = 0 WHERE `entry` = 8620;

-- Make "The Good News and the Bad News" obtainable at neutral rep
UPDATE `quest_template` SET `RequiredMinRepValue` = 0 WHERE `entry` = 8728;

-- Make "Number Two" immune to most mechanics
UPDATE `creature_template` SET `MechanicImmuneMask` = (1 | 2 | 4 | 16 | 32 | 64 | 128 | 256 | 512 | 1024 | 2048 | 8192 | 65536 | 8388608)
WHERE `entry` = 15554;

-- Add Narain's Letter
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(667,   'Champion,\r\n\r\nThe Blue Dragonflight believes that you are fated for greater things than even I could predict.\r\n\r\nDespite what some would have you believe, our world needs heroes. In your darkest hour, when you face the blight of Kalimdor, recall the epic journies, trials, and tribulations that you undertook for an old gnome and let those memories lift your spirits.\r\n\r\nHumbly,\r\n\r\nNarain Soothfancy\r\n\r\nP.S. Sorry about the repair costs.', NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL);

-- Add condition "Love Song for Narain" done
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(57,    8,  8599,   0);


