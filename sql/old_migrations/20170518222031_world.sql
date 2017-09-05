INSERT INTO `migrations` VALUES ('20170518222031');

-- Anubisath Warder position
UPDATE creature SET position_x=-9007.87 WHERE guid=88063;

-- Anubisath Warrior immunities
UPDATE creature_template SET MechanicImmuneMask=0 WHERE entry=15537;

-- Anubisath Defenders 12h respawn
UPDATE creature SET spawntimesecs=43200 WHERE id=15277;

-- Anubisath Warder EventAI
DELETE FROM creature_ai_scripts WHERE creature_id = 15311;
INSERT INTO creature_ai_scripts (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES
(1531101, 15311, 0, 0, 100, 2, 0, 0, 0, 0, 31, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Warder - Set Random Phase'),
(1531102, 15311, 0, 0, 100, 3, 750, 750, 3000, 3000, 11, 26073, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Warder - Periodic Cast Fire Nova (All Phases)'),
(1531103, 15311, 0, 29, 100, 3, 5000, 5000, 20000, 20000, 11, 26071, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Warder - Entangling Roots (Phase 1)'),
(1531104, 15311, 0, 29, 100, 3, 4000, 4000, 15000, 15000, 11, 26072, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Warder - Dust Cloud (Phase 1)'),
(1531105, 15311, 0, 27, 100, 3, 5000, 5000, 20000, 20000, 11, 26071, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Warder - Entangling Roots (Phase 2)'),
(1531106, 15311, 0, 27, 100, 3, 4000, 4000, 15000, 15000, 11, 26069, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Warder - Silence (Phase 2)'),
(1531107, 15311, 0, 23, 100, 3, 5000, 5000, 20000, 20000, 11, 26070, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Warder - Fear (Phase 3)'),
(1531108, 15311, 0, 23, 100, 3, 4000, 4000, 15000, 15000, 11, 26072, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Warder - Dust Cloud (Phase 3)'),
(1531109, 15311, 0, 15, 100, 3, 5000, 5000, 20000, 20000, 11, 26070, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Warder - Fear (Phase 4)'),
(1531110, 15311, 0, 15, 100, 3, 4000, 4000, 15000, 15000, 11, 26069, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Warder - Silence (Phase 4)');
