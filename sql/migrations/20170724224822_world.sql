INSERT INTO `migrations` VALUES ('20170724224822');

-- Fixes typos in Gilthares escort
UPDATE `script_texts` SET

`content_default` = replace('Now I feel better. Let''s get back to Ratchet. Come
on, $n.', '\n', ' ')

WHERE `entry` = -1000372;


UPDATE `script_texts` SET

`content_default` = replace('Looks like the Southsea Freebooters are heavily
entrenched on the coast. This could get rough.', '\n', ' ')

WHERE `entry` = -1000373;


UPDATE `script_texts` SET

`content_default` = replace('Captain Brightsun, $N here has freed me! $N, I am
certain the Captain will reward your bravery.', '\n', ' ')

WHERE `entry` = -1000380;
