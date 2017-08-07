INSERT INTO migrations VALUES ('20170523212555');

DELETE FROM spell_chain WHERE first_spell = 17794;
INSERT INTO spell_chain (spell_id, prev_spell, first_spell, rank) VALUES 
(17794, 0, 17794, 1),
(17798, 17794, 17794, 2),
(17797, 17798, 17794, 3),
(17799, 17797, 17794, 4),
(17800, 17799, 17794, 5);

DELETE FROM spell_group WHERE group_id = 1073;
INSERT INTO spell_group (group_id, group_spell_id, spell_id) VALUES 
(1073, 0, 17794),
(1073, 1, 17798),
(1073, 2, 17797),
(1073, 3, 17799),
(1073, 4, 17800);

DELETE FROM spell_group_stack_rules WHERE group_id = 1073;
INSERT INTO spell_group_stack_rules (group_id,stack_rule) VALUES (1073,3);
