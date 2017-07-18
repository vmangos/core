-- Razuvious should follow waypoints
UPDATE creature SET MovementType = 2 WHERE id = 16061;

-- Razuvious adds
DELETE FROM creature_template_addon WHERE entry = 16803;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras)
VALUE (16803, 0, 0, 0, 0, 333, 0, 18950);
UPDATE creature_template SET spell1 = 29060 WHERE entry = 16803;
