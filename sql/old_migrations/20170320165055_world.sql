INSERT INTO `migrations` VALUES ('20170320165055');

-- ERROR:Table `mangos_string` contain reserved entry 0, ignored.
DELETE FROM mangos_string WHERE entry=0;
-- ERROR:Page text (Id: 601001) has not existing next page (Id:60002)
UPDATE page_text SET next_page=601002 WHERE entry=601001;
-- ERROR:Page text (Id: 601002) has not existing next page (Id:60003)
UPDATE page_text SET next_page=601003 WHERE entry=601002;
-- ERROR:Page text (Id: 601003) has not existing next page (Id:60004)
UPDATE page_text SET next_page=601004 WHERE entry=601003;
-- ERROR:Table `creature_model_info` has redundant modelid_other_gender model (11226) defined for model id 11226.
UPDATE creature_model_info SET modelid_other_gender=11228 WHERE modelid=11226;
UPDATE creature_model_info SET modelid_other_gender=11226 WHERE modelid=11228;
-- ERROR:Table `creature_model_info` has redundant modelid_other_gender model (15552) defined for model id 15552.
UPDATE creature_model_info SET modelid_other_gender=15551 WHERE modelid=15552;
UPDATE creature_model_info SET modelid_other_gender=15552 WHERE modelid=15551;
-- ERROR:Unknown item (entry=12678) in creature_equip_template.equipentry1 for entry = 12678, forced to 0.
DELETE FROM creature_equip_template WHERE entry=12678;
-- ERROR:Creature (Entry: 364) has nonexistent faction_A template (0)
-- ERROR:Creature (Entry: 364) has nonexistent faction_H template (0)
UPDATE creature_template SET faction_A=7, faction_H=7 WHERE entry=364;
-- ERROR:Creature (Entry: 12207) has wrong movement generator type (3), ignore and set to IDLE.
UPDATE creature_template SET MovementType=1 WHERE entry=12207;
-- ERROR:Creature (Entry: 15777) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15737 WHERE entry=15777;
-- ERROR:Creature (Entry: 15780) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15744 WHERE entry=15780;
-- ERROR:Creature (Entry: 15781) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15745 WHERE entry=15781;
-- ERROR:Creature (Entry: 15782) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15746 WHERE entry=15782;
-- ERROR:Creature (Entry: 15783) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15747 WHERE entry=15783;
-- ERROR:Creature (Entry: 15784) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15748 WHERE entry=15784;
-- ERROR:Creature (Entry: 15785) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15749 WHERE entry=15785;
-- ERROR:Creature (Entry: 15786) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15751 WHERE entry=15786;
-- ERROR:Creature (Entry: 15787) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15752 WHERE entry=15787;
-- ERROR:Creature (Entry: 15788) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15753 WHERE entry=15788;
-- ERROR:Creature (Entry: 15789) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15754 WHERE entry=15789;
-- ERROR:Creature (Entry: 15790) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15755 WHERE entry=15790;
-- ERROR:Creature (Entry: 15791) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15756 WHERE entry=15791;
-- ERROR:Creature (Entry: 15792) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15757 WHERE entry=15792;
-- ERROR:Creature (Entry: 15793) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15759 WHERE entry=15793;
-- ERROR:Creature (Entry: 15794) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15758 WHERE entry=15794;
-- ERROR:Creature (Entry: 15795) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=15750 WHERE entry=15795;
-- ERROR:Creature (Entry: 15838) has nonexistent faction_A template (0)
-- ERROR:Creature (Entry: 15838) has nonexistent faction_H template (0)
UPDATE creature_template SET faction_A=31, faction_H=31 WHERE entry=15838;
-- ERROR:Creature (Entry: 16194) are using modelid_1 (15880), but creature_model_info are missing for this model.
-- ERROR:Creature (Entry: 16215) are using modelid_1 (15880), but creature_model_info are missing for this model.
-- ERROR:Creature (Entry: 16216) are using modelid_1 (15880), but creature_model_info are missing for this model.
INSERT INTO creature_model_info VALUES (15880,1.5,3,2,0,0);
-- ERROR:Creature (Entry: 16509) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=8469 WHERE entry=16509;
-- ERROR:Creature (Entry: 16510) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=14584 WHERE entry=16510;
-- ERROR:Creature (Entry: 16963) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=10905 WHERE entry=16963;
-- ERROR:Creature (Entry: 160016) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=11686 WHERE entry=160016;
-- ERROR:Creature (Entry: 987800) has nonexistent modelid in modelid_1/modelid_2
UPDATE creature_template SET modelid_1=11686 WHERE entry=987800;
-- ERROR:Table `creature` have creature (GUID: 48805 Entry: 10432) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
UPDATE creature SET spawndist=0 WHERE id=10432;
-- ERROR:Table `creature` have creature (GUID: 44332 Entry: 9262) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
UPDATE creature SET spawndist=0 WHERE guid=44332;
-- ERROR:Table `creature` have creature (GUID: 44330 Entry: 9259) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 44333 Entry: 9259) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 44328 Entry: 9259) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 44327 Entry: 9259) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
UPDATE creature SET spawndist=0 WHERE id=9259;
-- ERROR:Table `creature` have creature (GUID: 44310 Entry: 9262) with low current mana (3006), `creature_template`.`minmana`=3362.
UPDATE creature SET curmana=3362 WHERE id=9262;
-- ERROR:Table `creature` have creature (GUID: 44329 Entry: 9261) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
UPDATE creature SET spawndist=0 WHERE guid=44329;
-- ERROR:Table `creature` have creature (GUID: 44331 Entry: 9261) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
UPDATE creature SET spawndist=0 WHERE guid=44331;
-- ERROR:Table `creature` have creature (GUID: 1179144 Entry: 15625) with `creature_template`.`flags_extra` including CREATURE_FLAG_EXTRA_INSTANCE_BIND (1) but creature are not in instance.
UPDATE creature_template SET flags_extra=0 WHERE entry=15625;
-- ERROR:Table `creature` have creature (GUID: 88075 Entry: 15263) with `creature_template`.`RegenHealth`=1 and low current health (467509), `creature_template`.`minhealth`=556509.
UPDATE creature SET curhealth=556509 WHERE id=15263;
-- ERROR:Table `creature` have creature (GUID: 156950 Entry: 12397) with `creature_template`.`flags_extra` including CREATURE_FLAG_EXTRA_INSTANCE_BIND (1) but creature are not in instance.
UPDATE creature_template SET flags_extra=0 WHERE entry=12397;
-- ERROR:Table `creature` have creature (GUID: 112004 Entry: 15740) with `creature_template`.`flags_extra` including CREATURE_FLAG_EXTRA_INSTANCE_BIND (1) but creature are not in instance.
UPDATE creature_template SET flags_extra=0 WHERE entry=15740;
-- ERROR:Table `creature` have creature (GUID: 112005 Entry: 15741) with `creature_template`.`flags_extra` including CREATURE_FLAG_EXTRA_INSTANCE_BIND (1) but creature are not in instance.
UPDATE creature_template SET flags_extra=0 WHERE entry=15741;
-- ERROR:Table `creature` have creature (GUID: 112006 Entry: 15742) with `creature_template`.`flags_extra` including CREATURE_FLAG_EXTRA_INSTANCE_BIND (1) but creature are not in instance.
UPDATE creature_template SET flags_extra=0 WHERE entry=15742;
-- ERROR:Table `creature` have creature (GUID: 1246431 Entry: 2435) with `creature_template`.`RegenHealth`=1 and low current health (50), `creature_template`.`minhealth`=1764.
UPDATE creature SET curhealth=1764 WHERE id=2435;
-- ERROR:Table `creature` have creature (GUID: 660961 Entry: 7846) with `creature_template`.`flags_extra` including CREATURE_FLAG_EXTRA_INSTANCE_BIND (1) but creature are not in instance.
UPDATE creature_template SET flags_extra=0 WHERE entry=7846;
-- ERROR:Table `creature` have creature (GUID: 70044 Entry: 20114) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 70045 Entry: 20114) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 70046 Entry: 20114) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 70047 Entry: 20114) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 70048 Entry: 20114) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 70049 Entry: 20114) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 70050 Entry: 20114) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 70051 Entry: 20114) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 70052 Entry: 20114) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
UPDATE creature SET MovementType=1 WHERE id=20114 && spawndist>0;
-- ERROR:Quest 5128 has `RewChoiceItemId2` = 0 but `RewChoiceItemCount2` = 1.
-- ERROR:Quest 5128 has `RewChoiceItemId1` = 0 but `RewChoiceItemCount1` = 1.
UPDATE quest_template SET RewChoiceItemCount1=0, RewChoiceItemCount2=0 WHERE entry=5128;
-- ERROR:Quest 384 has `ZoneOrSort` = -304 but `RequiredSkill` does not have a corresponding value (185).
UPDATE quest_template SET RequiredSkill=185 WHERE entry=384;
-- ERROR:Quest 3861 has `RewItemId1` = 0 but `RewItemCount1` = 1.
UPDATE quest_template SET RewItemCount1=0 WHERE entry=3861;
-- ERROR:Quest 1249 has `ReqCreatureOrGOId1` = 0 but `ReqCreatureOrGOCount1` = 1.
UPDATE quest_template SET ReqCreatureOrGOCount1=0 WHERE entry=1249;
-- ERROR:Quest 7832 has PrevQuestId 7234, but no such quest
UPDATE quest_template SET PrevQuestId=7824 WHERE entry=7832;
-- ERROR:Quest 7835 has NextQuestId 7324, but no such quest
UPDATE quest_template SET NextQuestId=0 WHERE entry=7835;
-- ERROR:Spell (id: 23659) have SPELL_EFFECT_QUEST_COMPLETE for quest 7872 , but quest does not have SpecialFlags QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT (2) set. Quest SpecialFlags should be corrected to enable this objective.
UPDATE quest_template SET SpecialFlags=2 WHERE entry=7872;
-- ERROR:Spell (id: 23660) have SPELL_EFFECT_QUEST_COMPLETE for quest 7871 , but quest does not have SpecialFlags QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT (2) set. Quest SpecialFlags should be corrected to enable this objective.
UPDATE quest_template SET SpecialFlags=2 WHERE entry=7871;
-- ERROR:Spell (id: 25201) have SPELL_EFFECT_QUEST_COMPLETE for quest 8305 , but quest does not have SpecialFlags QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT (2) set. Quest SpecialFlags should be corrected to enable this objective.
UPDATE quest_template SET SpecialFlags=2 WHERE entry=8305;
-- ERROR:Table `creature_questrelation` has creature entry (10931) for quest 5125, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (10931) for quest 5125, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
UPDATE creature_template SET npcflag=2 WHERE entry=10931;
-- ERROR:Table `creature_questrelation` has creature entry (11625) for quest 5821, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
UPDATE creature_template SET npcflag=2 WHERE entry=11625;
-- ERROR:Table `creature_questrelation` has creature entry (11626) for quest 5943, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
UPDATE creature_template SET npcflag=2 WHERE entry=11626;
-- ERROR:Table `creature_involvedrelation` has creature entry (12126) for quest 5944, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
UPDATE creature_template SET npcflag=2 WHERE entry=12126;
-- ERROR:Table `creature_questrelation` has creature entry (14325) for quest 7703, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (14325) for quest 7703, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
UPDATE creature_template SET npcflag=3 WHERE entry=14325;
-- ERROR:Table `creature_questrelation` has creature entry (14753) for quest 7863, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_questrelation` has creature entry (14753) for quest 7864, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_questrelation` has creature entry (14753) for quest 7865, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (14753) for quest 7863, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (14753) for quest 7864, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (14753) for quest 7865, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
UPDATE creature_template SET npcflag=16390 WHERE entry=14753;
-- ERROR:Table `creature_questrelation` has creature entry (14754) for quest 7866, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_questrelation` has creature entry (14754) for quest 7867, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_questrelation` has creature entry (14754) for quest 7868, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (14754) for quest 7866, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (14754) for quest 7867, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (14754) for quest 7868, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
UPDATE creature_template SET npcflag=16390 WHERE entry=14754;
-- ERROR:Table `creature_questrelation` has creature entry (15077) for quest 8193, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (15077) for quest 8193, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
UPDATE creature_template SET npcflag=2 WHERE entry=15077;
-- ERROR:Table `creature_questrelation` has creature entry (15126) for quest 8263, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_questrelation` has creature entry (15126) for quest 8264, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_questrelation` has creature entry (15126) for quest 8265, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (15126) for quest 8263, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (15126) for quest 8264, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (15126) for quest 8265, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
UPDATE creature_template SET npcflag=16390 WHERE entry=15126;
-- ERROR:Table `creature_questrelation` has creature entry (15127) for quest 8260, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_questrelation` has creature entry (15127) for quest 8261, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_questrelation` has creature entry (15127) for quest 8262, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (15127) for quest 8260, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (15127) for quest 8261, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (15127) for quest 8262, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
UPDATE creature_template SET npcflag=16390 WHERE entry=15127;
-- ERROR:Table `npc_vendor` has `maxcount` (1) for item 4824 of vendor 3180 but `incrtime`=0, ignoring
-- ERROR:Table `npc_vendor` has `maxcount` (1) for item 4824 of vendor 3539 but `incrtime`=0, ignoring
-- ERROR:Table `npc_vendor` has `maxcount` (1) for item 4824 of vendor 4890 but `incrtime`=0, ignoring
UPDATE npc_vendor SET incrtime=7200 WHERE item=4824;
-- ERROR:Table `npc_vendor` has data for creature (Entry: 15909) without vendor flag, ignoring
UPDATE creature_template SET npcflag=7 WHERE entry=15909;
-- ERROR:Table `npc_vendor` has data for creature (Entry: 15864) without vendor flag, ignoring
UPDATE creature_template SET npcflag=7 WHERE entry=15864;
