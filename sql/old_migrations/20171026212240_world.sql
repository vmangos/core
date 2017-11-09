DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171026212240');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171026212240');
-- Add your query below.


-- Make "Spawn Point" invisible to players.
UPDATE `creature_template` SET `flags_extra`=130 WHERE `entry`=2;

-- ERROR:Table 'creature_equip_template_raw` have redundant data for ID 13138 ('creature_equip_template` already have data)
DELETE FROM `creature_equip_template_raw` WHERE `entry`=13138;

-- ERROR:Creature (Entry: 17286) has nonexistent faction_A template (0)
-- ERROR:Creature (Entry: 17286) has nonexistent faction_H template (0)
UPDATE `creature_template` SET `faction_A`=114, `faction_H`=114 WHERE `entry`=17286;

-- ERROR:Table `creature` have creature (GUID: 127982 Entry: 15979) with `creature_template`.`RegenHealth`=1 and low current health (96405), `creature_template`.`minhealth`=140105.
-- ERROR:Table `creature` have creature (GUID: 127981 Entry: 15979) with `creature_template`.`RegenHealth`=1 and low current health (97528), `creature_template`.`minhealth`=140105.
UPDATE `creature` SET `curhealth`=140105 WHERE `guid` IN (127982, 127981);
-- ERROR:Table `creature` have creature (GUID: 1242983 Entry: 16359) with `creature_template`.`RegenHealth`=1 and low current health (8), `creature_template`.`minhealth`=5228.
-- ERROR:Table `creature` have creature (GUID: 1242990 Entry: 16359) with `creature_template`.`RegenHealth`=1 and low current health (8), `creature_template`.`minhealth`=5228.
UPDATE `creature` SET `curhealth`=5228 WHERE `guid` IN (1242983, 1242990);
-- ERROR:Table `creature` have creature (GUID: 2349 Entry: 14682) with `creature_template`.`RegenHealth`=1 and low current health (1), `creature_template`.`minhealth`=4689.
UPDATE `creature` SET `curhealth`=4689 WHERE `guid`=2349;
-- ERROR:Table `creature` have creature (GUID: 2350 Entry: 14693) with `creature_template`.`RegenHealth`=1 and low current health (1), `creature_template`.`minhealth`=8810.
-- ERROR:Table `creature` have creature (GUID: 2350 Entry: 14693) with low current mana (0), `creature_template`.`minmana`=4938.
UPDATE `creature` SET `curhealth`=8810, `curmana`=4938 WHERE `guid`=2350;
-- ERROR:Table `creature` have creature (GUID: 2351 Entry: 14686) with `creature_template`.`RegenHealth`=1 and low current health (1), `creature_template`.`minhealth`=8744.
-- ERROR:Table `creature` have creature (GUID: 2351 Entry: 14686) with low current mana (0), `creature_template`.`minmana`=4568.
UPDATE `creature` SET `curhealth`=8744, `curmana`=4568 WHERE `guid`=2351;
-- ERROR:Table `creature` have creature (GUID: 2352 Entry: 14690) with `creature_template`.`RegenHealth`=1 and low current health (1), `creature_template`.`minhealth`=24420.
-- ERROR:Table `creature` have creature (GUID: 2352 Entry: 14690) with low current mana (0), `creature_template`.`minmana`=4868.
UPDATE `creature` SET `curhealth`=24420, `curmana`=4868 WHERE `guid`=2352;
-- ERROR:Table `creature` have creature (GUID: 2353 Entry: 14695) with `creature_template`.`RegenHealth`=1 and low current health (1), `creature_template`.`minhealth`=30520.
UPDATE `creature` SET `curhealth`=30520 WHERE `guid`=2353;
-- ERROR:Table `creature` have creature (GUID: 2354 Entry: 14684) with `creature_template`.`RegenHealth`=1 and low current health (1), `creature_template`.`minhealth`=14652.
-- ERROR:Table `creature` have creature (GUID: 2354 Entry: 14684) with low current mana (0), `creature_template`.`minmana`=14604.
UPDATE `creature` SET `curhealth`=14652, `curmana`=14604 WHERE `guid`=2354;
-- ERROR:Table `creature` have creature (Entry: 16285) with equipment_id 16285 not found in table `creature_equip_template` or `creature_equip_template_raw`, set to no equipment.
UPDATE `creature_template` SET `equipment_id`=16285 WHERE `entry`=16285;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (16285, 5305, 12980, 0);
-- ERROR:Table `creature` have creature (Entry: 16786) with equipment_id 16786 not found in table `creature_equip_template` or `creature_equip_template_raw`, set to no equipment.
UPDATE `creature` SET `equipment_id`=0 WHERE `id`=16786;
-- ERROR:Table `creature` have creature (Entry: 16511) with equipment_id 16511 not found in table `creature_equip_template` or `creature_equip_template_raw`, set to no equipment.
-- ERROR:Table `creature` have creature (GUID: 12413 Entry: 16511) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
UPDATE `creature` SET `equipment_id`=0, `spawndist`=0 WHERE `id`=16511;
-- ERROR:Table `creature` have creature (Entry: 16508) with equipment_id 16508 not found in table `creature_equip_template` or `creature_equip_template_raw`, set to no equipment.
-- ERROR:Table `creature` have creature (GUID: 12589 Entry: 16508) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
UPDATE `creature` SET `equipment_id`=0, `spawndist`=0 WHERE `id`=16508;
-- ERROR:Table `creature` have creature (Entry: 16787) with equipment_id 16787 not found in table `creature_equip_template` or `creature_equip_template_raw`, set to no equipment.
-- ERROR:Table `creature` have creature (GUID: 12590 Entry: 16787) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
UPDATE `creature` SET `equipment_id`=0, `spawndist`=0 WHERE `id`=16787;
-- ERROR:Table `creature` have creature (GUID: 12591 Entry: 16359) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 12592 Entry: 16255) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 12593 Entry: 16384) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
UPDATE `creature` SET `spawndist`=0 WHERE `guid` iN (12591, 12592, 12593);

-- ERROR:`creature_linking` has a slave and master on different maps (guid: 127981, master_guid: 15952), skipped
-- ERROR:`creature_linking` has a slave and master on different maps (guid: 2530324, master_guid: 15952), skipped
-- ERROR:`creature_linking` has a slave and master on different maps (guid: 2530325, master_guid: 15952), skipped
-- ERROR:`creature_linking` has a slave and master on different maps (guid: 2530326, master_guid: 15952), skipped
-- ERROR:`creature_linking` has a slave and master on different maps (guid: 2530327, master_guid: 15952), skipped
-- ERROR:`creature_linking` has a slave and master on different maps (guid: 127982, master_guid: 15952), skipped
-- ERROR:`creature_linking` has a slave and master on different maps (guid: 2530328, master_guid: 15952), skipped
-- ERROR:`creature_linking` has a slave and master on different maps (guid: 2530329, master_guid: 15952), skipped
-- ERROR:`creature_linking` has a slave and master on different maps (guid: 2530330, master_guid: 15952), skipped
-- ERROR:`creature_linking` has a slave and master on different maps (guid: 88623, master_guid: 15952), skipped
UPDATE `creature_linking` SET `master_guid`=88483 WHERE `master_guid`=15952;

-- ERROR:Spell (ID:72617) listed in `spell_target_position` does not exist.
-- ERROR:Spell (ID:72613) listed in `spell_target_position` does not exist.
DELETE FROM `spell_target_position` WHERE `ID` IN (72613, 72617);

-- ERROR:Table `npc_vendor` has data for creature (Entry: 15309) without vendor flag, ignoring
DELETE FROM `npc_vendor` WHERE `entry`=15309;

-- ERROR:Table creature_movement has waypoint for creature guid 88192 (entry 16034), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- ERROR:Table creature_movement has waypoint for creature guid 88194 (entry 16034), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id` IN (88192, 88194);

-- ERROR:Table `creature_movement_scripts` contain unused script, id 2.
-- ERROR:Table `creature_movement_scripts` contain unused script, id 3.
DELETE FROM `creature_movement_scripts` WHERE `id` IN (2, 3);

-- ERROR:CreatureEventAI:  Creature 15978 are using percentage event(1597802) with param1 <= param2 (MaxPercent <= MinPercent). Event will never trigger! 
UPDATE `creature_ai_scripts` SET `event_param2`=45 WHERE `id`=1597802;

-- Fix texts for chicken escort quests.
REPLACE INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1000287, 'Emergency power activated!  Initializing ambulatory motor!  CLUCK!', '비상 동력 가동 완료! 이동식 발동기 초기화 중! 꼬꼬댁!', 'Énergie de réserve activée ! Initialisation du moteur ambulatoire ! CLIC !', 'Notfallenergie aktiviert! Ambulatorenantrieb wird gestartet! GLUCK!', '备用动力启动！启动流动电机！咯咯嗒！', '備用動力啟動!啟動流動電機!咯咯嗒!', '¡Alimentación de emergencia activada! ¡Inicializando motor ambulatorio! ¡CLUC!', '¡Alimentación de emergencia activada! ¡Inicializando motor ambulatorio! ¡CLUC!', 'Запуск аварийного генератора! Инициализация временного мотора! ЩЕЛК!', 0, 0, 0, 0, 'oox SAY_OOX_START');
REPLACE INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1000288, 'Physical threat detected!  Evasive action!  CLUCK!', '물리적 위험 감지! 경로 이동 실시! 꼬꼬댁!', 'Menace physique détectée ! Mesure d\'évasion ! CLIC !', 'Körperliche Bedrohung entdeckt! Ausweichmanöver! GLUCK!', '侦测到威胁！实施躲避动作！咯咯嗒！', '偵測到威脅!執行閃避動作!咯咯嗒!', '¡Amenaza física detectada! ¡Acción evasiva! ¡CLUC!', '¡Amenaza física detectada! ¡Acción evasiva! ¡CLUC!', 'Обнаружена физическая угроза! Начать маневр уклонения! ЩЕЛК!', 0, 0, 0, 0, 'oox SAY_OOX_AGGRO1');
REPLACE INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1000289, 'Threat analyzed!  Activating combat plan beta!  CLUCK!', '위험 분석 완료! 전투 계획 베타 시동 중! 꼬꼬댁!', 'Menace analysée ! Activation du plan de combat bêta ! CLIC !', 'Bedrohung analysiert! Gefechtsplan Beta wird aktiviert! GLUCK!', '威胁分析！启动二号战斗计划！咯咯嗒！', '威脅分析!啟動戰鬥計畫B!咯咯嗒!', '¡Amenaza analizada! ¡Activando plan beta de combate! ¡CLUC!', '¡Amenaza analizada! ¡Activando plan beta de combate! ¡CLUC!', 'Анализ угрозы! Перехожу к боевому плану "Бета"! ЩЕЛК!', 0, 0, 0, 0, 'oox SAY_OOX_AGGRO2');
REPLACE INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1000290, 'CLUCK!  Sensors detect spatial anomaly -- danger imminent!  CLUCK!', '꼬꼬댁! 공간 형태 이상 감지 -- 위험 임박! 꼬꼬댁!', 'CLIC ! Les détecteurs enregistrent une anomalie spatiale : danger imminent ! CLIC !', 'GLUCK! Sensoren haben räumliche Anomalie entdeckt - Gefahr im Verzug! GLUCK!', '咯咯嗒！探测到空间异常——危险临近！咯咯嗒！', '咯咯嗒!探測到空間異常─危險臨近!咯咯嗒!', '¡CLUC! ¡Los sensores detectan una anomalía espacial - peligro inminente! ¡CLUC!', '¡CLUC! ¡Los sensores detectan una anomalía espacial - peligro inminente! ¡CLUC!', 'ЩЕЛК! Сенсоры обнаружили пространственную аномалию. Опасность неизбежна! ЩЕЛК!', 0, 0, 0, 0, 'oox SAY_OOX_AMBUSH');
REPLACE INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1000291, 'No one challenges the Wastewander nomads -- not even robotic chickens!  ATTACK!', '그 누구도 사막유랑단 유목민에게 덤비지 못해. 제아무리 날고 기는 닭 로봇이라 해도 말이야! 공격!', 'Personne ne défie les nomades Bat-le-désert, pas même les robots poulets ! À L\'ATTAQUE !', 'Niemand fordert die Wüstenläufernomaden heraus - auch keine Robothühner! ANGRIFF!', '没人敢挑战废土强盗团——机械小鸡也不行！进攻！', '沒人敢挑戰廢土強盜團─機械小雞也不行!進攻!', '¡Nadie osa desafiar a los nómadas Vagayermos! ¡Ni siquiera unos pollos robotizados! ¡ATACAD!', '¡Nadie osa desafiar a los nómadas Vagayermos! ¡Ni siquiera unos pollos robotizados! ¡ATACAD!', 'Никто не смеет угрожать кочевникам из Скитальцев Пустыни – даже роботизированные трусы! В АТАКУ!', 0, 0, 0, 0, 'oox SAY_OOX17_AMBUSH_REPLY');
REPLACE INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1000292, 'Flight systems online!  CLUCK!  Engaging rockets for transport to Booty Bay!', '비행 시스템 가동! 꼬꼬댁! 무법항으로 이동을 위해 로켓 가동 중!', 'Systèmes de vol connectés ! CLIC ! Lancement des fusées pour transport vers Baie-du-Butin !', 'Flugsysteme online! GLUCK! Raketen für Transport nach Beutebucht werden aktiviert.', '飞行系统启动！咯咯嗒！发动火箭并准备传送到藏宝海湾！', '飛行系統啟動!咯咯嗒!火箭運作中，準備傳送至藏寶海灣!', '¡Sistemas de vuelo en línea! ¡CLUC! ¡Activando cohetes para transporte a Bahía del Botín!', '¡Sistemas de vuelo en línea! ¡CLUC! ¡Activando cohetes para transporte a Bahía del Botín!', 'Активация системы полета! ЩЕЛК! Готовимся к отправке в Пиратскую Бухту!', 0, 0, 0, 0, 'oox SAY_OOX_END');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
