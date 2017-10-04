INSERT INTO `migrations` VALUES ('20170801184338'); 

-- ERROR:Item #20310 also starts quest #1480.
UPDATE `item_template` SET `startquest`=0 WHERE `entry`=6766;

-- ERROR:Table `creature` have creature (GUID: 2530181 Entry: 99995) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530180 Entry: 99994) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530168 Entry: 11564) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530169 Entry: 11564) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530170 Entry: 11564) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530175 Entry: 11564) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530174 Entry: 11564) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530173 Entry: 11564) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530176 Entry: 11564) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530166 Entry: 11564) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530178 Entry: 11564) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530179 Entry: 11564) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530143 Entry: 5569) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530186 Entry: 99999) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530185 Entry: 99998) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530183 Entry: 99997) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
-- ERROR:Table `creature` have creature (GUID: 2530182 Entry: 99996) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.
UPDATE `creature` SET `spawndist`=0 WHERE `guid` IN (2530181, 2530180, 2530168, 2530169, 2530170, 2530175, 2530174, 2530173, 2530176, 2530166, 2530178, 2530179, 2530143, 2530186, 2530185, 2530183, 2530182);
-- ERROR:Table `creature` have creature (GUID: 18614 Entry: 15552) with `creature_template`.`RegenHealth`=1 and low current health (320000), `creature_template`.`minhealth`=1000000.
UPDATE `creature` SET `curhealth`=1000000 WHERE `guid`=18614;
-- ERROR:Table `creature` have creature (GUID: 1179144 Entry: 15625) with `creature_template`.`RegenHealth`=1 and low current health (832750), `creature_template`.`minhealth`=1000616.
UPDATE `creature` SET `curhealth`=1000616 WHERE `guid`=1179144;
-- ERROR:Table `creature` have creature (GUID: 112004 Entry: 15740) with `creature_template`.`RegenHealth`=1 and low current health (2453550), `creature_template`.`minhealth`=3353550.
-- ERROR:Table `creature` have creature (GUID: 112005 Entry: 15741) with `creature_template`.`RegenHealth`=1 and low current health (2453550), `creature_template`.`minhealth`=3353550.
-- ERROR:Table `creature` have creature (GUID: 112006 Entry: 15742) with `creature_template`.`RegenHealth`=1 and low current health (2453550), `creature_template`.`minhealth`=3353550.
UPDATE `creature` SET `curhealth`=3353550 WHERE `guid` IN (112004, 112005, 112006);
-- ERROR:Table `creature` have creature (GUID: 112100 Entry: 15817) with `creature_template`.`RegenHealth`=1 and low current health (106800), `creature_template`.`minhealth`=144800.
-- ERROR:Table `creature` have creature (GUID: 112200 Entry: 15817) with `creature_template`.`RegenHealth`=1 and low current health (106800), `creature_template`.`minhealth`=144800.
-- ERROR:Table `creature` have creature (GUID: 112300 Entry: 15817) with `creature_template`.`RegenHealth`=1 and low current health (106800), `creature_template`.`minhealth`=144800.
-- ERROR:Table `creature` have creature (GUID: 112400 Entry: 15817) with `creature_template`.`RegenHealth`=1 and low current health (106800), `creature_template`.`minhealth`=144800.
-- ERROR:Table `creature` have creature (GUID: 112940 Entry: 15817) with `creature_template`.`RegenHealth`=1 and low current health (106800), `creature_template`.`minhealth`=144800.
-- ERROR:Table `creature` have creature (GUID: 112960 Entry: 15817) with `creature_template`.`RegenHealth`=1 and low current health (106800), `creature_template`.`minhealth`=144800.
UPDATE `creature` SET `curhealth`=144800 WHERE `guid` IN (112100, 112200, 112300, 112400, 112940, 112960);
-- ERROR:Table `creature` have creature (GUID: 112101 Entry: 15753) with `creature_template`.`RegenHealth`=1 and low current health (48000), `creature_template`.`minhealth`=64800.
-- ERROR:Table `creature` have creature (GUID: 112201 Entry: 15753) with `creature_template`.`RegenHealth`=1 and low current health (48000), `creature_template`.`minhealth`=64800.
-- ERROR:Table `creature` have creature (GUID: 112301 Entry: 15753) with `creature_template`.`RegenHealth`=1 and low current health (48000), `creature_template`.`minhealth`=64800.
-- ERROR:Table `creature` have creature (GUID: 112401 Entry: 15753) with `creature_template`.`RegenHealth`=1 and low current health (48000), `creature_template`.`minhealth`=64800.
-- ERROR:Table `creature` have creature (GUID: 112941 Entry: 15753) with `creature_template`.`RegenHealth`=1 and low current health (48000), `creature_template`.`minhealth`=64800.
-- ERROR:Table `creature` have creature (GUID: 112961 Entry: 15753) with `creature_template`.`RegenHealth`=1 and low current health (48000), `creature_template`.`minhealth`=64800.
UPDATE `creature` SET `curhealth`=64800 WHERE `guid` IN (112101, 112201, 112301, 112401, 112941, 112961);
-- ERROR:Table `creature` have creature (GUID: 112102 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112103 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112104 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112105 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112106 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112107 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112108 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112109 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112110 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112111 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112112 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112113 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112202 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112203 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112204 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112205 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112206 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112207 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112208 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112209 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112210 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112211 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112212 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112213 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112302 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112303 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112304 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112305 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112306 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112307 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112308 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112309 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112310 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112311 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112312 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112313 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112402 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112403 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112404 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112405 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112406 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112407 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112408 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112409 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112410 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112411 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112412 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112413 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112942 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112943 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112944 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112945 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112946 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112947 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112948 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112949 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112950 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112951 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112952 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112953 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112962 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112963 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112964 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112965 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112966 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8000), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112967 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112968 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112969 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112970 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112971 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8333), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112972 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (8666), `creature_template`.`minhealth`=10800.
-- ERROR:Table `creature` have creature (GUID: 112973 Entry: 15756) with `creature_template`.`RegenHealth`=1 and low current health (9000), `creature_template`.`minhealth`=10800.
UPDATE `creature` SET `curhealth`=10800 WHERE `id`=15756;
-- ERROR:Table `creature` have creature (GUID: 112114 Entry: 15754) with `creature_template`.`RegenHealth`=1 and low current health (29610), `creature_template`.`minhealth`=38810.
-- ERROR:Table `creature` have creature (GUID: 112115 Entry: 15754) with `creature_template`.`RegenHealth`=1 and low current health (28710), `creature_template`.`minhealth`=38810.
-- ERROR:Table `creature` have creature (GUID: 112214 Entry: 15754) with `creature_template`.`RegenHealth`=1 and low current health (29610), `creature_template`.`minhealth`=38810.
-- ERROR:Table `creature` have creature (GUID: 112215 Entry: 15754) with `creature_template`.`RegenHealth`=1 and low current health (29610), `creature_template`.`minhealth`=38810.
-- ERROR:Table `creature` have creature (GUID: 112314 Entry: 15754) with `creature_template`.`RegenHealth`=1 and low current health (29610), `creature_template`.`minhealth`=38810.
-- ERROR:Table `creature` have creature (GUID: 112315 Entry: 15754) with `creature_template`.`RegenHealth`=1 and low current health (29610), `creature_template`.`minhealth`=38810.
-- ERROR:Table `creature` have creature (GUID: 112414 Entry: 15754) with `creature_template`.`RegenHealth`=1 and low current health (28710), `creature_template`.`minhealth`=38810.
-- ERROR:Table `creature` have creature (GUID: 112415 Entry: 15754) with `creature_template`.`RegenHealth`=1 and low current health (29610), `creature_template`.`minhealth`=38810.
-- ERROR:Table `creature` have creature (GUID: 112954 Entry: 15754) with `creature_template`.`RegenHealth`=1 and low current health (28710), `creature_template`.`minhealth`=38810.
-- ERROR:Table `creature` have creature (GUID: 112955 Entry: 15754) with `creature_template`.`RegenHealth`=1 and low current health (29610), `creature_template`.`minhealth`=38810.
-- ERROR:Table `creature` have creature (GUID: 112974 Entry: 15754) with `creature_template`.`RegenHealth`=1 and low current health (28710), `creature_template`.`minhealth`=38810.
-- ERROR:Table `creature` have creature (GUID: 112975 Entry: 15754) with `creature_template`.`RegenHealth`=1 and low current health (29610), `creature_template`.`minhealth`=38810.
UPDATE `creature` SET `curhealth`=38810 WHERE `id`=15754;
-- ERROR:Table `creature` have creature (GUID: 112500 Entry: 15816) with `creature_template`.`RegenHealth`=1 and low current health (22150), `creature_template`.`minhealth`=30000.
UPDATE `creature` SET `curhealth`=30000 WHERE `guid`=112500;
-- ERROR:Table `creature` have creature (GUID: 112501 Entry: 15750) with `creature_template`.`RegenHealth`=1 and low current health (20620), `creature_template`.`minhealth`=27820.
UPDATE `creature` SET `curhealth`=27820 WHERE `guid`=112501;
-- ERROR:Table `creature` have creature (GUID: 112502 Entry: 15752) with `creature_template`.`RegenHealth`=1 and low current health (3564), `creature_template`.`minhealth`=4114.
-- ERROR:Table `creature` have creature (GUID: 112503 Entry: 15752) with `creature_template`.`RegenHealth`=1 and low current health (3048), `creature_template`.`minhealth`=4114.
-- ERROR:Table `creature` have creature (GUID: 112504 Entry: 15752) with `creature_template`.`RegenHealth`=1 and low current health (3564), `creature_template`.`minhealth`=4114.
-- ERROR:Table `creature` have creature (GUID: 112505 Entry: 15752) with `creature_template`.`RegenHealth`=1 and low current health (3306), `creature_template`.`minhealth`=4114.
-- ERROR:Table `creature` have creature (GUID: 112506 Entry: 15752) with `creature_template`.`RegenHealth`=1 and low current health (3177), `creature_template`.`minhealth`=4114.
-- ERROR:Table `creature` have creature (GUID: 112507 Entry: 15752) with `creature_template`.`RegenHealth`=1 and low current health (3306), `creature_template`.`minhealth`=4114.
-- ERROR:Table `creature` have creature (GUID: 112508 Entry: 15752) with `creature_template`.`RegenHealth`=1 and low current health (3048), `creature_template`.`minhealth`=4114.
-- ERROR:Table `creature` have creature (GUID: 112509 Entry: 15752) with `creature_template`.`RegenHealth`=1 and low current health (3048), `creature_template`.`minhealth`=4114.
-- ERROR:Table `creature` have creature (GUID: 112510 Entry: 15752) with `creature_template`.`RegenHealth`=1 and low current health (3435), `creature_template`.`minhealth`=4114.
-- ERROR:Table `creature` have creature (GUID: 112511 Entry: 15752) with `creature_template`.`RegenHealth`=1 and low current health (3435), `creature_template`.`minhealth`=4114.
-- ERROR:Table `creature` have creature (GUID: 112512 Entry: 15752) with `creature_template`.`RegenHealth`=1 and low current health (3564), `creature_template`.`minhealth`=4114.
-- ERROR:Table `creature` have creature (GUID: 112513 Entry: 15752) with `creature_template`.`RegenHealth`=1 and low current health (3564), `creature_template`.`minhealth`=4114.
UPDATE `creature` SET `curhealth`=4114 WHERE `id`=15752;
-- ERROR:Table `creature` have creature (GUID: 112514 Entry: 15751) with `creature_template`.`RegenHealth`=1 and low current health (14256), `creature_template`.`minhealth`=18528.
-- ERROR:Table `creature` have creature (GUID: 112515 Entry: 15751) with `creature_template`.`RegenHealth`=1 and low current health (13728), `creature_template`.`minhealth`=18528.
UPDATE `creature` SET `curhealth`=18528 WHERE `id`=15751;
-- ERROR:Table `creature` have creature (GUID: 112600 Entry: 15815) with `creature_template`.`RegenHealth`=1 and low current health (15240), `creature_template`.`minhealth`=20574.
UPDATE `creature` SET `curhealth`=20574 WHERE `guid`=112600;
-- ERROR:Table `creature` have creature (GUID: 112601 Entry: 15747) with `creature_template`.`RegenHealth`=1 and low current health (12200), `creature_template`.`minhealth`=16500.
UPDATE `creature` SET `curhealth`=16500 WHERE `guid`=112601;
-- ERROR:Table `creature` have creature (GUID: 112602 Entry: 15749) with `creature_template`.`RegenHealth`=1 and low current health (981), `creature_template`.`minhealth`=1260.
-- ERROR:Table `creature` have creature (GUID: 112603 Entry: 15749) with `creature_template`.`RegenHealth`=1 and low current health (981), `creature_template`.`minhealth`=1260.
-- ERROR:Table `creature` have creature (GUID: 112604 Entry: 15749) with `creature_template`.`RegenHealth`=1 and low current health (981), `creature_template`.`minhealth`=1260.
-- ERROR:Table `creature` have creature (GUID: 112605 Entry: 15749) with `creature_template`.`RegenHealth`=1 and low current health (1096), `creature_template`.`minhealth`=1260.
-- ERROR:Table `creature` have creature (GUID: 112606 Entry: 15749) with `creature_template`.`RegenHealth`=1 and low current health (1096), `creature_template`.`minhealth`=1260.
-- ERROR:Table `creature` have creature (GUID: 112607 Entry: 15749) with `creature_template`.`RegenHealth`=1 and low current health (1096), `creature_template`.`minhealth`=1260.
-- ERROR:Table `creature` have creature (GUID: 112608 Entry: 15749) with `creature_template`.`RegenHealth`=1 and low current health (1096), `creature_template`.`minhealth`=1260.
-- ERROR:Table `creature` have creature (GUID: 112609 Entry: 15749) with `creature_template`.`RegenHealth`=1 and low current health (1096), `creature_template`.`minhealth`=1260.
-- ERROR:Table `creature` have creature (GUID: 112610 Entry: 15749) with `creature_template`.`RegenHealth`=1 and low current health (1096), `creature_template`.`minhealth`=1260.
-- ERROR:Table `creature` have creature (GUID: 112611 Entry: 15749) with `creature_template`.`RegenHealth`=1 and low current health (996), `creature_template`.`minhealth`=1260.
-- ERROR:Table `creature` have creature (GUID: 112612 Entry: 15749) with `creature_template`.`RegenHealth`=1 and low current health (996), `creature_template`.`minhealth`=1260.
-- ERROR:Table `creature` have creature (GUID: 112613 Entry: 15749) with `creature_template`.`RegenHealth`=1 and low current health (1081), `creature_template`.`minhealth`=1260.
UPDATE `creature` SET `curhealth`=1260 WHERE `id`=15749;
-- ERROR:Table `creature` have creature (GUID: 112614 Entry: 15748) with `creature_template`.`RegenHealth`=1 and low current health (3400), `creature_template`.`minhealth`=4600.
-- ERROR:Table `creature` have creature (GUID: 112615 Entry: 15748) with `creature_template`.`RegenHealth`=1 and low current health (3400), `creature_template`.`minhealth`=4600.
UPDATE `creature` SET `curhealth`=4600 WHERE `id`=15748;
-- ERROR:Table `creature` have creature (GUID: 112700 Entry: 15814) with `creature_template`.`RegenHealth`=1 and low current health (0), `creature_template`.`minhealth`=12191.
UPDATE `creature` SET `curhealth`=12191 WHERE `guid`=112700;
-- ERROR:Table `creature` have creature (GUID: 112701 Entry: 15806) with `creature_template`.`RegenHealth`=1 and low current health (8530), `creature_template`.`minhealth`=11530.
UPDATE `creature` SET `curhealth`=11530 WHERE `guid`=112701;
-- ERROR:Table `creature` have creature (GUID: 112702 Entry: 15808) with `creature_template`.`RegenHealth`=1 and low current health (681), `creature_template`.`minhealth`=919.
-- ERROR:Table `creature` have creature (GUID: 112703 Entry: 15808) with `creature_template`.`RegenHealth`=1 and low current health (896), `creature_template`.`minhealth`=919.
-- ERROR:Table `creature` have creature (GUID: 112704 Entry: 15808) with `creature_template`.`RegenHealth`=1 and low current health (681), `creature_template`.`minhealth`=919.
-- ERROR:Table `creature` have creature (GUID: 112705 Entry: 15808) with `creature_template`.`RegenHealth`=1 and low current health (896), `creature_template`.`minhealth`=919.
-- ERROR:Table `creature` have creature (GUID: 112706 Entry: 15808) with `creature_template`.`RegenHealth`=1 and low current health (681), `creature_template`.`minhealth`=919.
-- ERROR:Table `creature` have creature (GUID: 112707 Entry: 15808) with `creature_template`.`RegenHealth`=1 and low current health (896), `creature_template`.`minhealth`=919.
-- ERROR:Table `creature` have creature (GUID: 112708 Entry: 15808) with `creature_template`.`RegenHealth`=1 and low current health (681), `creature_template`.`minhealth`=919.
-- ERROR:Table `creature` have creature (GUID: 112709 Entry: 15808) with `creature_template`.`RegenHealth`=1 and low current health (681), `creature_template`.`minhealth`=919.
-- ERROR:Table `creature` have creature (GUID: 112710 Entry: 15808) with `creature_template`.`RegenHealth`=1 and low current health (681), `creature_template`.`minhealth`=919.
-- ERROR:Table `creature` have creature (GUID: 112711 Entry: 15808) with `creature_template`.`RegenHealth`=1 and low current health (681), `creature_template`.`minhealth`=919.
-- ERROR:Table `creature` have creature (GUID: 112712 Entry: 15808) with `creature_template`.`RegenHealth`=1 and low current health (896), `creature_template`.`minhealth`=919.
-- ERROR:Table `creature` have creature (GUID: 112713 Entry: 15808) with `creature_template`.`RegenHealth`=1 and low current health (896), `creature_template`.`minhealth`=919.
UPDATE `creature` SET `curhealth`=919 WHERE `id`=15808;
-- ERROR:Table `creature` have creature (GUID: 112714 Entry: 15807) with `creature_template`.`RegenHealth`=1 and low current health (3600), `creature_template`.`minhealth`=4860.
-- ERROR:Table `creature` have creature (GUID: 112715 Entry: 15807) with `creature_template`.`RegenHealth`=1 and low current health (3800), `creature_template`.`minhealth`=4860.
UPDATE `creature` SET `curhealth`=4860 WHERE `id`=15807;
-- ERROR:Table `creature` have creature (GUID: 112800 Entry: 15813) with `creature_template`.`RegenHealth`=1 and low current health (3588), `creature_template`.`minhealth`=4844.
UPDATE `creature` SET `curhealth`=4844 WHERE `guid`=112800;
-- ERROR:Table `creature` have creature (GUID: 112801 Entry: 15812) with `creature_template`.`RegenHealth`=1 and low current health (2924), `creature_template`.`minhealth`=3780.
UPDATE `creature` SET `curhealth`=3780 WHERE `guid`=112801;
-- ERROR:Table `creature` have creature (GUID: 112802 Entry: 15811) with `creature_template`.`RegenHealth`=1 and low current health (462), `creature_template`.`minhealth`=572.
-- ERROR:Table `creature` have creature (GUID: 112803 Entry: 15811) with `creature_template`.`RegenHealth`=1 and low current health (540), `creature_template`.`minhealth`=572.
-- ERROR:Table `creature` have creature (GUID: 112804 Entry: 15811) with `creature_template`.`RegenHealth`=1 and low current health (424), `creature_template`.`minhealth`=572.
-- ERROR:Table `creature` have creature (GUID: 112805 Entry: 15811) with `creature_template`.`RegenHealth`=1 and low current health (424), `creature_template`.`minhealth`=572.
-- ERROR:Table `creature` have creature (GUID: 112806 Entry: 15811) with `creature_template`.`RegenHealth`=1 and low current health (540), `creature_template`.`minhealth`=572.
-- ERROR:Table `creature` have creature (GUID: 112807 Entry: 15811) with `creature_template`.`RegenHealth`=1 and low current health (462), `creature_template`.`minhealth`=572.
-- ERROR:Table `creature` have creature (GUID: 112808 Entry: 15811) with `creature_template`.`RegenHealth`=1 and low current health (424), `creature_template`.`minhealth`=572.
-- ERROR:Table `creature` have creature (GUID: 112809 Entry: 15811) with `creature_template`.`RegenHealth`=1 and low current health (424), `creature_template`.`minhealth`=572.
-- ERROR:Table `creature` have creature (GUID: 112810 Entry: 15811) with `creature_template`.`RegenHealth`=1 and low current health (462), `creature_template`.`minhealth`=572.
-- ERROR:Table `creature` have creature (GUID: 112811 Entry: 15811) with `creature_template`.`RegenHealth`=1 and low current health (424), `creature_template`.`minhealth`=572.
-- ERROR:Table `creature` have creature (GUID: 112812 Entry: 15811) with `creature_template`.`RegenHealth`=1 and low current health (424), `creature_template`.`minhealth`=572.
-- ERROR:Table `creature` have creature (GUID: 112813 Entry: 15811) with `creature_template`.`RegenHealth`=1 and low current health (424), `creature_template`.`minhealth`=572.
UPDATE `creature` SET `curhealth`=572 WHERE `id`=15811;
-- ERROR:Table `creature` have creature (GUID: 112814 Entry: 15810) with `creature_template`.`RegenHealth`=1 and low current health (1426), `creature_template`.`minhealth`=1925.
-- ERROR:Table `creature` have creature (GUID: 112815 Entry: 15810) with `creature_template`.`RegenHealth`=1 and low current health (1456), `creature_template`.`minhealth`=1925.
UPDATE `creature` SET `curhealth`=1925 WHERE `id`=15810;
-- ERROR:Table `creature` have creature (GUID: 112900 Entry: 15818) with `creature_template`.`RegenHealth`=1 and low current health (490589), `creature_template`.`minhealth`=530550.
-- ERROR:Table `creature` have creature (GUID: 112920 Entry: 15818) with `creature_template`.`RegenHealth`=1 and low current health (490589), `creature_template`.`minhealth`=530550.
UPDATE `creature` SET `curhealth`=530550 WHERE `id`=15818;
-- ERROR:Table `creature` have creature (GUID: 112901 Entry: 15757) with `creature_template`.`RegenHealth`=1 and low current health (116585), `creature_template`.`minhealth`=157585.
-- ERROR:Table `creature` have creature (GUID: 112921 Entry: 15757) with `creature_template`.`RegenHealth`=1 and low current health (116585), `creature_template`.`minhealth`=157585.
UPDATE `creature` SET `curhealth`=157585 WHERE `id`=15757;
-- ERROR:Table `creature` have creature (GUID: 112902 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112903 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112904 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112905 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112906 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112907 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112908 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112909 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112910 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112911 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112912 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112913 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112922 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112923 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112924 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112925 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112926 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112927 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112928 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112929 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112930 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112931 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112932 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
-- ERROR:Table `creature` have creature (GUID: 112933 Entry: 15759) with `creature_template`.`RegenHealth`=1 and low current health (15720), `creature_template`.`minhealth`=21222.
UPDATE `creature` SET `curhealth`=21222 WHERE `id`=15759;
-- ERROR:Table `creature` have creature (GUID: 112914 Entry: 15758) with `creature_template`.`RegenHealth`=1 and low current health (64740), `creature_template`.`minhealth`=87740.
-- ERROR:Table `creature` have creature (GUID: 112915 Entry: 15758) with `creature_template`.`RegenHealth`=1 and low current health (64740), `creature_template`.`minhealth`=87740.
-- ERROR:Table `creature` have creature (GUID: 112934 Entry: 15758) with `creature_template`.`RegenHealth`=1 and low current health (64740), `creature_template`.`minhealth`=87740.
-- ERROR:Table `creature` have creature (GUID: 112935 Entry: 15758) with `creature_template`.`RegenHealth`=1 and low current health (64740), `creature_template`.`minhealth`=87740.
UPDATE `creature` SET `curhealth`=87740 WHERE `id`=15758;
-- ERROR:Table `creature` have creature (GUID: 112980 Entry: 15743) with `creature_template`.`RegenHealth`=1 and low current health (327554), `creature_template`.`minhealth`=442554.
-- ERROR:Table `creature` have creature (GUID: 112981 Entry: 15743) with `creature_template`.`RegenHealth`=1 and low current health (327554), `creature_template`.`minhealth`=442554.
-- ERROR:Table `creature` have creature (GUID: 112982 Entry: 15743) with `creature_template`.`RegenHealth`=1 and low current health (327554), `creature_template`.`minhealth`=442554.
-- ERROR:Table `creature` have creature (GUID: 112983 Entry: 15743) with `creature_template`.`RegenHealth`=1 and low current health (327554), `creature_template`.`minhealth`=442554.
-- ERROR:Table `creature` have creature (GUID: 112984 Entry: 15743) with `creature_template`.`RegenHealth`=1 and low current health (327554), `creature_template`.`minhealth`=442554.
-- ERROR:Table `creature` have creature (GUID: 112985 Entry: 15743) with `creature_template`.`RegenHealth`=1 and low current health (327554), `creature_template`.`minhealth`=442554.
-- ERROR:Table `creature` have creature (GUID: 112986 Entry: 15743) with `creature_template`.`RegenHealth`=1 and low current health (327554), `creature_template`.`minhealth`=442554.
-- ERROR:Table `creature` have creature (GUID: 112987 Entry: 15743) with `creature_template`.`RegenHealth`=1 and low current health (327554), `creature_template`.`minhealth`=442554.
UPDATE `creature` SET `curhealth`=442554 WHERE `id`=15743;
-- ERROR:Table `creature` have creature (GUID: 112995 Entry: 15744) with `creature_template`.`RegenHealth`=1 and low current health (171222), `creature_template`.`minhealth`=231222.
-- ERROR:Table `creature` have creature (GUID: 112996 Entry: 15744) with `creature_template`.`RegenHealth`=1 and low current health (171222), `creature_template`.`minhealth`=231222.
UPDATE `creature` SET `curhealth`=231222 WHERE `guid` IN (112995, 112996);
-- ERROR:Table `creature` have creature (GUID: 1242569 Entry: 15471) with `creature_template`.`RegenHealth`=1 and low current health (16754), `creature_template`.`minhealth`=17605.
-- ERROR:Table `creature` have creature (GUID: 1242569 Entry: 15471) with low current mana (0), `creature_template`.`minmana`=37290.
UPDATE `creature` SET `curhealth`=17605, `curmana`=37290 WHERE `guid`=1242569;

-- ERROR:Creature (GUID: 27587) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 27588) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 27589) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 27590) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 27591) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 27592) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 27593) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 27594) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 27595) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 27596) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 27597) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 27598) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 27599) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 27600) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 29974) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 29975) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 29976) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 29977) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 29978) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 29979) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 29980) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46968) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46996) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47005) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47007) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47011) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47013) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47014) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47015) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47019) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47020) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47022) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47024) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47058) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47059) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47269) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47270) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47271) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 54043) does not exist but has a record in `creature_addon`
DELETE FROM `creature_addon` WHERE `guid` IN (27587, 27588, 27589, 27590, 27591, 27592, 27593, 27594, 27595, 27596, 27597, 27598, 27599, 27600, 29974, 29975, 29976, 29977, 29978, 29979, 29980, 46968, 46996, 47005, 47007, 47011, 47013, 47014, 47015, 47019, 47020, 47022, 47024, 47058, 47059, 47269, 47270, 47271, 54043);

-- ERROR:Pool Id (216) has all creatures or gameobjects with explicit chance sum <>100 and no equal chance defined. The pool system cannot pick one to spawn.
INSERT INTO `pool_gameobject` VALUES (64623, 216, 0, 'Greater Sagefish School', 0);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) VALUES (64623, 180684, 0, -12239.5, -335.31, 10.0699, 0.698132, 0, 0, 0.34202, 0.939693, 180, 100, 1, 0);
-- ERROR:Pool Id (268) has all creatures or gameobjects with explicit chance sum <>100 and no equal chance defined. The pool system cannot pick one to spawn.
INSERT INTO `pool_gameobject` VALUES (64627, 268, 0, 'Stonescale Eel Swarm', 0);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) VALUES (64627, 180712, 0, -14401.4, 438.454, 0, -1.29154, 0, 0, -0.601814, 0.798637, 180, 100, 1, 0);

-- ERROR:Quest 8864 has `RewChoiceItemId3` = 21538 but `RewChoiceItemCount3` = 0, quest can't be done.
-- ERROR:Quest 8864 has `RewChoiceItemId2` = 21539 but `RewChoiceItemCount2` = 0, quest can't be done.
-- ERROR:Quest 8864 has `RewChoiceItemId1` = 21157 but `RewChoiceItemCount1` = 0, quest can't be done.
UPDATE `quest_template` SET `RewChoiceItemCount1`=1, `RewChoiceItemCount2`=1, `RewChoiceItemCount3`=1 WHERE `entry`=8864;
-- ERROR:Quest 8868 has `RewMailTemplateId` = 135 but mail template  135 already used for quest 8864, quest will not have a mail reward.
UPDATE `quest_template` SET `RewMailTemplateId`=0 WHERE `entry`=8868;
-- ERROR:Quest 55061 has `SrcItemId` = 55701 but item with entry 55701 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55061;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55061;
-- ERROR:Quest 136 has `SrcItemId` = 1357 but `SrcItemCount` = 0, set to 1 but need fix in DB.
UPDATE `quest_template` SET `SrcItemCount`=1 WHERE `entry`=136;
-- ERROR:Quest 55001 has `SrcItemId` = 55701 but item with entry 55701 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55001;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55001;
-- ERROR:Quest 55042 has PrevQuestId 55041, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55042;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55042;
DELETE FROM `creature_questrelation` WHERE `quest`=55042;
-- ERROR:Quest 8877 has `RewMailTemplateId` = 135 but mail template  135 already used for quest 8864, quest will not have a mail reward.
UPDATE `quest_template` SET `RewMailTemplateId`=0 WHERE `entry`=8877;
-- ERROR:Quest 8865 has `RewChoiceItemId3` = 21541 but `RewChoiceItemCount3` = 0, quest can't be done.
-- ERROR:Quest 8865 has `RewChoiceItemId2` = 21544 but `RewChoiceItemCount2` = 0, quest can't be done.
-- ERROR:Quest 8865 has `RewChoiceItemId1` = 21543 but `RewChoiceItemCount1` = 0, quest can't be done.
-- ERROR:Quest 8865 has `RewMailTemplateId` = 135 but mail template  135 already used for quest 8864, quest will not have a mail reward.
UPDATE `quest_template` SET `RewChoiceItemCount1`=1, `RewChoiceItemCount2`=1, `RewChoiceItemCount3`=1, `RewMailTemplateId`=0 WHERE `entry`=8865;
-- ERROR:Quest 594 has `SrcItemId` = 4098 but `SrcItemCount` = 0, set to 1 but need fix in DB.
UPDATE `quest_template` SET `SrcItemCount`=1 WHERE `entry`=594;
-- ERROR:Quest 624 has `SrcItemId` = 4056 but `SrcItemCount` = 0, set to 1 but need fix in DB.
UPDATE `quest_template` SET `SrcItemCount`=1 WHERE `entry`=624;
-- ERROR:Quest 654 has `SrcItemId` = 8524 but `SrcItemCount` = 0, set to 1 but need fix in DB.
UPDATE `quest_template` SET `SrcItemCount`=1 WHERE `entry`=654;
-- ERROR:Quest 3111 has `SrcItemId` = 9572 but `SrcItemCount` = 0, set to 1 but need fix in DB.
UPDATE `quest_template` SET `SrcItemCount`=1 WHERE `entry`=3111;
-- ERROR:Quest 1646 has `SrcItemId` = 6916 but `SrcItemCount` = 0, set to 1 but need fix in DB.
UPDATE `quest_template` SET `SrcItemCount`=1 WHERE `entry`=1646;
-- ERROR:Quest 1649 has `SrcItemId` = 6776 but `SrcItemCount` = 0, set to 1 but need fix in DB.
UPDATE `quest_template` SET `SrcItemCount`=1 WHERE `entry`=1649;
-- ERROR:Quest 1642 has `SrcItemId` = 6775 but `SrcItemCount` = 0, set to 1 but need fix in DB.
UPDATE `quest_template` SET `SrcItemCount`=1 WHERE `entry`=1642;
-- ERROR:Quest 2882 has `SrcItemId` = 9245 but `SrcItemCount` = 0, set to 1 but need fix in DB.
UPDATE `quest_template` SET `SrcItemCount`=1 WHERE `entry`=2882;
-- ERROR:Quest 8876 has `RewMailTemplateId` = 135 but mail template  135 already used for quest 8864, quest will not have a mail reward.
UPDATE `quest_template` SET `RewMailTemplateId`=0 WHERE `entry`=8876;
-- ERROR:Quest 4881 has `SrcItemId` = 12564 but `SrcItemCount` = 0, set to 1 but need fix in DB.
UPDATE `quest_template` SET `SrcItemCount`=1 WHERE `entry`=4881;
-- ERROR:Quest 55151 has `SrcItemId` = 0 but `SrcItemCount` = 1, useless value.
-- ERROR:Quest 55151 has `ReqItemId1` = 55752 but item with entry 55752 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55151;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55151;
-- ERROR:Quest 55111 has `SrcItemId` = 0 but `SrcItemCount` = 1, useless value.
-- ERROR:Quest 55111 has `ReqItemId1` = 55712 but item with entry 55712 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55111;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55111;
-- ERROR:Quest 55052 has PrevQuestId 55051, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55052;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55052;
DELETE FROM `creature_questrelation` WHERE `quest`=55052;
-- ERROR:Quest 55062 has PrevQuestId 55061, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55062;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55062;
DELETE FROM `creature_questrelation` WHERE `quest`=55062;
-- ERROR:Quest 55032 has PrevQuestId 55031, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55032;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55032;
DELETE FROM `creature_questrelation` WHERE `quest`=55032;
-- ERROR:Quest 55012 has PrevQuestId 55011, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55012;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55012;
DELETE FROM `creature_questrelation` WHERE `quest`=55012;
-- ERROR:Quest 55022 has PrevQuestId 55021, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55022;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55022;
DELETE FROM `creature_questrelation` WHERE `quest`=55022;
-- ERROR:Quest 55072 has PrevQuestId 55071, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55072;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55072;
DELETE FROM `creature_questrelation` WHERE `quest`=55072;
-- ERROR:Quest 4903 has `SrcItemId` = 12562 but `SrcItemCount` = 0, set to 1 but need fix in DB.
UPDATE `quest_template` SET `SrcItemCount`=1 WHERE `entry`=4903;
-- ERROR:Quest 5541 has `SrcItemId` = 13850 but `SrcItemCount` = 0, set to 1 but need fix in DB.
UPDATE `quest_template` SET `SrcItemCount`=1 WHERE `entry`=5541;
-- ERROR:Quest 7761 has `SrcItemId` = 18987 but `SrcItemCount` = 0, set to 1 but need fix in DB.
UPDATE `quest_template` SET `SrcItemCount`=1 WHERE `entry`=7761;
-- ERROR:Quest 7799 has PrevQuestId 15001, but no such quest
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`=7799;
-- ERROR:Quest 55071 has `SrcItemId` = 55701 but item with entry 55701 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55071;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55071;
-- ERROR:Quest 55101 has `SrcItemId` = 0 but `SrcItemCount` = 1, useless value.
-- ERROR:Quest 55101 has `ReqItemId1` = 55702 but item with entry 55702 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55101;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55101;
-- ERROR:Quest 55011 has `SrcItemId` = 55701 but item with entry 55701 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55011;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55011;
-- ERROR:Quest 55121 has `SrcItemId` = 0 but `SrcItemCount` = 1, useless value.
-- ERROR:Quest 55121 has `ReqItemId1` = 55722 but item with entry 55722 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55121;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55121;
-- ERROR:Quest 55171 has `SrcItemId` = 0 but `SrcItemCount` = 1, useless value.
-- ERROR:Quest 55171 has `ReqItemId1` = 55772 but item with entry 55772 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55171;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55171;
-- ERROR:Quest 55161 has `SrcItemId` = 0 but `SrcItemCount` = 1, useless value.
-- ERROR:Quest 55161 has `ReqItemId1` = 55762 but item with entry 55762 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55161;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55161;
-- ERROR:Quest 55141 has `SrcItemId` = 0 but `SrcItemCount` = 1, useless value.
-- ERROR:Quest 55141 has `ReqItemId1` = 55742 but item with entry 55742 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55141;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55141;
-- ERROR:Quest 55131 has `SrcItemId` = 0 but `SrcItemCount` = 1, useless value.
-- ERROR:Quest 55131 has `ReqItemId1` = 55732 but item with entry 55732 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55131;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55131;
-- ERROR:Quest 55031 has `SrcItemId` = 55701 but item with entry 55701 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55031;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55031;
-- ERROR:Quest 55021 has `SrcItemId` = 55701 but item with entry 55701 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55021;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55021;
-- ERROR:Quest 55051 has `SrcItemId` = 55701 but item with entry 55701 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55051;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55051;
-- ERROR:Quest 55041 has `SrcItemId` = 55701 but item with entry 55701 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=55041;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55041;
-- ERROR:Quest 137705 has `ReqCreatureOrGOId1` = 31 but creature with entry 31 does not exist, quest can't be done.
-- ERROR:Quest 137705 has `ReqCreatureOrGOId2` = 32 but creature with entry 32 does not exist, quest can't be done.
DELETE FROM `quest_template` WHERE `entry`=137705;
-- ERROR:Quest 19999 has `SrcItemId` = 60100 but item with entry 60100 does not exist, quest can't be done.
-- ERROR:Quest 19999 has `NextQuestInChain` = 20001 but quest 20001 does not exist, quest chain will not work.
DELETE FROM `quest_template` WHERE `entry`=19999;
-- ERROR:Quest 8862 has `RewMailTemplateId` = 135 but mail template  135 already used for quest 8864, quest will not have a mail reward.
UPDATE `quest_template` SET `RewMailTemplateId`=0 WHERE `entry`=8862;
-- ERROR:Quest 8863 has `RewMailTemplateId` = 135 but mail template  135 already used for quest 8864, quest will not have a mail reward.
UPDATE `quest_template` SET `RewMailTemplateId`=0 WHERE `entry`=8863;
-- ERROR:Quest 8878 has `RewChoiceItemId2` = 21723 but `RewChoiceItemCount2` = 0, quest can't be done.
-- ERROR:Quest 8878 has `RewChoiceItemId1` = 21722 but `RewChoiceItemCount1` = 0, quest can't be done.
-- ERROR:Quest 8878 has `RewMailTemplateId` = 135 but mail template  135 already used for quest 8864, quest will not have a mail reward.
UPDATE `quest_template` SET `RewChoiceItemCount1`=1, `RewChoiceItemCount2`=1, `RewMailTemplateId`=0 WHERE `entry`=8878;
-- ERROR:Quest 8879 has `RewMailTemplateId` = 135 but mail template  135 already used for quest 8864, quest will not have a mail reward.
UPDATE `quest_template` SET `RewMailTemplateId`=0 WHERE `entry`=8879;
-- ERROR:Quest 8880 has `RewMailTemplateId` = 135 but mail template  135 already used for quest 8864, quest will not have a mail reward.
UPDATE `quest_template` SET `RewMailTemplateId`=0 WHERE `entry`=8880;
-- ERROR:Quest 8881 has `RewMailTemplateId` = 135 but mail template  135 already used for quest 8864, quest will not have a mail reward.
UPDATE `quest_template` SET `RewMailTemplateId`=0 WHERE `entry`=8881;
-- ERROR:Quest 8882 has `RewMailTemplateId` = 135 but mail template  135 already used for quest 8864, quest will not have a mail reward.
UPDATE `quest_template` SET `RewMailTemplateId`=0 WHERE `entry`=8882;
-- ERROR:Spell (id: 25201) have SPELL_EFFECT_QUEST_COMPLETE for quest 8305 , but quest does not have SpecialFlags QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT (2) set. Quest SpecialFlags should be corrected to enable this objective.
UPDATE `quest_template` SET `SpecialFlags`=2 WHERE `entry`=8305;
-- ERROR:Quest 55063 has PrevQuestId 55062, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55063;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55063;
DELETE FROM `creature_questrelation` WHERE `quest`=55063;
-- ERROR:Quest 55043 has PrevQuestId 55042, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55043;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55043;
DELETE FROM `creature_questrelation` WHERE `quest`=55043;
-- ERROR:Quest 55053 has PrevQuestId 55052, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55053;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55053;
DELETE FROM `creature_questrelation` WHERE `quest`=55053;
-- ERROR:Quest 55023 has PrevQuestId 55022, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55023;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55023;
DELETE FROM `creature_questrelation` WHERE `quest`=55023;
-- ERROR:Quest 55013 has PrevQuestId 55012, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55013;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55013;
DELETE FROM `creature_questrelation` WHERE `quest`=55013;
-- ERROR:Quest 55002 has PrevQuestId 55001, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55002;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55002;
DELETE FROM `creature_questrelation` WHERE `quest`=55002;
-- ERROR:Quest 55033 has PrevQuestId 55032, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55033;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55033;
DELETE FROM `creature_questrelation` WHERE `quest`=55033;
-- ERROR:Quest 55073 has PrevQuestId 55072, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55073;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55073;
DELETE FROM `creature_questrelation` WHERE `quest`=55073;
-- ERROR:Quest 55003 has PrevQuestId 55002, but no such quest
DELETE FROM `quest_template` WHERE `entry`=55003;
DELETE FROM `creature_involvedrelation` WHERE `quest`=55003;
DELETE FROM `creature_questrelation` WHERE `quest`=55003;

-- ERROR:Table `creature_questrelation` has creature entry (3694) for quest 990, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=3694;
-- ERROR:Table `creature_questrelation` has creature entry (14738) for quest 7841, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_questrelation` has creature entry (14738) for quest 7842, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_questrelation` has creature entry (14738) for quest 7843, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (14738) for quest 7841, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (14738) for quest 7842, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
-- ERROR:Table `creature_involvedrelation` has creature entry (14738) for quest 7843, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
UPDATE `creature_template` SET `npcflag`=7 WHERE `entry`=14738;

-- ERROR:`game_event_gameobject` have gameobject (GUID: 17891) for event 168 from pool or subpool of pool (ID: 58) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=17891;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 18148) for event 166 from pool or subpool of pool (ID: 79) but pool have already content from event 168. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=168 WHERE `guid`=18148;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 18227) for event 168 from pool or subpool of pool (ID: 38) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=18227;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 18232) for event 168 from pool or subpool of pool (ID: 48) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=18232;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 18284) for event 168 from pool or subpool of pool (ID: 49) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=18284;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 18629) for event 168 from pool or subpool of pool (ID: 70) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=18629;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 18631) for event 168 from pool or subpool of pool (ID: 80) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=18631;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 30712) for event 168 from pool or subpool of pool (ID: 57) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=30712;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 33285) for event 168 from pool or subpool of pool (ID: 67) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=33285;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 47323) for event 166 from pool or subpool of pool (ID: 149) but pool have already content from event 168. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=168 WHERE `guid`=47323;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 47331) for event 166 from pool or subpool of pool (ID: 149) but pool have already content from event 168. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=168 WHERE `guid`=47331;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 47342) for event 166 from pool or subpool of pool (ID: 149) but pool have already content from event 168. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=168 WHERE `guid`=47342;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 47474) for event 168 from pool or subpool of pool (ID: 174) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=47474;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 47475) for event 168 from pool or subpool of pool (ID: 158) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=47475;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 47476) for event 168 from pool or subpool of pool (ID: 178) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=47476;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 47477) for event 168 from pool or subpool of pool (ID: 184) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=47477;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 47478) for event 168 from pool or subpool of pool (ID: 185) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=47478;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 47479) for event 168 from pool or subpool of pool (ID: 181) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=47479;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 47547) for event 168 from pool or subpool of pool (ID: 183) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=47547;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 47548) for event 168 from pool or subpool of pool (ID: 32) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=47548;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 47549) for event 168 from pool or subpool of pool (ID: 180) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=47549;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 47550) for event 168 from pool or subpool of pool (ID: 173) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=47550;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 47551) for event 168 from pool or subpool of pool (ID: 176) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=47551;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 49907) for event 166 from pool or subpool of pool (ID: 241) but pool have already content from event 168. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=168 WHERE `guid`=49907;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 49911) for event 166 from pool or subpool of pool (ID: 47) but pool have already content from event 168. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=168 WHERE `guid`=49911;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 49912) for event 166 from pool or subpool of pool (ID: 50) but pool have already content from event 168. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=168 WHERE `guid`=49912;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 50178) for event 168 from pool or subpool of pool (ID: 62) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=50178;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 50179) for event 168 from pool or subpool of pool (ID: 76) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=50179;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 50180) for event 168 from pool or subpool of pool (ID: 39) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=50180;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 50181) for event 168 from pool or subpool of pool (ID: 63) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=50181;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 50182) for event 168 from pool or subpool of pool (ID: 60) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=50182;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 50184) for event 168 from pool or subpool of pool (ID: 72) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=50184;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 50260) for event 166 from pool or subpool of pool (ID: 241) but pool have already content from event 168. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=168 WHERE `guid`=50260;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 50265) for event 166 from pool or subpool of pool (ID: 47) but pool have already content from event 168. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=168 WHERE `guid`=50265;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 50298) for event 168 from pool or subpool of pool (ID: 78) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=50298;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 50301) for event 168 from pool or subpool of pool (ID: 77) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=50301;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 50302) for event 168 from pool or subpool of pool (ID: 242) but pool have already content from event 166. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=166 WHERE `guid`=50302;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 50308) for event 166 from pool or subpool of pool (ID: 50) but pool have already content from event 168. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=168 WHERE `guid`=50308;
-- ERROR:`game_event_gameobject` have gameobject (GUID: 50309) for event 166 from pool or subpool of pool (ID: 245) but pool have already content from event 168. Pool don't must have content for different events!
UPDATE `game_event_gameobject` SET `event`=168 WHERE `guid`=50309;

-- ERROR:Gameobject (GUID: 479) expected to be listed in `game_event_gameobject` for event 166 as part pool 5
INSERT INTO `game_event_gameobject` VALUES (479,166);
-- ERROR:Gameobject (GUID: 624) expected to be listed in `game_event_gameobject` for event 166 as part pool 18
INSERT INTO `game_event_gameobject` VALUES (624,166);
-- ERROR:Gameobject (GUID: 726) expected to be listed in `game_event_gameobject` for event 166 as part pool 33
INSERT INTO `game_event_gameobject` VALUES (726,166);
-- ERROR:Gameobject (GUID: 738) expected to be listed in `game_event_gameobject` for event 166 as part pool 34
INSERT INTO `game_event_gameobject` VALUES (738,166);
-- ERROR:Gameobject (GUID: 767) expected to be listed in `game_event_gameobject` for event 166 as part pool 35
INSERT INTO `game_event_gameobject` VALUES (767,166);
-- ERROR:Gameobject (GUID: 807) expected to be listed in `game_event_gameobject` for event 166 as part pool 36
INSERT INTO `game_event_gameobject` VALUES (807,166);
-- ERROR:Gameobject (GUID: 841) expected to be listed in `game_event_gameobject` for event 166 as part pool 51
INSERT INTO `game_event_gameobject` VALUES (841,166);
-- ERROR:Gameobject (GUID: 854) expected to be listed in `game_event_gameobject` for event 166 as part pool 52
INSERT INTO `game_event_gameobject` VALUES (854,166);
-- ERROR:Gameobject (GUID: 865) expected to be listed in `game_event_gameobject` for event 166 as part pool 53
INSERT INTO `game_event_gameobject` VALUES (865,166);
-- ERROR:Gameobject (GUID: 872) expected to be listed in `game_event_gameobject` for event 166 as part pool 54
INSERT INTO `game_event_gameobject` VALUES (872,166);
-- ERROR:Gameobject (GUID: 874) expected to be listed in `game_event_gameobject` for event 166 as part pool 55
INSERT INTO `game_event_gameobject` VALUES (874,166);
-- ERROR:Gameobject (GUID: 894) expected to be listed in `game_event_gameobject` for event 166 as part pool 56
INSERT INTO `game_event_gameobject` VALUES (894,166);
-- ERROR:Gameobject (GUID: 899) expected to be listed in `game_event_gameobject` for event 166 as part pool 65
INSERT INTO `game_event_gameobject` VALUES (899,166);
-- ERROR:Gameobject (GUID: 50306) expected to be listed in `game_event_gameobject` for event 166 as part pool 71
INSERT INTO `game_event_gameobject` VALUES (50306,166);
-- ERROR:Gameobject (GUID: 18151) expected to be listed in `game_event_gameobject` for event 166 as part pool 73
INSERT INTO `game_event_gameobject` VALUES (18151,166);
-- ERROR:Gameobject (GUID: 18153) expected to be listed in `game_event_gameobject` for event 166 as part pool 74
INSERT INTO `game_event_gameobject` VALUES (18153,166);
-- ERROR:Gameobject (GUID: 18154) expected to be listed in `game_event_gameobject` for event 166 as part pool 75
INSERT INTO `game_event_gameobject` VALUES (18154,166);
-- ERROR:Gameobject (GUID: 14778) expected to be listed in `game_event_gameobject` for event 166 as part pool 91
INSERT INTO `game_event_gameobject` VALUES (14778,166);
-- ERROR:Gameobject (GUID: 1124) expected to be listed in `game_event_gameobject` for event 166 as part pool 92
INSERT INTO `game_event_gameobject` VALUES (1124,166);
-- ERROR:Gameobject (GUID: 1431) expected to be listed in `game_event_gameobject` for event 166 as part pool 93
INSERT INTO `game_event_gameobject` VALUES (1431,166);
-- ERROR:Gameobject (GUID: 1441) expected to be listed in `game_event_gameobject` for event 166 as part pool 94
INSERT INTO `game_event_gameobject` VALUES (1441,166);
-- ERROR:Gameobject (GUID: 1457) expected to be listed in `game_event_gameobject` for event 166 as part pool 95
INSERT INTO `game_event_gameobject` VALUES (1457,166);
-- ERROR:Gameobject (GUID: 1466) expected to be listed in `game_event_gameobject` for event 166 as part pool 96
INSERT INTO `game_event_gameobject` VALUES (1466,166);
-- ERROR:Gameobject (GUID: 1489) expected to be listed in `game_event_gameobject` for event 166 as part pool 97
INSERT INTO `game_event_gameobject` VALUES (1489,166);
-- ERROR:Gameobject (GUID: 1526) expected to be listed in `game_event_gameobject` for event 166 as part pool 98
INSERT INTO `game_event_gameobject` VALUES (1526,166);
-- ERROR:Gameobject (GUID: 1605) expected to be listed in `game_event_gameobject` for event 166 as part pool 99
INSERT INTO `game_event_gameobject` VALUES (1605,166);
-- ERROR:Gameobject (GUID: 1617) expected to be listed in `game_event_gameobject` for event 166 as part pool 100
INSERT INTO `game_event_gameobject` VALUES (1617,166);
-- ERROR:Gameobject (GUID: 1619) expected to be listed in `game_event_gameobject` for event 166 as part pool 101
INSERT INTO `game_event_gameobject` VALUES (1619,166);
-- ERROR:Gameobject (GUID: 1635) expected to be listed in `game_event_gameobject` for event 166 as part pool 102
INSERT INTO `game_event_gameobject` VALUES (1635,166);
-- ERROR:Gameobject (GUID: 42693) expected to be listed in `game_event_gameobject` for event 166 as part pool 164
INSERT INTO `game_event_gameobject` VALUES (42693,166);
-- ERROR:Gameobject (GUID: 1645) expected to be listed in `game_event_gameobject` for event 166 as part pool 165
INSERT INTO `game_event_gameobject` VALUES (1645,166);
-- ERROR:Gameobject (GUID: 1650) expected to be listed in `game_event_gameobject` for event 166 as part pool 166
INSERT INTO `game_event_gameobject` VALUES (1650,166);
-- ERROR:Gameobject (GUID: 42696) expected to be listed in `game_event_gameobject` for event 166 as part pool 167
INSERT INTO `game_event_gameobject` VALUES (42696,166);
-- ERROR:Gameobject (GUID: 1699) expected to be listed in `game_event_gameobject` for event 166 as part pool 168
INSERT INTO `game_event_gameobject` VALUES (1699,166);
-- ERROR:Gameobject (GUID: 1732) expected to be listed in `game_event_gameobject` for event 166 as part pool 169
INSERT INTO `game_event_gameobject` VALUES (1732,166);
-- ERROR:Gameobject (GUID: 1735) expected to be listed in `game_event_gameobject` for event 166 as part pool 170
INSERT INTO `game_event_gameobject` VALUES (1735,166);
-- ERROR:Gameobject (GUID: 1744) expected to be listed in `game_event_gameobject` for event 166 as part pool 171
INSERT INTO `game_event_gameobject` VALUES (1744,166);
-- ERROR:Gameobject (GUID: 1768) expected to be listed in `game_event_gameobject` for event 166 as part pool 172
INSERT INTO `game_event_gameobject` VALUES (1768,166);
-- ERROR:Gameobject (GUID: 47351) expected to be listed in `game_event_gameobject` for event 166 as part pool 186
INSERT INTO `game_event_gameobject` VALUES (47351,166);
-- ERROR:Gameobject (GUID: 1773) expected to be listed in `game_event_gameobject` for event 166 as part pool 187
INSERT INTO `game_event_gameobject` VALUES (1773,166);
-- ERROR:Gameobject (GUID: 1791) expected to be listed in `game_event_gameobject` for event 166 as part pool 188
INSERT INTO `game_event_gameobject` VALUES (1791,166);
-- ERROR:Gameobject (GUID: 1839) expected to be listed in `game_event_gameobject` for event 166 as part pool 189
INSERT INTO `game_event_gameobject` VALUES (1839,166);
-- ERROR:Gameobject (GUID: 1858) expected to be listed in `game_event_gameobject` for event 166 as part pool 190
INSERT INTO `game_event_gameobject` VALUES (1858,166);
-- ERROR:Gameobject (GUID: 1912) expected to be listed in `game_event_gameobject` for event 166 as part pool 191
INSERT INTO `game_event_gameobject` VALUES (1912,166);
-- ERROR:Gameobject (GUID: 2001) expected to be listed in `game_event_gameobject` for event 166 as part pool 192
INSERT INTO `game_event_gameobject` VALUES (2001,166);
-- ERROR:Gameobject (GUID: 2031) expected to be listed in `game_event_gameobject` for event 166 as part pool 193
INSERT INTO `game_event_gameobject` VALUES (2031,166);
-- ERROR:Gameobject (GUID: 2051) expected to be listed in `game_event_gameobject` for event 166 as part pool 194
INSERT INTO `game_event_gameobject` VALUES (2051,166);
-- ERROR:Gameobject (GUID: 4561) expected to be listed in `game_event_gameobject` for event 166 as part pool 195
INSERT INTO `game_event_gameobject` VALUES (4561,166);
-- ERROR:Gameobject (GUID: 4583) expected to be listed in `game_event_gameobject` for event 166 as part pool 196
INSERT INTO `game_event_gameobject` VALUES (4583,166);
-- ERROR:Gameobject (GUID: 64623) expected to be listed in `game_event_gameobject` for event 166 as part pool 216
INSERT INTO `game_event_gameobject` VALUES (64623,166);
-- ERROR:Gameobject (GUID: 50307) expected to be listed in `game_event_gameobject` for event 166 as part pool 223
INSERT INTO `game_event_gameobject` VALUES (50307,166);
-- ERROR:Gameobject (GUID: 5121) expected to be listed in `game_event_gameobject` for event 166 as part pool 225
INSERT INTO `game_event_gameobject` VALUES (5121,166);
-- ERROR:Gameobject (GUID: 50280) expected to be listed in `game_event_gameobject` for event 166 as part pool 227
INSERT INTO `game_event_gameobject` VALUES (50280,166);
-- ERROR:Gameobject (GUID: 5179) expected to be listed in `game_event_gameobject` for event 166 as part pool 228
INSERT INTO `game_event_gameobject` VALUES (5179,166);
-- ERROR:Gameobject (GUID: 5182) expected to be listed in `game_event_gameobject` for event 166 as part pool 229
INSERT INTO `game_event_gameobject` VALUES (5182,166);
-- ERROR:Gameobject (GUID: 48556) expected to be listed in `game_event_gameobject` for event 166 as part pool 230
INSERT INTO `game_event_gameobject` VALUES (48556,166);
-- ERROR:Gameobject (GUID: 5192) expected to be listed in `game_event_gameobject` for event 166 as part pool 231
INSERT INTO `game_event_gameobject` VALUES (5192,166);
-- ERROR:Gameobject (GUID: 5328) expected to be listed in `game_event_gameobject` for event 166 as part pool 232
INSERT INTO `game_event_gameobject` VALUES (5328,166);
-- ERROR:Gameobject (GUID: 48647) expected to be listed in `game_event_gameobject` for event 166 as part pool 233
INSERT INTO `game_event_gameobject` VALUES (48647,166);
-- ERROR:Gameobject (GUID: 5439) expected to be listed in `game_event_gameobject` for event 166 as part pool 234
INSERT INTO `game_event_gameobject` VALUES (5439,166);
-- ERROR:Gameobject (GUID: 5442) expected to be listed in `game_event_gameobject` for event 166 as part pool 235
INSERT INTO `game_event_gameobject` VALUES (5442,166);
-- ERROR:Gameobject (GUID: 5476) expected to be listed in `game_event_gameobject` for event 166 as part pool 236
INSERT INTO `game_event_gameobject` VALUES (5476,166);
-- ERROR:Gameobject (GUID: 6843) expected to be listed in `game_event_gameobject` for event 166 as part pool 237
INSERT INTO `game_event_gameobject` VALUES (6843,166);
-- ERROR:Gameobject (GUID: 6856) expected to be listed in `game_event_gameobject` for event 166 as part pool 238
INSERT INTO `game_event_gameobject` VALUES (6856,166);
-- ERROR:Gameobject (GUID: 10951) expected to be listed in `game_event_gameobject` for event 166 as part pool 244
INSERT INTO `game_event_gameobject` VALUES (10951,166);
-- ERROR:Gameobject (GUID: 50279) expected to be listed in `game_event_gameobject` for event 166 as part pool 246
INSERT INTO `game_event_gameobject` VALUES (50279,166);
-- ERROR:Gameobject (GUID: 10966) expected to be listed in `game_event_gameobject` for event 166 as part pool 247
INSERT INTO `game_event_gameobject` VALUES (10966,166);
-- ERROR:Gameobject (GUID: 10969) expected to be listed in `game_event_gameobject` for event 166 as part pool 248
INSERT INTO `game_event_gameobject` VALUES (10969,166);
-- ERROR:Gameobject (GUID: 14086) expected to be listed in `game_event_gameobject` for event 166 as part pool 249
INSERT INTO `game_event_gameobject` VALUES (14086,166);
-- ERROR:Gameobject (GUID: 14088) expected to be listed in `game_event_gameobject` for event 166 as part pool 250
INSERT INTO `game_event_gameobject` VALUES (14088,166);
-- ERROR:Gameobject (GUID: 50273) expected to be listed in `game_event_gameobject` for event 166 as part pool 251
INSERT INTO `game_event_gameobject` VALUES (50273,166);
-- ERROR:Gameobject (GUID: 15110) expected to be listed in `game_event_gameobject` for event 166 as part pool 252
INSERT INTO `game_event_gameobject` VALUES (15110,166);
-- ERROR:Gameobject (GUID: 15199) expected to be listed in `game_event_gameobject` for event 166 as part pool 253
INSERT INTO `game_event_gameobject` VALUES (15199,166);
-- ERROR:Gameobject (GUID: 50283) expected to be listed in `game_event_gameobject` for event 166 as part pool 254
INSERT INTO `game_event_gameobject` VALUES (50283,166);
-- ERROR:Gameobject (GUID: 15203) expected to be listed in `game_event_gameobject` for event 166 as part pool 255
INSERT INTO `game_event_gameobject` VALUES (15203,166);
-- ERROR:Gameobject (GUID: 15397) expected to be listed in `game_event_gameobject` for event 166 as part pool 256
INSERT INTO `game_event_gameobject` VALUES (15397,166);
-- ERROR:Gameobject (GUID: 15420) expected to be listed in `game_event_gameobject` for event 166 as part pool 257
INSERT INTO `game_event_gameobject` VALUES (15420,166);
-- ERROR:Gameobject (GUID: 50291) expected to be listed in `game_event_gameobject` for event 166 as part pool 258
INSERT INTO `game_event_gameobject` VALUES (50291,166);
-- ERROR:Gameobject (GUID: 15505) expected to be listed in `game_event_gameobject` for event 166 as part pool 259
INSERT INTO `game_event_gameobject` VALUES (15505,166);
-- ERROR:Gameobject (GUID: 15634) expected to be listed in `game_event_gameobject` for event 166 as part pool 260
INSERT INTO `game_event_gameobject` VALUES (15634,166);
-- ERROR:Gameobject (GUID: 15764) expected to be listed in `game_event_gameobject` for event 166 as part pool 261
INSERT INTO `game_event_gameobject` VALUES (15764,166);
-- ERROR:Gameobject (GUID: 15775) expected to be listed in `game_event_gameobject` for event 166 as part pool 262
INSERT INTO `game_event_gameobject` VALUES (15775,166);
-- ERROR:Gameobject (GUID: 15777) expected to be listed in `game_event_gameobject` for event 166 as part pool 263
INSERT INTO `game_event_gameobject` VALUES (15777,166);
-- ERROR:Gameobject (GUID: 15783) expected to be listed in `game_event_gameobject` for event 166 as part pool 264
INSERT INTO `game_event_gameobject` VALUES (15783,166);
-- ERROR:Gameobject (GUID: 16574) expected to be listed in `game_event_gameobject` for event 166 as part pool 265
INSERT INTO `game_event_gameobject` VALUES (16574,166);
-- ERROR:Gameobject (GUID: 16577) expected to be listed in `game_event_gameobject` for event 166 as part pool 266
INSERT INTO `game_event_gameobject` VALUES (16577,166);
-- ERROR:Gameobject (GUID: 16579) expected to be listed in `game_event_gameobject` for event 166 as part pool 267
INSERT INTO `game_event_gameobject` VALUES (16579,166);
-- ERROR:Gameobject (GUID: 64627) expected to be listed in `game_event_gameobject` for event 166 as part pool 268
INSERT INTO `game_event_gameobject` VALUES (64627,166);

-- ERROR:(Not)Active event condition (entry 74, type 25) requires existing event id (157), skipped
-- ERROR:ObjectMgr::LoadConditions: invalid condition_entry 74, skip
-- ERROR:Table `creature_loot_template` for entry 12057, item 17782 has condition_id 74 that does not exist in `conditions`, ignoring
-- ERROR:Table 'creature_loot_template' entry 12057 item 17782: equal-chanced grouped entry, but group not defined - skipped
-- Talisman of Binding Shard - Seems like an event was used to determine if it can drop.
-- Adding the event back and setting it to DISABLED to fix related errors.
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `hardcoded`, `disabled`) VALUES (157, '2025-03-30 04:00:00', '2030-03-30 04:00:00', 1, 2, 0, 'Talisman of Binding Shard', 0, 1);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=5.0 WHERE `entry`=12057 && `item`=17782;

-- ERROR:Table `scripted_event_id` has id 1882 not referring to any gameobject_template type 10 data2 field, type 3 data6 field, type 13 data 2 field, type 29 or any spell effect 61 or path taxi node data
DELETE FROM `scripted_event_id` WHERE `id`=1882;

-- ERROR:Table `game_graveyard_zone` has record for not existing graveyard (WorldSafeLocs.dbc id) 230, skipped.
DELETE FROM `game_graveyard_zone` WHERE `id`=230;

-- ERROR:Spell (Id: 9055) listed in `spell_target_position` does not have target TARGET_TABLE_X_Y_Z_COORDINATES (17).
DELETE FROM `spell_target_position` WHERE `Id`=9055;
-- ERROR:Spell (Id: 4170) listed in `spell_target_position` does not have target TARGET_TABLE_X_Y_Z_COORDINATES (17).
-- ERROR:Spell (Id: 4170) listed in `spell_target_position` does not have target TARGET_TABLE_X_Y_Z_COORDINATES (17).
-- ERROR:SPELL: unknown target coordinates for spell ID 17278
UPDATE `spell_target_position` SET `Id`=17278 WHERE `Id`=4170 && `target_map`=329;
DELETE FROM `spell_target_position` WHERE `Id`=4170;

-- ERROR:Spell 23048 listed in `spell_affect` have redundant (same with EffectItemType1) data for effect index (0) and not needed, skipped.
-- ERROR:Spell 24543 listed in `spell_affect` have redundant (same with EffectItemType1) data for effect index (0) and not needed, skipped.
-- ERROR:Spell 28851 listed in `spell_affect` have not SPELL_AURA_ADD_FLAT_MODIFIER (107) or SPELL_AURA_ADD_PCT_MODIFIER (108) or SPELL_AURA_ADD_TARGET_TRIGGER (109) or SPELL_AURA_OVERRIDE_CLASS_SCRIPTS (112) for effect index (0)
DELETE FROM `spell_affect` WHERE `entry` IN (23048, 24543, 28851);

-- ERROR:Spell 18271 (Shadow Mastery) misses spell_affect for effect 2
INSERT INTO `spell_affect` (`entry`, `effectId`, `SpellFamilyMask`) VALUES (18271, 1, 4295492618);
INSERT INTO `spell_affect` (`entry`, `effectId`, `SpellFamilyMask`) VALUES (18271, 2, 0);
-- ERROR:Spell 18272 (Shadow Mastery) misses spell_affect for effect 2
INSERT INTO `spell_affect` (`entry`, `effectId`, `SpellFamilyMask`) VALUES (18272, 1, 4295492618);
INSERT INTO `spell_affect` (`entry`, `effectId`, `SpellFamilyMask`) VALUES (18272, 2, 0);
-- ERROR:Spell 18273 (Shadow Mastery) misses spell_affect for effect 2
INSERT INTO `spell_affect` (`entry`, `effectId`, `SpellFamilyMask`) VALUES (18273, 1, 4295492618);
INSERT INTO `spell_affect` (`entry`, `effectId`, `SpellFamilyMask`) VALUES (18273, 2, 0);
-- ERROR:Spell 18274 (Shadow Mastery) misses spell_affect for effect 2
INSERT INTO `spell_affect` (`entry`, `effectId`, `SpellFamilyMask`) VALUES (18274, 1, 4295492618);
INSERT INTO `spell_affect` (`entry`, `effectId`, `SpellFamilyMask`) VALUES (18274, 2, 0);
-- ERROR:Spell 18275 (Shadow Mastery) misses spell_affect for effect 2
INSERT INTO `spell_affect` (`entry`, `effectId`, `SpellFamilyMask`) VALUES (18275, 1, 4295492618);
INSERT INTO `spell_affect` (`entry`, `effectId`, `SpellFamilyMask`) VALUES (18275, 2, 0);

-- ERROR:Table 'creature_loot_template' entry 1913 item 5110: equal-chanced grouped entry, but group not defined - skipped
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4.74 WHERE `entry`=1913 && `item`=5110;
-- ERROR:Table 'creature_loot_template' entry 3577 item 5110: equal-chanced grouped entry, but group not defined - skipped
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4.08 WHERE `entry`=3577 && `item`=5110;
-- ERROR:Table 'creature_loot_template' entry 3578 item 5110: equal-chanced grouped entry, but group not defined - skipped
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=5.42 WHERE `entry`=3578 && `item`=5110;
-- ERROR:Table 'creature_loot_template' entry 10440 item 323250: zero chance is specified for a reference, skipped
-- This reference loot template has the exact same items as 323249.
DELETE FROM `creature_loot_template` WHERE `item`=323250;
DELETE FROM `reference_loot_template` WHERE `entry`=323250;
-- ERROR:Table 'creature_loot_template' entry 10997 item 324204: zero chance is specified for a reference, skipped
-- This reference loot template has the exact same items as 324203.
DELETE FROM `creature_loot_template` WHERE `item`=324204;
DELETE FROM `reference_loot_template` WHERE `entry`=324204;
-- ERROR:Table 'creature_loot_template' entry 15505 item 21156: equal-chanced grouped entry, but group not defined - skipped
-- ERROR:Table 'creature_loot_template' entry 15505 item 2450: equal-chanced grouped entry, but group not defined - skipped
-- Wowhead and Allakhazam comments say they don't drop anything.
DELETE FROM `creature_loot_template` WHERE `entry`=15505;
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=15505;
-- ERROR:Table 'creature_loot_template' entry 14690 item 12843: equal-chanced grouped entry, but group not defined - skipped
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=100, `condition_id`=17 WHERE `entry`=14690 && `item`=12843;
-- ERROR:Table 'creature_loot_template' entry 10184 item 322542: zero chance is specified for a reference, skipped
-- This reference loot template has the exact same items as 322540.
DELETE FROM `creature_loot_template` WHERE `item`=322542;
DELETE FROM `reference_loot_template` WHERE `entry`=322542;
-- ERROR:Table 'creature_loot_template' entry 10184 item 322543: zero chance is specified for a reference, skipped
-- This reference loot template has the exact same items as 322541.
DELETE FROM `creature_loot_template` WHERE `item`=322543;
DELETE FROM `reference_loot_template` WHERE `entry`=322543;
-- ERROR:Table 'creature_loot_template' entry 11502 item 324927: zero chance is specified for a reference, skipped
-- This reference loot template has the exact same items as 324925.
DELETE FROM `creature_loot_template` WHERE `item`=324927;
DELETE FROM `reference_loot_template` WHERE `entry`=324927;
-- ERROR:Table 'creature_loot_template' entry 11502 item 324926: zero chance is specified for a reference, skipped
DELETE FROM `creature_loot_template` WHERE `item`=324926;
DELETE FROM `reference_loot_template` WHERE `entry`=324926;
-- ERROR:Table 'creature_loot_template' entry 14325 item 21982: max count (1) less that min count (3) - skipped
DELETE FROM `creature_loot_template` WHERE `entry`=14325 && `item`=21982;
-- ERROR:Table 'creature_loot_template' entry 14344 item 11172: equal-chanced grouped entry, but group not defined - skipped
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-45 WHERE `entry`=14344 && `item`=11172;
-- ERROR:Table 'creature_loot_template' entry 14345 item 12230: equal-chanced grouped entry, but group not defined - skipped
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=14345 && `item`=12230;
-- ERROR:Table 'creature_loot_template' entry 11502 item 324924: zero chance is specified for a reference, skipped
DELETE FROM `creature_loot_template` WHERE `item`=324924;
DELETE FROM `reference_loot_template` WHERE `entry`=324924;
-- ERROR:Table 'creature_loot_template' entry 11502 item 324922: zero chance is specified for a reference, skipped
DELETE FROM `creature_loot_template` WHERE `item`=324922;
DELETE FROM `reference_loot_template` WHERE `entry`=324922;
-- ERROR:Table 'creature_loot_template' entry 15348 item 329109: zero chance is specified for a reference, skipped
-- This reference loot template has the exact same items as 329107.
DELETE FROM `creature_loot_template` WHERE `item`=329109;
DELETE FROM `reference_loot_template` WHERE `entry`=329109;
-- ERROR:Table 'creature_loot_template' entry 13097 group 10 has total chance > 100% (200.000000)
UPDATE `creature_loot_template` SET `groupid`=0 WHERE `entry`=13097 && `groupid`=10;
-- ERROR:Table 'creature_loot_template' entry 13316 group 10 has total chance > 100% (200.000000)
UPDATE `creature_loot_template` SET `groupid`=0 WHERE `entry`=13316 && `groupid`=10;
-- ERROR:Table 'creature_loot_template' entry 13089 group 10 has total chance > 100% (200.000000)
UPDATE `creature_loot_template` SET `groupid`=0 WHERE `entry`=13089 && `groupid`=10;

-- ERROR:Table 'creature_loot_template' entry 266 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=266;
-- ERROR:Table 'creature_loot_template' entry 7307 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=7307;
-- ERROR:Table 'creature_loot_template' entry 7308 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=7308;
-- ERROR:Table 'creature_loot_template' entry 7310 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=7310;
-- ERROR:Table 'creature_loot_template' entry 1840 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=1840 WHERE `entry`=1840;
-- ERROR:Table 'creature_loot_template' entry 4255 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=4255;
-- ERROR:Table 'creature_loot_template' entry 5134 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=5134;
-- ERROR:Table 'creature_loot_template' entry 5135 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=5135;
-- ERROR:Table 'creature_loot_template' entry 5139 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=5139;
-- ERROR:Table 'creature_loot_template' entry 5983 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=5983 WHERE `entry`=5983;
-- ERROR:Table 'creature_loot_template' entry 7168 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=7168;
-- ERROR:Table 'creature_loot_template' entry 8257 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=8257 WHERE `entry`=8257;
-- ERROR:Table 'creature_loot_template' entry 8889 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=8889 WHERE `entry`=8889;
-- ERROR:Table 'creature_loot_template' entry 8890 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=8890 WHERE `entry`=8890;
-- ERROR:Table 'creature_loot_template' entry 10940 isn't creature entry and not referenced from loot, and then useless.
-- ERROR:Table 'pickpocketing_loot_template' entry 10940 isn't creature pickpocket lootid and not referenced from loot, and then useless.
UPDATE `creature_template` SET `pickpocketloot`=10940 WHERE `entry`=10940;
DELETE FROM `creature_loot_template` WHERE `entry`=10940;
INSERT INTO `pickpocketing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10940, 3419, 12.5, 0, 1, 1, 0);
-- ERROR:Table 'creature_loot_template' entry 10951 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=10951;
-- ERROR:Table 'creature_loot_template' entry 11357 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=11357 WHERE `entry`=11357;
-- ERROR:Table 'creature_loot_template' entry 11387 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=11387 WHERE `entry`=11387;
-- ERROR:Table 'creature_loot_template' entry 11388 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=11388 WHERE `entry`=11388;
-- ERROR:Table 'creature_loot_template' entry 11390 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=11390 WHERE `entry`=11390;
-- ERROR:Table 'creature_loot_template' entry 11391 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=11391 WHERE `entry`=11391;
-- ERROR:Table 'creature_loot_template' entry 11448 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=11448 WHERE `entry`=11448;
-- ERROR:Table 'creature_loot_template' entry 11661 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=11661 WHERE `entry`=11661;
-- ERROR:Table 'creature_loot_template' entry 11662 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=11662 WHERE `entry`=11662;
-- ERROR:Table 'creature_loot_template' entry 11663 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=11663 WHERE `entry`=11663;
-- ERROR:Table 'creature_loot_template' entry 11664 isn't creature entry and not referenced from loot, and then useless
UPDATE `creature_template` SET `lootid`=11664 WHERE `entry`=11664;
-- ERROR:Table 'creature_loot_template' entry 11669 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=11669;
-- ERROR:Table 'creature_loot_template' entry 11671 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=11671;
-- ERROR:Table 'creature_loot_template' entry 11672 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=11672;
-- ERROR:Table 'creature_loot_template' entry 11997 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=11997;
-- ERROR:Table 'creature_loot_template' entry 12096 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=12096;
-- ERROR:Table 'creature_loot_template' entry 12099 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=12099;
-- ERROR:Table 'creature_loot_template' entry 12119 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=12119 WHERE `entry`=12119;
-- ERROR:Table 'creature_loot_template' entry 13216 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=13216;
-- ERROR:Table 'creature_loot_template' entry 14370 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=14370 WHERE `entry`=14370;
-- ERROR:Table 'creature_loot_template' entry 14400 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=14400 WHERE `entry`=14400;
-- ERROR:Table 'creature_loot_template' entry 14826 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=14826;
-- ERROR:Table 'creature_loot_template' entry 14986 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=14986;
-- ERROR:Table 'creature_loot_template' entry 14987 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=14987;
-- ERROR:Table 'creature_loot_template' entry 15112 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=15112;
-- ERROR:Table 'creature_loot_template' entry 15146 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=15146;
-- ERROR:Table 'creature_loot_template' entry 15286 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=15286 WHERE `entry`=15286;
INSERT INTO `creature_loot_template` VALUES (15286, 20498, 10, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` VALUES (15286, 20500, 2, 0, 1, 1, 0);
-- ERROR:Table 'creature_loot_template' entry 15288 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=15288 WHERE `entry`=15288;
INSERT INTO `creature_loot_template` VALUES (15288, 20498, 10, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` VALUES (15288, 20500, 3, 0, 1, 1, 0);
-- ERROR:Table 'creature_loot_template' entry 15290 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=15290 WHERE `entry`=15290;
INSERT INTO `creature_loot_template` VALUES (15290, 20498, 15, 0, 1, 1, 0);
-- ERROR:Table 'creature_loot_template' entry 15361 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=15361;
-- ERROR:Table 'creature_loot_template' entry 15362 isn't creature entry and not referenced from loot, and then useless.
DELETE FROM `creature_loot_template` WHERE `entry`=15362;
-- ERROR:Table 'creature_loot_template' entry 15387 isn't creature entry and not referenced from loot, and then useless.
UPDATE `creature_template` SET `lootid`=15387 WHERE `entry`=15387;

-- ERROR:Table 'fishing_loot_template' entry 33 item 19807: equal-chanced grouped entry, but group not defined - skipped
UPDATE `fishing_loot_template` SET `groupid`=1 WHERE `entry`=33 && `item`=19807;

-- ERROR:Table 'gameobject_loot_template' entry 2560 isn't gameobject lootid and not referenced from loot, and then useless.
-- ERROR:Table 'gameobject_loot_template' entry 2032 isn't gameobject lootid and not referenced from loot, and then useless.
-- Loot table for this bottle in incomplete, adding data from cMaNGOS.
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (2032, 2560);
INSERT INTO `gameobject_loot_template` VALUES (2560, 1477, 2.5, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 1711, 4.2, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 2289, 2.7, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 2290, 4.4, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 3608, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 3830, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 3866, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 3867, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 3868, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 3869, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 3870, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 3872, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 3874, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 4098, 25, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 4100, 15.5, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 4101, 16.3, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 4102, 17.2, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 4298, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 4299, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 4350, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 4351, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 4352, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 4412, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 4414, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 4416, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 4417, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 5543, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 5774, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 6045, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 6454, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 7085, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 7090, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 7360, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 7363, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 7364, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 7449, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 7450, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 7975, 0.1, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 7992, 0.0508056, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 8029, 0.0508056, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 8385, 0.0508056, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 8386, 0.0580636, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 8387, 0.0725795, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 9293, 0.0435477, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 10300, 0.1, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 10301, 0.1, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 10302, 0.0653215, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 10312, 0.0290318, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 10424, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 10601, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 10603, 0.0362897, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 10604, 0.0653215, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 10606, 0.1, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 11098, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 11164, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 11165, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 11167, 0.02, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 11202, 0.0290318, 0, 1, 1, 0);
INSERT INTO `gameobject_loot_template` VALUES (2560, 11204, 0.1, 0, 1, 1, 0);
UPDATE `gameobject_template` SET `data1`=2560 WHERE `entry`=2560;
-- ERROR:Table 'gameobject_loot_template' entry 15552 isn't gameobject lootid and not referenced from loot, and then useless.
DELETE FROM `gameobject_loot_template` WHERE `entry`=15552;
-- ERROR:Table 'gameobject_loot_template' entry 179644 isn't gameobject lootid and not referenced from loot, and then useless.
DELETE FROM `gameobject_loot_template` WHERE `entry`=179644;

-- ERROR:Table 'pickpocketing_loot_template' entry 11448 isn't creature pickpocket lootid and not referenced from loot, and then useless.
UPDATE `creature_template` SET `pickpocketloot`=11448 WHERE `entry`=11448;

-- ERROR:Table 'skinning_loot_template' entry 1511 (creature skinning id) not exist but used as loot id in DB.
INSERT INTO `skinning_loot_template` VALUES (1511, 4304, 22.8, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (1511, 4234, 19.4, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (1511, 8169, 1.95, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (1511, 4235, 1.33, 0, 1, 1, 0);
-- ERROR:Table 'skinning_loot_template' entry 1514 (creature skinning id) not exist but used as loot id in DB.
INSERT INTO `skinning_loot_template` VALUES (1514, 4304, 10, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (1514, 4234, 9.43, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (1514, 4235, 1.95, 0, 1, 1, 0);
-- ERROR:Table 'skinning_loot_template' entry 1516 (creature skinning id) not exist but used as loot id in DB.
INSERT INTO `skinning_loot_template` VALUES (1516, 4304, 46.56, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (1516, 4234, 44.46, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (1516, 8169, 4.35, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (1516, 4235, 3.39, 0, 1, 1, 0);
-- ERROR:Table 'skinning_loot_template' entry 3619 (creature skinning id) not exist but used as loot id in DB.
INSERT INTO `skinning_loot_template` VALUES (3619, 2318, 19.28, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (3619, 2319, 3.71, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (3619, 783, 1.17, 0, 1, 1, 0);
-- ERROR:Table 'skinning_loot_template' entry 5720 (creature skinning id) not exist but used as loot id in DB.
INSERT INTO `skinning_loot_template` VALUES (5720, 4304, 26.84, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (5720, 8165, 99.4318, 0, 1, 2, 0);
INSERT INTO `skinning_loot_template` VALUES (5720, 8169, 20.1705, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (5720, 8170, 96.875, 0, 2, 3, 0);
INSERT INTO `skinning_loot_template` VALUES (5720, 15412, 99.1477, 0, 2, 3, 0);
-- ERROR:Table 'skinning_loot_template' entry 5721 (creature skinning id) not exist but used as loot id in DB.
INSERT INTO `skinning_loot_template` VALUES (5721, 4304, 27.34, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (5721, 8165, 98.2558, 0, 1, 2, 0);
INSERT INTO `skinning_loot_template` VALUES (5721, 8169, 19.186, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (5721, 8170, 97.093, 0, 2, 3, 0);
INSERT INTO `skinning_loot_template` VALUES (5721, 15412, 98.5465, 0, 2, 3, 0);
-- ERROR:Table 'skinning_loot_template' entry 15286 (creature skinning id) not exist but used as loot id in DB.
INSERT INTO `skinning_loot_template` VALUES (15286, 20498, 11.54, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (15286, 20501, 3.04, 0, 1, 1, 0);
-- ERROR:Table 'skinning_loot_template' entry 15288 (creature skinning id) not exist but used as loot id in DB.
INSERT INTO `skinning_loot_template` VALUES (15288, 20498, 10.17, 0, 1, 1, 0);
INSERT INTO `skinning_loot_template` VALUES (15288, 20500, 2.66, 0, 1, 1, 0);
-- ERROR:Table 'skinning_loot_template' entry 15290 (creature skinning id) not exist but used as loot id in DB.
INSERT INTO `skinning_loot_template` VALUES (15290, 20498, 15, 0, 1, 1, 0);
-- ERROR:Table 'skinning_loot_template' entry 15415 isn't creature skinning id and not referenced from loot, and then useless.
DELETE FROM `skinning_loot_template` WHERE `entry`=15415;

-- ERROR:Table 'reference_loot_template' entry 1001 item 27729: item entry not listed in `item_template` - skipped
DELETE FROM `reference_loot_template` WHERE `item`=27729;
-- ERROR:Table 'reference_loot_template' entry 301066 group 1 has total chance > 100% (140.000000)
-- ERROR:Table 'reference_loot_template' entry 301066 group 1 has items with chance=0% but group total chance >= 100% (140.000000)
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`=0 WHERE `entry`=301066;
-- ERROR:Table 'reference_loot_template' entry 322689 group 1 has items with chance=0% but group total chance >= 100% (100.000000)
-- This loot template is used by General Drakkisath. Drop chances from cMaNGOS to fix errors.
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`=18 WHERE `entry`=322689 && `item`=12602;
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`=18 WHERE `entry`=322689 && `item`=13098;
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`=0 WHERE `entry`=322689 && `item`=13141;
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`=18 WHERE `entry`=322689 && `item`=13142;
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`=8 WHERE `entry`=322689 && `item`=22268;
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`=18 WHERE `entry`=322689 && `item`=22269;
-- ERROR:Table 'reference_loot_template' entry 322690 group 2 has items with chance=0% but group total chance >= 100% (100.000000)
-- This loot template is used by General Drakkisath. Drop chances from cMaNGOS to fix errors.
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`=18 WHERE `entry`=322690 && `item`=12602;
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`=18 WHERE `entry`=322690 && `item`=13098;
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`=0 WHERE `entry`=322690 && `item`=13141;
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`=18 WHERE `entry`=322690 && `item`=13142;
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`=8 WHERE `entry`=322690 && `item`=22268;
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`=18 WHERE `entry`=322690 && `item`=22269;

-- ERROR:Table 'reference_loot_template' entry 300622 (reference id) not exist but used as loot id in DB.
DELETE FROM `creature_loot_template` WHERE `item`=300622;
-- ERROR:Table 'reference_loot_template' entry 330013 (reference id) not exist but used as loot id in DB.
INSERT INTO `reference_loot_template` VALUES (330013, 23177, 0, 1, 1, 1, 0);
INSERT INTO `reference_loot_template` VALUES (330013, 23178, 0, 1, 1, 1, 0);
-- ERROR:Table 'reference_loot_template' entry 1004 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 2004 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 11000 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 11101 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 11102 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 11103 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 11104 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 11105 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 11106 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 12007 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 14000 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 14500 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24017 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24018 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24020 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24021 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24025 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24026 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24027 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24029 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24030 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24031 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24033 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24034 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24036 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24037 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24038 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24039 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24040 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24041 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24042 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24043 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24044 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24045 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24046 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24047 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24048 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24049 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24050 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24051 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24052 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24053 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24054 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24055 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24056 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24057 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24058 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24059 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24060 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24061 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24062 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24063 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24064 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24065 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24066 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24067 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24068 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24069 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24070 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24071 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24073 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24074 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24075 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24076 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24077 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24078 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24079 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24080 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24081 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24082 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24083 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24084 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24085 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24086 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24088 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24089 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24091 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 24722 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34001 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34002 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34003 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34004 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34005 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34006 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34007 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34008 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34009 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34012 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34013 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34014 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34015 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34024 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34025 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34026 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34027 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34028 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34029 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34032 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34033 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34034 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34035 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34036 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34037 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34038 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34039 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34040 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34041 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34042 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34043 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34044 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34045 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34046 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34047 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34048 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34049 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34050 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34051 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34052 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34053 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34054 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34055 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34086 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34087 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34088 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34089 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 34090 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35009 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35010 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35011 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35012 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35013 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35014 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35016 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35017 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35018 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35019 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35020 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35021 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35023 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35025 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35026 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35028 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35030 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 35031 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 112397 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 115021 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 115022 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 115023 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 115024 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 119821 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 119881 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 120561 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 120571 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 120981 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 121181 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 122591 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 122641 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 152031 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 152041 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 152051 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 153051 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172591 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172592 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172593 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172594 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172595 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172596 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172597 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172598 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172599 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172601 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172602 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172603 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172604 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172605 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172606 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 172607 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173000 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173001 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173002 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173003 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173004 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173006 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173007 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173008 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173009 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173010 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173011 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173012 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173013 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173014 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173016 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173017 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173018 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173019 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173022 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173023 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173024 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173026 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173027 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173028 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173030 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173031 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173032 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173033 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173034 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173035 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173036 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173037 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173040 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173041 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173042 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173043 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173044 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173045 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173046 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173048 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173049 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173050 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173051 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173061 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173062 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173063 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173064 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173065 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173066 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173067 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173069 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173070 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173071 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173072 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173080 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173081 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173082 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173083 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173084 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173085 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173086 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173088 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173089 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173100 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173101 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173102 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173103 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173104 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173105 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173106 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173107 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173108 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173109 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173110 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173111 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173112 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173120 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173121 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173122 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173123 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173124 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173125 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173126 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173127 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173128 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173129 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173200 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173201 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173202 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173203 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 173204 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174000 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174001 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174002 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174003 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174004 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174005 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174006 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174008 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174009 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174010 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174011 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174012 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174020 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174021 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174022 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174023 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174024 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174025 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174026 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174028 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174030 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174031 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174041 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174042 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174051 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174052 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174061 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174062 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174070 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174071 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174072 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174073 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174074 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174075 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174076 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174078 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174079 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174080 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174081 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174082 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174083 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174084 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 174085 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175001 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175002 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175003 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175004 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175005 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175007 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175011 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175012 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175013 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175014 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175015 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175016 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175017 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175019 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175020 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175022 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175023 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175030 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175031 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175032 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175033 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175034 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175035 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175037 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175041 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175042 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175051 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 175052 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300000 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300003 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300103 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300104 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300105 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300106 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300107 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300152 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300155 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300192 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300217 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300256 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300266 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300267 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300296 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300297 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300298 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300299 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300300 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300307 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300308 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300309 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300310 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300311 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300312 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300314 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300315 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300316 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300317 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300318 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300319 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300320 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300321 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300322 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300323 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300332 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300333 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300334 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300335 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300342 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300366 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300417 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300441 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300458 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300503 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300547 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300599 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300607 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300684 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300708 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300785 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300787 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300788 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300815 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300845 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300862 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300939 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300962 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300982 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 300999 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301050 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301074 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301100 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301101 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301122 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301131 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301164 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301165 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301257 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301274 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301280 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301305 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301346 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301549 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301597 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301642 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301652 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301653 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301677 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301877 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 301898 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302088 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302117 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302118 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302228 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302229 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302247 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302273 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302301 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302311 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302384 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302422 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302512 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302560 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302597 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302689 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302759 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302765 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302894 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302955 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302981 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 302988 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303079 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303104 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303110 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303123 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303129 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303143 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303185 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303218 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303280 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303312 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303631 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303632 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303685 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303733 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303785 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303797 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303810 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303892 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303928 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303970 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 303975 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304044 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304045 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304115 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304130 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304149 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304172 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304187 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304202 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304246 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304260 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304261 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304283 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304345 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304372 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304384 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304395 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304424 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304425 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304440 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304441 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304443 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304450 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304455 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304456 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304474 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304558 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304574 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304721 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304735 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304789 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304949 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 304982 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305084 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305098 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305138 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305167 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305194 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305212 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305235 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305236 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305247 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305280 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305281 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305294 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305321 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305338 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305358 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305468 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305527 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305528 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305555 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305576 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305592 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305603 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305620 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305724 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305757 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305765 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305863 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305870 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 305872 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306017 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306093 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306100 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306141 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306153 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306371 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306537 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306549 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306552 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306609 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306621 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306622 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306635 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306679 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306759 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306784 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306800 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306831 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306844 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306853 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 306916 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307163 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307443 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307458 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307486 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307524 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307551 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307611 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307623 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307624 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307625 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307626 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307641 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307646 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307655 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307656 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307657 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307683 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307692 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307701 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307791 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307804 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307821 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307822 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307824 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307825 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307826 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307827 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307828 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307830 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307831 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307832 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307833 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307834 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307835 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307840 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307841 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307842 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307843 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307844 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307845 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307846 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307847 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307848 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307849 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307850 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307851 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307852 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307853 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307854 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307856 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307857 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307858 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307859 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307860 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307861 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307862 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307863 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307864 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307865 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307867 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307868 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307869 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307870 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307871 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307910 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 307991 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308023 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308329 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308345 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308358 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308407 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308421 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308426 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308438 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308460 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308476 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308488 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308494 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308495 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308552 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308575 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308576 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308644 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308706 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308788 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308837 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308899 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308985 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 308990 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309087 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309091 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309092 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309093 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309095 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309096 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309097 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309098 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309099 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309100 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309101 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309102 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309103 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309112 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309113 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309114 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309115 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309122 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309172 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309249 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309598 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309698 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309748 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309753 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309754 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309758 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309847 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309990 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 309991 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310031 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310032 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310207 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310256 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310339 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310449 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310548 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310563 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310574 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310575 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310576 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310578 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310579 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310580 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310581 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310582 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310583 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310584 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310585 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310586 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310778 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310837 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310863 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310925 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310986 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 310996 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311009 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311036 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311043 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311044 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311063 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311064 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311073 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311080 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311086 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311138 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311185 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311204 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311371 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311631 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311637 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311643 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311655 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311765 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311836 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311839 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311904 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311917 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311920 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311974 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 311975 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312063 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312096 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312142 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312272 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312359 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312370 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312440 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312505 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312544 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312553 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312672 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312871 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312920 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312922 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312946 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312975 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 312988 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 313028 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 313104 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 313206 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 313212 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 313769 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314172 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314373 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314697 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314833 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314843 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314863 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314937 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314938 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314943 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314944 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314951 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314967 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314968 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314973 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314974 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314983 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 314984 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315015 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315016 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315022 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315023 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315028 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315242 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315243 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315441 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315643 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315711 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315712 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315713 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315714 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315720 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315721 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315722 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315723 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315724 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315725 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 315852 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316007 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316008 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316213 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316280 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316324 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316522 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316577 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316578 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316579 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316593 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316598 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316608 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316865 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316866 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316867 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316868 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 316985 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317001 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317109 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317118 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317124 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317134 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317152 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317168 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317183 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317198 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317213 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317248 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317343 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317388 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317403 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317406 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317446 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317448 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317507 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317541 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317593 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317594 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 317916 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318023 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318058 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318215 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318216 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318229 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318261 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318278 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318279 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318312 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318333 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318334 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318343 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318364 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318395 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318420 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318432 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318435 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318458 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318508 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318544 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318565 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318582 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318595 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318609 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318622 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318625 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318638 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318652 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318668 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318696 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318722 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318725 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318748 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318761 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318762 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318776 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318798 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318812 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318814 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318827 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318830 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318856 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318877 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318893 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318908 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318922 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318925 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318976 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 318991 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319067 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319073 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319084 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319104 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319281 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319282 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319467 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319468 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319531 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319699 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319736 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319794 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319878 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319890 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319902 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319912 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319915 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319946 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319962 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 319974 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320030 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320032 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320048 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320072 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320081 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320094 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320120 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320121 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320139 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320151 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320169 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320214 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320273 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320285 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320311 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320374 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320417 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320429 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320441 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320465 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320477 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320490 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320660 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320782 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320794 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320832 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320842 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320877 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320887 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 320923 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321185 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321225 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321262 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321287 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321299 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321315 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321406 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321420 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321433 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321447 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321474 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321477 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321493 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321508 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321524 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321537 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321551 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321565 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321581 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321594 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321596 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321609 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321611 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321624 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321637 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321650 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321665 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321679 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321693 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321708 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321776 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321793 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321802 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321828 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321844 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321860 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321886 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321900 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321902 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321917 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321946 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 321996 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322088 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322112 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322185 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322230 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322246 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322254 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322255 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322256 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322257 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322258 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322259 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322260 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322261 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322262 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322263 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322266 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322269 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322283 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322352 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322353 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322373 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322397 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322482 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322513 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322525 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322547 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322552 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322558 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322563 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322570 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322578 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322590 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322735 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322739 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322741 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322753 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322767 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322782 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322799 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322813 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322835 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322850 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322884 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322928 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322931 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322948 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322975 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322978 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 322995 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323009 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323029 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323058 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323103 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323106 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323119 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323122 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323135 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323138 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323252 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323255 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323256 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323282 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323285 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323317 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323329 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323332 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323345 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323348 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323366 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323369 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323385 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323419 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323435 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323446 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323449 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323514 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323546 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323559 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323661 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323729 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323740 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323766 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323781 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323841 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323858 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323859 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323989 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 323997 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324029 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324033 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324049 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324064 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324065 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324066 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324067 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324078 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324090 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324133 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324219 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324369 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324418 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324474 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324476 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324477 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324478 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324483 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324537 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324548 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324550 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324551 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324552 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324554 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324580 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324618 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324624 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324646 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324658 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324669 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324679 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324691 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324704 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324718 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324760 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324770 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324771 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324785 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324801 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324825 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324831 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324850 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 324997 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325059 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325136 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325165 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325294 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325400 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325417 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325420 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325448 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325458 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325475 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325586 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325599 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325610 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325621 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325637 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325645 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325657 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325668 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325688 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325696 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325867 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325933 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 325942 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326071 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326121 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326200 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326201 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326202 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326203 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326213 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326214 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326228 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326245 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326246 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326247 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326248 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326278 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326279 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326280 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326300 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326326 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326364 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326390 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326405 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326417 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326454 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326464 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326477 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326590 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326599 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 326691 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327008 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327044 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327080 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327083 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327234 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327237 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327260 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327272 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327283 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327293 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327314 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327327 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327344 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327351 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327397 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327402 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327454 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327471 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327487 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327490 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327497 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327552 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327558 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327566 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327660 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327667 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327673 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327689 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327701 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327741 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327797 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327832 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327848 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327863 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 327887 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328002 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328038 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328047 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328072 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328112 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328121 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328126 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328157 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328158 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328163 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328170 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328173 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328174 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328178 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328179 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328185 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328264 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328390 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328404 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328420 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328424 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328434 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328441 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328442 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328451 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328457 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328461 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328470 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328471 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328478 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328530 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328605 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 328635 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329071 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329075 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329076 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329081 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329083 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329084 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329090 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329092 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329093 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329108 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329110 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329111 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329123 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329125 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329126 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329131 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329133 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329134 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329278 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329284 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329285 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329321 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329351 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329356 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329357 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329358 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329371 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329372 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329373 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329374 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329388 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 329397 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 330068 isn't reference id and not referenced from loot, and then useless.
-- ERROR:Table 'reference_loot_template' entry 330069 isn't reference id and not referenced from loot, and then useless.
-- These loot templates are not used anywhere, so they might as well be deleted.
DELETE FROM `reference_loot_template` WHERE `entry` IN (1004, 2004, 11000, 11101, 11102, 11103, 11104, 11105, 11106, 12007, 14000, 14500, 24017, 24018, 24020, 24021, 24025, 24026, 24027, 24029, 24030, 24031, 24033, 24034, 24036, 24037, 24038, 24039, 24040, 24041, 24042, 24043, 24044, 24045, 24046, 24047, 24048, 24049, 24050, 24051, 24052, 24053, 24054, 24055, 24056, 24057, 24058, 24059, 24060, 24061, 24062, 24063, 24064, 24065, 24066, 24067, 24068, 24069, 24070, 24071, 24073, 24074, 24075, 24076, 24077, 24078, 24079, 24080, 24081, 24082, 24083, 24084, 24085, 24086, 24088, 24089, 24091, 24722, 34001, 34002, 34003, 34004, 34005, 34006, 34007, 34008, 34009, 34012, 34013, 34014, 34015, 34024, 34025, 34026, 34027, 34028, 34029, 34032, 34033, 34034, 34035, 34036, 34037, 34038, 34039, 34040, 34041, 34042, 34043, 34044, 34045, 34046, 34047, 34048, 34049, 34050, 34051, 34052, 34053, 34054, 34055, 34086, 34087, 34088, 34089, 34090, 35009, 35010, 35011, 35012, 35013, 35014, 35016, 35017, 35018, 35019, 35020, 35021, 35023, 35025, 35026, 35028, 35030, 35031, 112397, 115021, 115022, 115023, 115024, 119821, 119881, 120561, 120571, 120981, 121181, 122591, 122641, 152031, 152041, 152051, 153051, 172591, 172592, 172593, 172594, 172595, 172596, 172597, 172598, 172599, 172601, 172602, 172603, 172604, 172605, 172606, 172607, 173000, 173001, 173002, 173003, 173004, 173006, 173007, 173008, 173009, 173010, 173011, 173012, 173013, 173014, 173016, 173017, 173018, 173019, 173022, 173023, 173024, 173026, 173027, 173028, 173030, 173031, 173032, 173033, 173034, 173035, 173036, 173037, 173040, 173041, 173042, 173043, 173044, 173045, 173046, 173048, 173049, 173050, 173051, 173061, 173062, 173063, 173064, 173065, 173066, 173067, 173069, 173070, 173071, 173072, 173080, 173081, 173082, 173083, 173084, 173085, 173086, 173088, 173089, 173100, 173101, 173102, 173103, 173104, 173105, 173106, 173107, 173108, 173109, 173110, 173111, 173112, 173120, 173121, 173122, 173123, 173124, 173125, 173126, 173127, 173128, 173129, 173200, 173201, 173202, 173203, 173204, 174000, 174001, 174002, 174003, 174004, 174005, 174006, 174008, 174009, 174010, 174011, 174012, 174020, 174021, 174022, 174023, 174024, 174025, 174026, 174028, 174030, 174031, 174041, 174042, 174051, 174052, 174061, 174062, 174070, 174071, 174072, 174073, 174074, 174075, 174076, 174078, 174079, 174080, 174081, 174082, 174083, 174084, 174085, 175001, 175002, 175003, 175004, 175005, 175007, 175011, 175012, 175013, 175014, 175015, 175016, 175017, 175019, 175020, 175022, 175023, 175030, 175031, 175032, 175033, 175034, 175035, 175037, 175041, 175042, 175051, 175052, 300000, 300003, 300103, 300104, 300105, 300106, 300107, 300152, 300155, 300192, 300217, 300256, 300266, 300267, 300296, 300297, 300298, 300299, 300300, 300307, 300308, 300309, 300310, 300311, 300312, 300314, 300315, 300316, 300317, 300318, 300319, 300320, 300321, 300322, 300323, 300332, 300333, 300334, 300335, 300342, 300366, 300417, 300441, 300458, 300503, 300547, 300599, 300607, 300684, 300708, 300785, 300787, 300788, 300815, 300845, 300862, 300939, 300962, 300982, 300999, 301050, 301074, 301100, 301101, 301122, 301131, 301164, 301165, 301257, 301274, 301280, 301305, 301346, 301549, 301597, 301642, 301652, 301653, 301677, 301877, 301898, 302088, 302117, 302118, 302228, 302229, 302247, 302273, 302301, 302311, 302384, 302422, 302512, 302560, 302597, 302689, 302759, 302765, 302894, 302955, 302981, 302988, 303079, 303104, 303110, 303123, 303129, 303143, 303185, 303218, 303280, 303312, 303631, 303632, 303685, 303733, 303785, 303797, 303810, 303892, 303928, 303970, 303975, 304044, 304045, 304115, 304130, 304149, 304172, 304187, 304202, 304246, 304260, 304261, 304283, 304345, 304372, 304384, 304395, 304424, 304425, 304440, 304441, 304443, 304450, 304455, 304456, 304474, 304558, 304574, 304721, 304735, 304789, 304949, 304982, 305084, 305098, 305138, 305167, 305194, 305212, 305235, 305236, 305247, 305280, 305281, 305294, 305321, 305338, 305358, 305468, 305527, 305528, 305555, 305576, 305592, 305603, 305620, 305724, 305757, 305765, 305863, 305870, 305872, 306017, 306093, 306100, 306141, 306153, 306371, 306537, 306549, 306552, 306609, 306621, 306622, 306635, 306679, 306759, 306784, 306800, 306831, 306844, 306853, 306916, 307163, 307443, 307458, 307486, 307524, 307551, 307611, 307623, 307624, 307625, 307626, 307641, 307646, 307655, 307656, 307657, 307683, 307692, 307701, 307791, 307804, 307821, 307822, 307824, 307825, 307826, 307827, 307828, 307830, 307831, 307832, 307833, 307834, 307835, 307840, 307841, 307842, 307843, 307844, 307845, 307846, 307847, 307848, 307849, 307850, 307851, 307852, 307853, 307854, 307856, 307857, 307858, 307859, 307860, 307861, 307862, 307863, 307864, 307865, 307867, 307868, 307869, 307870, 307871, 307910, 307991, 308023, 308329, 308345, 308358, 308407, 308421, 308426, 308438, 308460, 308476, 308488, 308494, 308495, 308552, 308575, 308576, 308644, 308706, 308788, 308837, 308899, 308985, 308990, 309087, 309091, 309092, 309093, 309095, 309096, 309097, 309098, 309099, 309100, 309101, 309102, 309103, 309112, 309113, 309114, 309115, 309122, 309172, 309249, 309598, 309698, 309748, 309753, 309754, 309758, 309847, 309990, 309991, 310031, 310032, 310207, 310256, 310339, 310449, 310548, 310563, 310574, 310575, 310576, 310578, 310579, 310580, 310581, 310582, 310583, 310584, 310585, 310586, 310778, 310837, 310863, 310925, 310986, 310996, 311009, 311036, 311043, 311044, 311063, 311064, 311073, 311080, 311086, 311138, 311185, 311204, 311371, 311631, 311637, 311643, 311655, 311765, 311836, 311839, 311904, 311917, 311920, 311974, 311975, 312063, 312096, 312142, 312272, 312359, 312370, 312440, 312505, 312544, 312553, 312672, 312871, 312920, 312922, 312946, 312975, 312988, 313028, 313104, 313206, 313212, 313769, 314172, 314373, 314697, 314833, 314843, 314863, 314937, 314938, 314943, 314944, 314951, 314967, 314968, 314973, 314974, 314983, 314984, 315015, 315016, 315022, 315023, 315028, 315242, 315243, 315441, 315643, 315711, 315712, 315713, 315714, 315720, 315721, 315722, 315723, 315724, 315725, 315852, 316007, 316008, 316213, 316280, 316324, 316522, 316577, 316578, 316579, 316593, 316598, 316608, 316865, 316866, 316867, 316868, 316985, 317001, 317109, 317118, 317124, 317134, 317152, 317168, 317183, 317198, 317213, 317248, 317343, 317388, 317403, 317406, 317446, 317448, 317507, 317541, 317593, 317594, 317916, 318023, 318058, 318215, 318216, 318229, 318261, 318278, 318279, 318312, 318333, 318334, 318343, 318364, 318395, 318420, 318432, 318435, 318458, 318508, 318544, 318565, 318582, 318595, 318609, 318622, 318625, 318638, 318652, 318668, 318696, 318722, 318725, 318748, 318761, 318762, 318776, 318798, 318812, 318814, 318827, 318830, 318856, 318877, 318893, 318908, 318922, 318925, 318976, 318991, 319067, 319073, 319084, 319104, 319281, 319282, 319467, 319468, 319531, 319699, 319736, 319794, 319878, 319890, 319902, 319912, 319915, 319946, 319962, 319974, 320030, 320032, 320048, 320072, 320081, 320094, 320120, 320121, 320139, 320151, 320169, 320214, 320273, 320285, 320311, 320374, 320417, 320429, 320441, 320465, 320477, 320490, 320660, 320782, 320794, 320832, 320842, 320877, 320887, 320923, 321185, 321225, 321262, 321287, 321299, 321315, 321406, 321420, 321433, 321447, 321474, 321477, 321493, 321508, 321524, 321537, 321551, 321565, 321581, 321594, 321596, 321609, 321611, 321624, 321637, 321650, 321665, 321679, 321693, 321708, 321776, 321793, 321802, 321828, 321844, 321860, 321886, 321900, 321902, 321917, 321946, 321996, 322088, 322112, 322185, 322230, 322246, 322254, 322255, 322256, 322257, 322258, 322259, 322260, 322261, 322262, 322263, 322266, 322269, 322283, 322352, 322353, 322373, 322397, 322482, 322513, 322525, 322547, 322552, 322558, 322563, 322570, 322578, 322590, 322735, 322739, 322741, 322753, 322767, 322782, 322799, 322813, 322835, 322850, 322884, 322928, 322931, 322948, 322975, 322978, 322995, 323009, 323029, 323058, 323103, 323106, 323119, 323122, 323135, 323138, 323252, 323255, 323256, 323282, 323285, 323317, 323329, 323332, 323345, 323348, 323366, 323369, 323385, 323419, 323435, 323446, 323449, 323514, 323546, 323559, 323661, 323729, 323740, 323766, 323781, 323841, 323858, 323859, 323989, 323997, 324029, 324033, 324049, 324064, 324065, 324066, 324067, 324078, 324090, 324133, 324219, 324369, 324418, 324474, 324476, 324477, 324478, 324483, 324537, 324548, 324550, 324551, 324552, 324554, 324580, 324618, 324624, 324646, 324658, 324669, 324679, 324691, 324704, 324718, 324760, 324770, 324771, 324785, 324801, 324825, 324831, 324850, 324997, 325059, 325136, 325165, 325294, 325400, 325417, 325420, 325448, 325458, 325475, 325586, 325599, 325610, 325621, 325637, 325645, 325657, 325668, 325688, 325696, 325867, 325933, 325942, 326071, 326121, 326200, 326201, 326202, 326203, 326213, 326214, 326228, 326245, 326246, 326247, 326248, 326278, 326279, 326280, 326300, 326326, 326364, 326390, 326405, 326417, 326454, 326464, 326477, 326590, 326599, 326691, 327008, 327044, 327080, 327083, 327234, 327237, 327260, 327272, 327283, 327293, 327314, 327327, 327344, 327351, 327397, 327402, 327454, 327471, 327487, 327490, 327497, 327552, 327558, 327566, 327660, 327667, 327673, 327689, 327701, 327741, 327797, 327832, 327848, 327863, 327887, 328002, 328038, 328047, 328072, 328112, 328121, 328126, 328157, 328158, 328163, 328170, 328173, 328174, 328178, 328179, 328185, 328264, 328390, 328404, 328420, 328424, 328434, 328441, 328442, 328451, 328457, 328461, 328470, 328471, 328478, 328530, 328605, 328635, 329071, 329075, 329076, 329081, 329083, 329084, 329090, 329092, 329093, 329108, 329110, 329111, 329123, 329125, 329126, 329131, 329133, 329134, 329278, 329284, 329285, 329321, 329351, 329356, 329357, 329358, 329371, 329372, 329373, 329374, 329388, 329397, 330068, 330069);

-- ERROR:Creature (Entry: 14322) has vendor_id = 84380 for nonexistent vendor template
UPDATE `creature_template` SET `vendor_id`=0 WHERE `entry`=14322;

-- ERROR:Table `creature_movement_scripts` contain unused script, id 5.
-- ERROR:Table `creature_movement_scripts` contain unused script, id 6.
-- ERROR:Table `creature_movement_scripts` contain unused script, id 7.
-- ERROR:Table `creature_movement_scripts` contain unused script, id 8.
-- ERROR:Table `creature_movement_scripts` contain unused script, id 9.
-- ERROR:Table `creature_movement_scripts` contain unused script, id 10.
DELETE FROM `creature_movement_scripts` WHERE `id` IN (5, 6, 7, 8, 9, 10);

-- ERROR:Table creature_movement contain path for creature guid 3574, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 3574, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 3574, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 3574, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 3574, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 3574, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 3574, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 3574, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 3574, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 3574, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 3574, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 3574, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 3574, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 3574, but this creature guid does not exist. Skipping.
DELETE FROM `creature_movement` WHERE `id`=3574;
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 54043, but this creature guid does not exist. Skipping.
DELETE FROM `creature_movement` WHERE `id`=54043;
-- ERROR:Table creature_movement contain path for creature guid 27589, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 27589, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 27589, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 27589, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 27589, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 27589, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 27589, but this creature guid does not exist. Skipping.
-- ERROR:Table creature_movement contain path for creature guid 27589, but this creature guid does not exist. Skipping.
DELETE FROM `creature_movement` WHERE `id`=27589;
-- ERROR:Table creature_movement for id 88430, point 2 have script_id 3 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement for id 88444, point 2 have script_id 3 that does not exist in `creature_movement_scripts`, ignoring
UPDATE `creature_movement` SET `script_id`=5 WHERE `id`=56655 && `script_id`=2;
UPDATE `creature_movement_scripts` SET `id`=5 WHERE `id`=2;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2, 1, 1, 22, 16145, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight Captain shout');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2, 3, 1, 36, 16145, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight buddy attacks combat dummy');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2, 5, 1, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight attacks combat dummy');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2, 12, 1, 36, 16146, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight buddy attacks combat dummy');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2, 13, 1, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight attacks combat dummy');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2, 20, 1, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight attacks combat dummy');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2, 21, 1, 36, 16146, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight buddy attacks combat dummy');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (3, 1, 1, 36, 16145, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight captain attacks');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (3, 2, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight parries');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (3, 5, 1, 1, 16145, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight captain talks');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (3, 7, 1, 36, 16145, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight captain attacks');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (3, 8, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight parries');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (3, 14, 1, 60, 16145, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight captain kicks');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (3, 15, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathknight parries');
-- ERROR:Creature (guidlow 28365, entry 4860) have invalid coordinates in his waypoint 4 (X: 172.876007, Y: 246.044998).
DELETE FROM `creature_movement` WHERE `id`=28365 && `point`=4;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (28365, 4, 171.195, 245.63, -29.3622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.29944, 0, 0);
-- ERROR:Table creature_movement has waypoint for creature guid 326 (entry 1718), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- ERROR:Table creature_movement has waypoint for creature guid 1012 (entry 705), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id` iN (326, 1012);
-- ERROR:Table creature_movement has waypoint for creature guid 3476 (entry 8404), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=3476;
-- ERROR:Table creature_movement has waypoint for creature guid 3477 (entry 7565), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=3477;
-- ERROR:Table creature_movement has waypoint for creature guid 3557 (entry 1199), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=225;
UPDATE `creature_movement` SET `id`=225 WHERE `id`=3557;
-- ERROR:Table creature_movement has waypoint for creature guid 3595 (entry 1125), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=3595;
-- ERROR:Table creature_movement has waypoint for creature guid 3596 (entry 1199), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=3596;
-- ERROR:Table creature_movement has waypoint for creature guid 4360 (entry 1127), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- These waypoints are for a missing mountaineer.
-- https://youtu.be/Yt51TayetcA?t=40s
-- https://youtu.be/4wIP0mdSVUA?t=7m30s
-- https://youtu.be/bt1svYlGhyc?t=4m3s
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (334, 853, 0, 1598, 0, -6264, 233.732, 395.641, 4.562, 300, 0, 10, 5121, 0, 0, 2, 0);
UPDATE `creature_movement` SET `id`=334 WHERE `id`=4360;
-- Not a startup error, but this Mountaineer should have random movement.
-- https://youtu.be/t1aKrsMehjc?t=2m59s
-- https://youtu.be/Yt51TayetcA?t=21s
-- https://youtu.be/Gv-QkC6_HiI?t=2m48s
-- https://youtu.be/Gv-QkC6_HiI?t=3m18s
-- https://youtu.be/Gv-QkC6_HiI?t=6m30s
-- https://youtu.be/Gv-QkC6_HiI?t=7m10s
-- https://youtu.be/4wIP0mdSVUA?t=7m51s
-- https://youtu.be/4wIP0mdSVUA?t=9m2s
-- https://youtu.be/bt1svYlGhyc?t=3m59s
UPDATE `creature` SET `MovementType`=1, `spawndist`=3 WHERE `guid`=398;
DELETE FROM `creature_movement` WHERE `id`=398;
-- Also not a startup error, but this mountaineer should pause at the top and bottom waypoints.
-- https://youtu.be/t1aKrsMehjc?t=3m16s
-- https://youtu.be/5C2yNnPOUjg?t=5m33s
UPDATE `creature_movement` SET `waittime`=20000 WHERE `id`=354 && (`point` IN (9, 17));
UPDATE `creature_movement` SET `orientation`=4.383 WHERE `id`=354 && `point`=17;
-- And they should walk slower. Walk speed is 1 in all other databases (cMaNGOS, MaNGOSZero, TrinityCore).
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=853;
-- ERROR:Table creature_movement has waypoint for creature guid 4361 (entry 1201), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=4361;
-- ERROR:Table creature_movement has waypoint for creature guid 4364 (entry 1127), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=4364;
-- ERROR:Table creature_movement has waypoint for creature guid 4377 (entry 1196), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=4377;
-- ERROR:Table creature_movement has waypoint for creature guid 4378 (entry 1115), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=4378;
-- ERROR:Table creature_movement has waypoint for creature guid 4522 (entry 1115), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=4522;
-- ERROR:Table creature_movement has waypoint for creature guid 5459 (entry 7027), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=5459;
-- ERROR:Table creature_movement has waypoint for creature guid 12596 (entry 7319), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=12596;
-- ERROR:Table creature_movement has waypoint for creature guid 15169 (entry 5798), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- ERROR:Table creature_movement has waypoint for creature guid 15246 (entry 5799), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- ERROR:Table creature_movement has waypoint for creature guid 17433 (entry 5800), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id` IN (15169, 15246, 17433);
-- ERROR:Table creature_movement has waypoint for creature guid 21572 (entry 4709), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=21572;
-- ERROR:Table creature_movement has waypoint for creature guid 26313 (entry 4812), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=26313;
-- ERROR:Table creature_movement has waypoint for creature guid 26329 (entry 12902), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=26329;
-- ERROR:Table creature_movement has waypoint for creature guid 27397 (entry 4809), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=27397;
-- ERROR:Table creature_movement has waypoint for creature guid 32905 (entry 3734), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
UPDATE `creature` SET `MovementType`=2, `currentwaypoint`=25 WHERE `guid`=32905;
-- ERROR:Table creature_movement has waypoint for creature guid 34224 (entry 12759), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=34224;
-- ERROR:Table creature_movement has waypoint for creature guid 34503 (entry 3815), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=34503;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 1, 2844.85, -1200.43, 178.398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531233, 2.82816, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 2, 2793.43, -1194.17, 172.117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531234, 3.02058, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 3, 2772.83, -1198.26, 169.981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531235, 3.26405, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 4, 2751.15, -1186.84, 165.39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531236, 2.65144, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 5, 2778.29, -1198.74, 170.837, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531237, 5.89121, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 6, 2815.46, -1193.78, 174.104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531238, 0.130311, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 7, 2869.34, -1209.2, 180.142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531239, 5.917246, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 8, 2909.21, -1222.95, 184.507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531240, 5.98153, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 9, 2931.65, -1242.74, 190.228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531241, 5.55742, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 10, 2928.67, -1275.31, 196.366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531242, 4.59138, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 11, 2909.35, -1301.95, 202.981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531243, 4.20261, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 12, 2908.43, -1340.25, 205.201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531244, 4.70526, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 13, 2894.78, -1353.82, 207.496, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531245, 4.05338, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 14, 2893.27, -1388.83, 208.223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531246, 4.7406, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 15, 2894.1, -1353.33, 207.675, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531227, 4.6817, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 16, 2908.07, -1336.74, 205.473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531228, 1.36732, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 17, 2908.61, -1301.22, 203.044, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531229, 1.55581, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 18, 2932.29, -1268.03, 194.82, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531230, 0.951055, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 19, 2932.02, -1246.16, 190.908, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531231, 1.5833, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (34503, 20, 2907.27, -1220.66, 183.909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531232, 2.74176, 0, 0);
-- This npc was spawned underground.
UPDATE `creature` SET `position_z`=181.264, `MovementType`=2, `currentwaypoint`=6 WHERE `guid`=34503;
-- ERROR:Table creature_movement has waypoint for creature guid 35291 (entry 6188), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=35291;
-- ERROR:Table creature_movement has waypoint for creature guid 38347 (entry 2914), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=38347;
-- ERROR:Table creature_movement has waypoint for creature guid 39540 (entry 2914), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=39540;
-- ERROR:Table creature_movement has waypoint for creature guid 43202 (entry 15542), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- ERROR:Table creature_movement has waypoint for creature guid 43203 (entry 15542), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id` in (43202, 43203);
-- ERROR:Table creature_movement has waypoint for creature guid 46818 (entry 7318), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=46818;
-- ERROR:Table creature_movement has waypoint for creature guid 48805 (entry 10432), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=48805;
-- ERROR:Table creature_movement has waypoint for creature guid 48812 (entry 10495), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=48812;
-- ERROR:Table creature_movement has waypoint for creature guid 49525 (entry 3562), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- She should stop at 4 different spots. http://db.vanillagaming.org/?npc=3562
UPDATE `creature_movement` SET `waittime`=30000 WHERE `id`=49525 && (`point` IN (23, 48, 53, 60));
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=49525;
-- ERROR:Table creature_movement has waypoint for creature guid 49853 (entry 2039), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=49853;
-- ERROR:Table creature_movement has waypoint for creature guid 51882 (entry 10641), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
UPDATE `creature` SET `MovementType`=2, `currentwaypoint`=6 WHERE `guid`=51882;
-- ERROR:Table creature_movement has waypoint for creature guid 52348 (entry 12864), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=52348;
-- ERROR:Table creature_movement has waypoint for creature guid 86278 (entry 8506), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=86278;
-- ERROR:Table creature_movement has waypoint for creature guid 87486 (entry 4422), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- Moving waypoints to creature_movement_template to fix startup error.
DELETE FROM `creature_movement` WHERE `id`=87486;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (4422, 1, 1994.4, 1976.44, 63.292, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531187, 0, 0, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (4422, 2, 2017.38, 2002.92, 61.6866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531188, 0, 0, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (4422, 3, 2031.22, 2017.13, 59.7285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531189, 4.00557, 0, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (4422, 4, 2053.52, 2016.94, 61.977, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 2531190, 5.99253, 0, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (4422, 5, 2027.19, 2007.78, 60.0437, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2531191, 3.9395, 0, 0);
-- ERROR:Table creature_movement has waypoint for creature guid 92288 (entry 13118), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- ERROR:Table creature_movement has waypoint for creature guid 92289 (entry 13118), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- ERROR:Table creature_movement has waypoint for creature guid 92290 (entry 13118), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- ERROR:Table creature_movement has waypoint for creature guid 92291 (entry 13118), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id` IN (92288, 92289, 92290, 92291);
-- ERROR:Table creature_movement has waypoint for creature guid 56944 (entry 14325), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id`=56944;
-- ERROR:Table creature_movement has waypoint for creature guid 1068244 (entry 13996), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- ERROR:Table creature_movement has waypoint for creature guid 1068245 (entry 13996), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- ERROR:Table creature_movement has waypoint for creature guid 1068246 (entry 13996), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- ERROR:Table creature_movement has waypoint for creature guid 1068497 (entry 13996), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- ERROR:Table creature_movement has waypoint for creature guid 1068498 (entry 13996), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- ERROR:Table creature_movement has waypoint for creature guid 1068499 (entry 13996), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
DELETE FROM `creature_movement` WHERE `id` IN (1068244, 1068245, 1068246, 1068497, 1068498, 1068499);
-- ERROR:Table creature_movement has waypoint for creature guid 1242569 (entry 15471), but MovementType is not WAYPOINT_MOTION_TYPE(2). Creature will not use this path.
-- Moving waypoints to creature_movement_template to fix startup error.
DELETE FROM `creature_movement` WHERE `id`=1242569;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (15471, 1, -8873.42, 1647.37, 21.386, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2532238, 4.25, 0, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (15471, 2, -8872, 1628, 21.386, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2532239, 4.25, 0, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (15471, 3, -8880.91, 1609.5, 21.39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2532240, 4.25, 0, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (15471, 4, -8888.38, 1594.55, 21.39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2532241, 3.9, 0, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (15471, 5, -8910.06, 1569.82, 21.39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2532242, 3.79, 0, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (15471, 6, -8921.73, 1560.8, 21.39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2532243, 3.65, 0, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (15471, 7, -8939.8, 1550.3, 21.58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2532244, 3.65, 0, 0);
-- ERROR:WaypointMovementGenerator::LoadPath: creature Dark Iron Sentry (Entry: 8504 GUID: 1068041) doesn't have waypoint path
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 1, -6960.29, -1492.84, 240.889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 2, -6952.91, -1487.77, 237.459, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 3, -6943.72, -1481.36, 235.703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 4, -6933.95, -1474.52, 236.608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 5, -6926.97, -1469.5, 238.673, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 6, -6922.74, -1465.83, 239.105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 7, -6922.76, -1461.35, 238.803, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 8, -6923.38, -1454.85, 237.967, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 9, -6923.76, -1450.15, 239.771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 10, -6925, -1442.99, 240.014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 11, -6923.98, -1450.39, 239.736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 12, -6923.9, -1454.68, 238.072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 13, -6923.36, -1459.51, 238.369, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 14, -6922.67, -1467.14, 239.105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 15, -6928.2, -1471.24, 238.41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 16, -6935.1, -1476.03, 236.311, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 17, -6942.19, -1480.88, 235.677, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1068041, 18, -6954.62, -1489.26, 238.144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ERROR:Table creature_movement_template for entry 412, point 69 have script_id 41202 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 412, point 91 have script_id 41203 that does not exist in `creature_movement_scripts`, ignoring
-- These are old waypoints for Stitches. Not needed anymore as script is using the ones from script_waypoint table.
DELETE FROM `creature_movement_template` WHERE `entry`=412;
-- ERROR:Table creature_movement_template for entry 1533, point 37 have script_id 153301 that does not exist in `creature_movement_scripts`, ignoring
-- Waypoints are not used, creature has another one in creature_movement.
DELETE FROM `creature_movement_template` WHERE `entry`=1533;
-- ERROR:Table creature_movement_template for entry 1737, point 11 have script_id 173701 that does not exist in `creature_movement_scripts`, ignoring
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (173701, 0, 20, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Oliver movement changed to 1:random');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (173701, 35, 20, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Oliver movement changed to 2:waypoint');
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=28706;
-- ERROR:Table creature_movement_template for entry 1739, point 7 have script_id 173901 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 1739, point 8 have script_id 173902 that does not exist in `creature_movement_scripts`, ignoring
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (173901, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phillip - RUN ON');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (173902, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phillip - RUN OFF');
DELETE FROM `creature_movement` WHERE `id`=28705;
-- Not a startup error, but Deathguard Bartrand should have random movement.
-- https://youtu.be/kyhxG73DG5g?t=4m39s
-- https://youtu.be/rUiH7sBo_WE?t=6s
UPDATE `creature` SET `MovementType`=1, `spawndist`=3 WHERE `guid`=28498;
-- ERROR:Table creature_movement_template for entry 1754, point 6 have script_id 175401 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 1754, point 7 have script_id 175402 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 1754, point 12 have script_id 175403 that does not exist in `creature_movement_scripts`, ignoring
-- Waypoints are not used, creature has another one in script_waypoint.
DELETE FROM `creature_movement_template` WHERE `entry`=1754;
-- ERROR:Table creature_movement_template for entry 1755, point 4 have script_id 175501 that does not exist in `creature_movement_scripts`, ignoring
DELETE FROM `creature_movement_template` WHERE `entry`=1755;
-- ERROR:Table creature_movement_template for entry 2983, point 2 have script_id 298301 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 2983, point 30 have script_id 298302 that does not exist in `creature_movement_scripts`, ignoring
-- Waypoints are not used, creature has another one in script_waypoint.
DELETE FROM `creature_movement_template` WHERE `entry`=2983;
-- ERROR:Table creature_movement_template for entry 7228, point 5 have script_id 722805 that does not exist in `creature_movement_scripts`, ignoring
DELETE FROM `creature_movement_template` WHERE `entry`=7228;
-- ERROR:Table creature_movement_template references unknown creature template 7273. Skipping.
DELETE FROM `creature_movement_template` WHERE `entry`=7273;
-- Ghaz'rilla has the wrong id, should be 7273 instead of 20901.
UPDATE `creature_template` SET `entry`=7273 WHERE `entry`=20901;
UPDATE `event_scripts` SET `datalong`=7273 WHERE `id`=2488 && `command`=10;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (7273, 20901);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (2090101, 7273, 11, 0, 100, 3, 0, 0, 0, 0, 11, 33007, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz\'rilla - Cast 33007 event 2489 on spawn (Ustaag)');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (2090102, 7273, 0, 0, 100, 3, 5000, 15000, 5000, 15000, 11, 11836, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz\'rilla - Cast Freeze Solid (Ustaag)');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (2090103, 7273, 0, 0, 100, 3, 3000, 10000, 3000, 10000, 11, 11902, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz\'rilla - Cast Gahz\'rilla Slam (Ustaag)');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (2090104, 7273, 0, 0, 100, 3, 7000, 20000, 7000, 20000, 11, 11131, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz\'rilla - Cast Icicle (Ustaag)');
-- ERROR:Table creature_movement_template for entry 7604, point 1 have script_id 760401 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7604, point 2 have script_id 760402 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7604, point 6 have script_id 760401 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7604, point 9 have script_id 760409 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7605, point 1 have script_id 760501 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7605, point 2 have script_id 760502 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7605, point 6 have script_id 760501 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7605, point 9 have script_id 760509 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7606, point 1 have script_id 760601 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7606, point 2 have script_id 760602 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7606, point 6 have script_id 760601 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7606, point 9 have script_id 760609 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7607, point 8 have script_id 760701 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7607, point 7 have script_id 760707 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7607, point 6 have script_id 760706 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7607, point 2 have script_id 760702 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7607, point 1 have script_id 760701 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7607, point 10 have script_id 760701 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7607, point 13 have script_id 760713 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7608, point 1 have script_id 760801 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7608, point 2 have script_id 760802 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7608, point 6 have script_id 760801 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 7608, point 9 have script_id 760809 that does not exist in `creature_movement_scripts`, ignoring
DELETE FROM `creature_movement_template` WHERE `entry` IN (7604, 7605, 7606, 7607, 7608);
-- ERROR:Table creature_movement_template for entry 8856, point 4 have script_id 885601 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 8856, point 9 have script_id 885602 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 8856, point 15 have script_id 885603 that does not exist in `creature_movement_scripts`, ignoring
DELETE FROM `creature_movement_template` WHERE `entry`=8856;
-- ERROR:Table creature_movement_template for entry 9022, point 3 have script_id 902201 that does not exist in `creature_movement_scripts`, ignoring
DELETE FROM `creature_movement_template` WHERE `entry`=9022;
-- ERROR:Table creature_movement_template for entry 9679, point 5 have script_id 967901 that does not exist in `creature_movement_scripts`, ignoring
DELETE FROM `creature_movement_template` WHERE `entry`=9679;
-- ERROR:Table creature_movement_template for entry 10617, point 1 have script_id 1061701 that does not exist in `creature_movement_scripts`, ignoring
UPDATE `creature` SET `position_x`=-4937.46, `position_y`=-2168.09, `position_z`=-56.1747, `MovementType`=2 WHERE `guid`=21580;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=10617;
UPDATE `creature_movement_template` SET `waittime`=5000 WHERE `entry`=10617 && `point`=1;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (1061701, 1, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'RUN ON');
-- ERROR:Table creature_movement_template for entry 11492, point 1 have script_id 1149201 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 11492, point 2 have script_id 1149202 that does not exist in `creature_movement_scripts`, ignoring
DELETE FROM `creature_movement_template` WHERE `entry`=11492;
-- ERROR:Table creature_movement_template for entry 12581, point 5 have script_id 1258101 that does not exist in `creature_movement_scripts`, ignoring
DELETE FROM `creature_movement_template` WHERE `entry`=12581;
-- ERROR:Table creature_movement_template for entry 14241, point 5 have script_id 14241 that does not exist in `creature_movement_scripts`, ignoring
DELETE FROM `creature_movement_template` WHERE `entry`=14241;
-- ERROR:Table creature_movement_template for entry 14354, point 32 have script_id 1435402 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 14354, point 19 have script_id 1435402 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 14354, point 9 have script_id 1435402 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 14354, point 1 have script_id 1435401 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 14354, point 38 have script_id 1435402 that does not exist in `creature_movement_scripts`, ignoring
DELETE FROM `creature_movement_template` WHERE `entry`=14354;
-- ERROR:Table creature_movement_template for entry 15931, point 3 have script_id 1593101 that does not exist in `creature_movement_scripts`, ignoring
DELETE FROM `creature_movement_template` WHERE `entry`=15931;
-- ERROR:Table creature_movement_template for entry 16061, point 1 have script_id 1606102 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 16061, point 2 have script_id 1606102 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 16061, point 3 have script_id 1606102 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 16061, point 4 have script_id 1606102 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 16061, point 5 have script_id 1606102 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 16061, point 6 have script_id 1606102 that does not exist in `creature_movement_scripts`, ignoring
-- ERROR:Table creature_movement_template for entry 16061, point 7 have script_id 1606101 that does not exist in `creature_movement_scripts`, ignoring
DELETE FROM `creature_movement_template` WHERE `entry`=16061;
-- ERROR:Table creature_movement_template for entry 5981 (point 1) are using invalid coordinates position_x: -11351.900391, position_y: -2754.500000)
-- ERROR:Table creature_movement_template for entry 5981 (point 1) are auto corrected to normalized position_x=-11351.900391, position_y=-2754.500000
-- ERROR:Table creature_movement_template for entry 5981 (point 13) are using invalid coordinates position_x: -11370.700195, position_y: -2855.800049)
-- ERROR:Table creature_movement_template for entry 5981 (point 13) are auto corrected to normalized position_x=-11370.700195, position_y=-2855.800049
-- ERROR:Table creature_movement_template for entry 5981 (point 12) are using invalid coordinates position_x: -11396.900391, position_y: -2926.050049)
-- ERROR:Table creature_movement_template for entry 5981 (point 12) are auto corrected to normalized position_x=-11396.900391, position_y=-2926.050049
-- ERROR:Table creature_movement_template for entry 5981 (point 11) are using invalid coordinates position_x: -11331.000000, position_y: -2986.100098)
-- ERROR:Table creature_movement_template for entry 5981 (point 11) are auto corrected to normalized position_x=-11331.000000, position_y=-2986.100098
-- ERROR:Table creature_movement_template for entry 5981 (point 10) are using invalid coordinates position_x: -11380.799805, position_y: -3012.739990)
-- ERROR:Table creature_movement_template for entry 5981 (point 10) are auto corrected to normalized position_x=-11380.799805, position_y=-3012.739990
-- ERROR:Table creature_movement_template for entry 5981 (point 9) are using invalid coordinates position_x: -11444.099609, position_y: -3037.879883)
-- ERROR:Table creature_movement_template for entry 5981 (point 9) are auto corrected to normalized position_x=-11444.099609, position_y=-3037.879883
-- ERROR:Table creature_movement_template for entry 5981 (point 8) are using invalid coordinates position_x: -11500.099609, position_y: -3041.020020)
-- ERROR:Table creature_movement_template for entry 5981 (point 8) are auto corrected to normalized position_x=-11500.099609, position_y=-3041.020020
-- ERROR:Table creature_movement_template for entry 5981 (point 7) are using invalid coordinates position_x: -11444.000000, position_y: -3037.979980)
-- ERROR:Table creature_movement_template for entry 5981 (point 7) are auto corrected to normalized position_x=-11444.000000, position_y=-3037.979980
-- ERROR:Table creature_movement_template for entry 5981 (point 6) are using invalid coordinates position_x: -11380.799805, position_y: -3013.050049)
-- ERROR:Table creature_movement_template for entry 5981 (point 6) are auto corrected to normalized position_x=-11380.799805, position_y=-3013.050049
-- ERROR:Table creature_movement_template for entry 5981 (point 5) are using invalid coordinates position_x: -11330.799805, position_y: -2986.010010)
-- ERROR:Table creature_movement_template for entry 5981 (point 5) are auto corrected to normalized position_x=-11330.799805, position_y=-2986.010010
-- ERROR:Table creature_movement_template for entry 5981 (point 4) are using invalid coordinates position_x: -11396.700195, position_y: -2926.030029)
-- ERROR:Table creature_movement_template for entry 5981 (point 4) are auto corrected to normalized position_x=-11396.700195, position_y=-2926.030029
-- ERROR:Table creature_movement_template for entry 5981 (point 3) are using invalid coordinates position_x: -11370.900391, position_y: -2855.729980)
-- ERROR:Table creature_movement_template for entry 5981 (point 3) are auto corrected to normalized position_x=-11370.900391, position_y=-2855.729980
-- ERROR:Table creature_movement_template for entry 5981 (point 2) are using invalid coordinates position_x: -11358.700195, position_y: -2797.010010)
-- ERROR:Table creature_movement_template for entry 5981 (point 2) are auto corrected to normalized position_x=-11358.700195, position_y=-2797.010010
-- ERROR:Table creature_movement_template for entry 5981 (point 14) are using invalid coordinates position_x: -11358.599609, position_y: -2796.979980)
-- ERROR:Table creature_movement_template for entry 5981 (point 14) are auto corrected to normalized position_x=-11358.599609, position_y=-2796.979980
UPDATE `creature_movement_template` SET `orientation`=0 WHERE `entry`=5981;

-- ERROR:BattleGroundEvent: missing db-data for map:30, event1:86, event2:1 ("500 armors provided from Horde")
DELETE FROM `battleground_events` WHERE `map`=30 && `event1`=86 && `event2`=1;
-- ERROR:BattleGroundEvent: missing db-data for map:30, event1:92, event2:2 ("10 mount reset from Horde")
DELETE FROM `battleground_events` WHERE `map`=30 && `event1`=92 && `event2`=2;
-- ERROR:BattleGroundEvent: missing db-data for map:30, event1:94, event2:2 ("15 mount reset from Horde")
DELETE FROM `battleground_events` WHERE `map`=30 && `event1`=94 && `event2`=2;
-- ERROR:BattleGroundEvent: missing db-data for map:30, event1:93, event2:2 ("10 mount reset from Horde")
DELETE FROM `battleground_events` WHERE `map`=30 && `event1`=93 && `event2`=2;
-- ERROR:BattleGroundEvent: missing db-data for map:30, event1:80, event2:1 ("100 armors provided from Horde")
DELETE FROM `battleground_events` WHERE `map`=30 && `event1`=80 && `event2`=1;
-- ERROR:BattleGroundEvent: missing db-data for map:30, event1:96, event2:2 ("20 mount reset from Horde")
DELETE FROM `battleground_events` WHERE `map`=30 && `event1`=96 && `event2`=2;
-- ERROR:BattleGroundEvent: missing db-data for map:30, event1:95, event2:2 ("15 mount reset from Horde")
DELETE FROM `battleground_events` WHERE `map`=30 && `event1`=95 && `event2`=2;
-- ERROR:BattleGroundEvent: missing db-data for map:30, event1:97, event2:2 ("20 mount reset from Horde")
DELETE FROM `battleground_events` WHERE `map`=30 && `event1`=97 && `event2`=2;
-- ERROR:BattleGroundEvent: missing db-data for map:30, event1:82, event2:1 ("200 armors provided from Horde")
DELETE FROM `battleground_events` WHERE `map`=30 && `event1`=82 && `event2`=1;
-- ERROR:BattleGroundEvent: missing db-data for map:30, event1:65, event2:1 ("Snivvle stop yell")
DELETE FROM `battleground_events` WHERE `map`=30 && `event1`=65 && `event2`=1;
-- ERROR:BattleGroundEvent: missing db-data for map:30, event1:100, event2:1 ("Alliance landmines disabled")
DELETE FROM `battleground_events` WHERE `map`=30 && `event1`=100 && `event2`=1;
-- ERROR:BattleGroundEvent: missing db-data for map:30, event1:101, event2:1 ("Horde landmines disabled")
DELETE FROM `battleground_events` WHERE `map`=30 && `event1`=101 && `event2`=1;
-- ERROR:BattleGroundEvent: missing db-data for map:30, event1:84, event2:1 ("300 armors provided from Horde")
DELETE FROM `battleground_events` WHERE `map`=30 && `event1`=84 && `event2`=1;
-- ERROR:BattleGroundEvent: missing db-data for map:30, event1:90, event2:2 ("5 mount reset from Horde")
DELETE FROM `battleground_events` WHERE `map`=30 && `event1`=90 && `event2`=2;
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246582 for event: map:0, event1:15, event2:0 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246487 for event: map:0, event1:15, event2:0 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246484 for event: map:0, event1:15, event2:1 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246477 for event: map:0, event1:15, event2:1 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246588 for event: map:0, event1:15, event2:2 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246489 for event: map:0, event1:15, event2:2 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246589 for event: map:0, event1:15, event2:3 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246491 for event: map:0, event1:15, event2:3 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246768 for event: map:0, event1:20, event2:4 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246760 for event: map:0, event1:20, event2:4 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246757 for event: map:0, event1:20, event2:5 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246756 for event: map:0, event1:20, event2:5 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246755 for event: map:0, event1:20, event2:5 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246765 for event: map:0, event1:20, event2:6 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246740 for event: map:0, event1:20, event2:6 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246738 for event: map:0, event1:20, event2:6 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246764 for event: map:0, event1:20, event2:7 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246761 for event: map:0, event1:20, event2:7 ("(null)")
-- ERROR:BattleGroundEvent: creature with nonexistent guid 1246762 for event: map:0, event1:20, event2:7 ("(null)")
DELETE FROM `creature_battleground` WHERE `guid` IN (1246582, 1246487, 1246484, 1246477, 1246588, 1246489, 1246589, 1246491, 1246768, 1246760, 1246757, 1246756, 1246755, 1246765, 1246740, 1246738, 1246764, 1246761, 1246762);
-- ERROR:BattleGroundEvent: gameobject with nonexistent guid 1246813 for event: map:0, event1:90, event2:0 ("(null)")
-- ERROR:BattleGroundEvent: gameobject with nonexistent guid 1246811 for event: map:0, event1:92, event2:0 ("(null)")
-- ERROR:BattleGroundEvent: gameobject with nonexistent guid 1246812 for event: map:0, event1:92, event2:0 ("(null)")
-- ERROR:BattleGroundEvent: gameobject with nonexistent guid 1246814 for event: map:0, event1:94, event2:0 ("(null)")
DELETE FROM `gameobject_battleground` WHERE `guid` IN (1246813, 1246811, 1246812, 1246814);

-- ERROR:Table `quest_start_scripts` has invalid talk text id (dataint = 0) in SCRIPT_COMMAND_TALK for script id 0
DELETE FROM `quest_start_scripts` WHERE `id`=0;

-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 17641) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4119
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48873) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4447
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48874) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4448
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48875) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4462
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48876) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 2523
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48877) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 2878
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48892) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 3363
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48893) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4113
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48894) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4114
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48895) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4116
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 18207) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4118
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48896) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4401
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48898) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4464
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48900) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4465
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48878) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 996
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48879) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 998
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48880) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 1514
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48887) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4115
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48888) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4221
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48889) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4222
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48890) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4343
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48891) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4403
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48897) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4466
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48899) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4467
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48881) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4117
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48883) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4444
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48884) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4445
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48885) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4446
-- ERROR:Table `quest_end_scripts` has invalid gameobject (GUID: 48886) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 4461
-- These gameobjects have a core script to handle the quests, the old database ones are not used.
DELETE FROM `quest_end_scripts` WHERE `id` IN (4119, 4447, 4448, 4462, 2523, 2878, 3363, 4113, 4114, 4116, 4118, 4401, 4464, 4465, 996, 998, 1514, 4115, 4221, 4222, 4343, 4403, 4466, 4467, 4117, 4444, 4445, 4446, 4461);
UPDATE `quest_template` SET `CompleteScript`=0 WHERE `entry` IN (4119, 4447, 4448, 4462, 2523, 2878, 3363, 4113, 4114, 4116, 4118, 4401, 4464, 4465, 996, 998, 1514, 4115, 4221, 4222, 4343, 4403, 4466, 4467, 4117, 4444, 4445, 4446, 4461);

-- ERROR:Table `quest_end_scripts` has not existing quest (Id: 55000) as script id
-- ERROR:Table `quest_end_scripts` has not existing quest (Id: 55001) as script id
-- ERROR:Table `quest_end_scripts` has not existing quest (Id: 55002) as script id
-- ERROR:Table `quest_end_scripts` has not existing quest (Id: 55003) as script id
-- ERROR:Table `quest_end_scripts` has not existing quest (Id: 55004) as script id
-- Old custom quests...
DELETE FROM `quest_end_scripts` WHERE `id` IN (55000, 55001, 55002, 55003, 55004);

-- ERROR:Table `spell_scripts` has unsupported spell (Id: 4130) without SPELL_EFFECT_SCRIPT_EFFECT (77) spell effect
-- ERROR:Table `spell_scripts` has unsupported spell (Id: 4131) without SPELL_EFFECT_SCRIPT_EFFECT (77) spell effect
-- ERROR:Table `spell_scripts` has unsupported spell (Id: 4132) without SPELL_EFFECT_SCRIPT_EFFECT (77) spell effect
-- These spells are for the elemental charms that drop in arathi highlands. I already fixed them differently.
DELETE FROM `spell_scripts` WHERE `id` IN (4130, 4131, 4132);

-- ERROR:Table `gameobject_scripts` has invalid gameobject (GUID: 396316) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 21610
-- ERROR:Table `gameobject_scripts` has invalid gameobject (GUID: 396316) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 21609
-- ERROR:Table `gameobject_scripts` has invalid gameobject (GUID: 396316) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 21608
-- ERROR:Table `gameobject_scripts` has invalid gameobject (GUID: 396316) in SCRIPT_COMMAND_RESPAWN_GAMEOBJECT for script id 28704
DELETE FROM `gameobject_scripts` WHERE `datalong`=396316 && `id` IN (21610, 21609, 21608, 28704);

-- ERROR:Table `gameobject_scripts` has not existing gameobject (GUID: 141812) as script id
DELETE FROM `gameobject_scripts` WHERE `id`=141812;

-- ERROR:Table `event_scripts` has out of range text id (dataint = 4 expected 2000000000-2000010000) in SCRIPT_COMMAND_TALK for script id 9527
-- ERROR:Table `event_scripts` has out of range text id (dataint = 4 expected 2000000000-2000010000) in SCRIPT_COMMAND_TALK for script id 9527
-- ERROR:Table `event_scripts` has out of range text id (dataint = 4 expected 2000000000-2000010000) in SCRIPT_COMMAND_TALK for script id 9527
-- ERROR:Table `event_scripts` has out of range text id (dataint = 4 expected 2000000000-2000010000) in SCRIPT_COMMAND_TALK for script id 9527
UPDATE `event_scripts` SET `dataint3`=0 WHERE `id`=9527 && `dataint3`=4;
-- ERROR:Table `event_scripts` has datalong2 = 84512 in SCRIPT_COMMAND_MOVEMENT for script id 8452, but this creature_template does not exist.
-- ERROR:Table `event_scripts` has datalong2 = 988000 in SCRIPT_COMMAND_TALK for script id 8452, but this creature_template does not exist.
-- ERROR:Table `event_scripts` has datalong2 = 988000 in SCRIPT_COMMAND_TALK for script id 8452, but this creature_template does not exist.
DELETE FROM `event_scripts` WHERE `id`=8452 && `datalong2` IN (84512, 988000);
-- ERROR:Table `event_scripts` has out of range text id (dataint = 2 expected 2000000000-2000010000) in SCRIPT_COMMAND_TALK for script id 9533
-- ERROR:Table `event_scripts` has out of range text id (dataint = 2 expected 2000000000-2000010000) in SCRIPT_COMMAND_TALK for script id 9532
-- ERROR:Table `event_scripts` has out of range text id (dataint = 2 expected 2000000000-2000010000) in SCRIPT_COMMAND_TALK for script id 9531
-- ERROR:Table `event_scripts` has out of range text id (dataint = 2 expected 2000000000-2000010000) in SCRIPT_COMMAND_TALK for script id 8176
UPDATE `event_scripts` SET `dataint3`=0 WHERE `dataint3`=2 && `id` IN (9533, 9532, 9531, 8176);
-- ERROR:Table `event_scripts` has out of range text id (dataint = 4 expected 2000000000-2000010000) in SCRIPT_COMMAND_TALK for script id 9535
-- ERROR:Table `event_scripts` has out of range text id (dataint = 4 expected 2000000000-2000010000) in SCRIPT_COMMAND_TALK for script id 9534
UPDATE `event_scripts` SET `dataint3`=0 WHERE `dataint3`=4 && `id` IN (9535, 9534);

-- Many of the errors about unused event scripts were due to the fact that custom spells were used to start the events.
-- Made a change in ScriptMgr to take those into account, and that left only 1 script that is actually unused.
-- ERROR:Table `event_scripts` has script (Id: 5525) not referring to any gameobject_template type 10 data2 field, type 3 data6 field, type 13 data 2 field, type 29 or any spell effect 61
DELETE FROM `event_scripts` WHERE `id`=5525;
-- ERROR:Table `event_scripts` has script (Id: 9527) not referring to any gameobject_template type 10 data2 field, type 3 data6 field, type 13 data 2 field, type 29 or any spell effect 61
-- Spell has had its effect changed to a dummy effect and event script is started from the core, so add a custom spell which starts the event to get rid of the error.
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (33031, 0, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9527, 0, 'Send Event 9527 (quest Decoy! - 8606)');
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `Comment`) VALUES (33031, 101, 0, -1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, 0, -1, 'Spell Event 9527 Quest Decoy!');

-- ERROR:Table `db_script_string` contain entry 200008273 out of allowed range (2000000000 - 2000010000), ignored.
-- ERROR:Table `db_script_string` contain entry 200008272 out of allowed range (2000000000 - 2000010000), ignored.
-- ERROR:Table `db_script_string` contain entry 200008271 out of allowed range (2000000000 - 2000010000), ignored.
-- ERROR:Table `db_script_string` contain entry 200008274 out of allowed range (2000000000 - 2000010000), ignored.
-- Those were added twice, one time with a missing zero from the entry number.
DELETE FROM `db_script_string` WHERE `entry` IN (200008271, 200008272, 200008273, 200008274);

-- ERROR:Some waypoint has textid0 with not existing 2000005235 text.
-- ERROR:Some waypoint has textid1 with not existing 2000005235 text.
-- ERROR:Some waypoint has textid2 with not existing 2000005235 text.
-- ERROR:Some waypoint has textid3 with not existing 2000005235 text.
-- ERROR:Some waypoint has textid4 with not existing 2000005235 text.
-- This text belongs to Private Thorsen. He says it when he starts his patrol.
UPDATE `creature_movement` SET `textid2`=0, `textid3`=0, `textid4`=0, `textid5`=0 WHERE `id`=2243 && `point`=2;
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000005235, 'Time for my patrol.  I\'ll be back shortly.', '순찰을 돌 시간이군. 금방 돌아오겠습니다.', 'C’est l’heure de ma patrouille. Je serai de retour dans peu de temps.', 'Zeit für meine Patrouille. Ich bin bald zurück.', '轮到我巡逻了。我很快就会回来的。', '輪到我巡邏了。我很快就會回來的。', 'Tengo que hacer la ronda. En breve estaré de vuelta.', 'Tengo que hacer la ronda. En breve estaré de vuelta.', 'Моя смена. Скоро вернусь.');
-- ERROR:Some waypoint has textid0 with not existing 2000005314 text.
-- ERROR:Some waypoint has textid0 with not existing 2000005314 text.
-- ERROR:Some waypoint has textid0 with not existing 2000005314 text.
-- ERROR:Some waypoint has textid0 with not existing 2000005314 text.
-- ERROR:Some waypoint has textid0 with not existing 2000005314 text.
-- ERROR:Some waypoint has textid0 with not existing 2000005314 text.
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000005314, 'What does allergic mean anyway? And what does it have to do with either of my kitties?', '대체 알레르기는 뭐예요? 그게 우리 야옹이랑 무슨 상관이 있다는 거지?', 'Allergique ? Ça veut dire quoi ? Et quel rapport avec mes minous ?', 'Was bedeutet \'Allergie\' überhaupt? Und was hat das mit meinen Kätzchen zu tun?', '过敏症究竟意味着什么？这对我的两只小猫有什么影响？', '過敏症究竟意味著什麼?這對我的兩隻小貓有什麼影響?', '¿Pero qué quiere decir "alérgico"? ¿Y qué tiene que ver eso con mis gatitos?', '¿Pero qué quiere decir "alérgico"? ¿Y qué tiene que ver eso con mis gatitos?', 'Что вообще такое эта аллергия? И какое отношение она имеет к моим кошкам?');
-- ERROR:Some waypoint has textid1 with not existing 2000005315 text.
-- ERROR:Some waypoint has textid1 with not existing 2000005315 text.
-- ERROR:Some waypoint has textid1 with not existing 2000005315 text.
-- ERROR:Some waypoint has textid1 with not existing 2000005315 text.
-- ERROR:Some waypoint has textid1 with not existing 2000005315 text.
-- ERROR:Some waypoint has textid1 with not existing 2000005315 text.
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000005315, 'I can\'t believe dad won\'t let me keep your sister.', '말도 안 돼. 아빠가 우리 냐옹이 못 키우게 해요.', 'Je n\'arrive pas à croire que papa m\'interdise de garder ta sœur.', 'Ich versteh einfach nicht, dass mein Vater es mir nicht erlaubt, dein Schwesterchen zu behalten.', '我不敢相信我爸爸居然不让我养它。', '我不敢相信我爸爸居然不讓我養它。', 'No puedo creer que papá no me deje conservar a tu hermana.', 'No puedo creer que papá no me deje conservar a tu hermana.', 'Не могу поверить, что отец не позволит мне оставить твою сестру.');
-- ERROR:Some waypoint has textid2 with not existing 2000005316 text.
-- ERROR:Some waypoint has textid2 with not existing 2000005316 text.
-- ERROR:Some waypoint has textid2 with not existing 2000005316 text.
-- ERROR:Some waypoint has textid2 with not existing 2000005316 text.
-- ERROR:Some waypoint has textid2 with not existing 2000005316 text.
-- ERROR:Some waypoint has textid2 with not existing 2000005316 text.
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000005316, 'Don\'t worry, I\'ll find a good home for ya.', '걱정 마. 야옹아! 좋은 주인을 찾아줄게.', 'Pas d\'inquiétude, nous allons te trouver un bon foyer.', 'Keine Bange, ich finde schon ein nettes Zuhause für dich.', '不要担心，我会给你找个好心人的。', '不要擔心，我會給你找個好心人的。', 'No te preocupes, te encontraré un buen hogar.', 'No te preocupes, te encontraré un buen hogar.', 'Не волнуйся! Я найду для тебя подходящее жилье.');
-- ERROR:Some waypoint has textid0 with not existing 2000005317 text.
-- ERROR:Some waypoint has textid0 with not existing 2000005317 text.
-- ERROR:Some waypoint has textid0 with not existing 2000005317 text.
-- ERROR:Some waypoint has textid0 with not existing 2000005317 text.
-- ERROR:Some waypoint has textid0 with not existing 2000005317 text.
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000005317, 'Can anyone give my adorable, extra little kitty a home?', '누구... 제 귀여운 냐옹이 길러주실 분?', 'Il n\'y a personne pour offrir un foyer à mon adorable petit chaton ?', 'Kann irgendwer meinem süßen, überzähligen kleinen Kätzchen ein Zuhause geben?', '谁能收养我可爱的小猫咪啊？', '誰能收養我可愛的小貓咪啊?', '¿Alguien puede darle un hogar a mi adorable gatito?', '¿Alguien puede darle un hogar a mi adorable gatito?', 'Кто может приютить моего прелестного маленького котенка?');
-- ERROR:Some waypoint has textid1 with not existing 2000005318 text.
-- ERROR:Some waypoint has textid1 with not existing 2000005318 text.
-- ERROR:Some waypoint has textid1 with not existing 2000005318 text.
-- ERROR:Some waypoint has textid1 with not existing 2000005318 text.
-- ERROR:Some waypoint has textid1 with not existing 2000005318 text.
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000005318, 'Will someone please give my little kitten a good home?', '누가 우리 야옹이 좀 입양해 주세요! 털도 별로 안 빠져요.', 'Est-ce que quelqu\'un pourrait donner un bon foyer à mon chaton ?', 'Würde irgendwer bitte meinem süßen Kätzchen ein Zuhause geben?', '有没有人愿意给我的小猫一个温暖的家?', '有沒有人願意給我的小貓一個溫暖的家?', '¿Alguien podría proporcionar un buen hogar a mi gatito?', '¿Alguien podría proporcionar un buen hogar a mi gatito?', 'Кто-нибудь, пожалуйста, приютите маленького котенка!');
-- ERROR:Some waypoint has textid2 with not existing 2000005319 text.
-- ERROR:Some waypoint has textid2 with not existing 2000005319 text.
-- ERROR:Some waypoint has textid2 with not existing 2000005319 text.
-- ERROR:Some waypoint has textid2 with not existing 2000005319 text.
-- ERROR:Some waypoint has textid2 with not existing 2000005319 text.
-- Missing texts above belong to Lil Timmy (kid selling kittens in stormwind)
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000005319, 'Kitten for sale, looking for a good home.', '귀여운 새끼 고양이 팔아요! 좋은 주인이 돼주실 분 찾습니다!', 'Chaton à vendre, cherchant un bon foyer.', 'Kätzchen zu verkaufen, in liebevolle Hände abzugeben.', '卖猫咪啦，我要给它找个好人家。', '賣貓咪啦，我要給它找個好人家。', 'Gatitos en venta, estamos buscándoles un buen hogar.', 'Gatitos en venta, estamos buscándoles un buen hogar.', 'Продадим котенка в добрые руки.');

-- ERROR:Table `db_script_string` has unused string id 2000006006
-- ERROR:Table `db_script_string` has unused string id 2000006007
-- These texts have been moved to script_texts table.
DELETE FROM `db_script_string` WHERE `entry` IN (2000006006, 2000006007);
-- ERROR:Table `db_script_string` has unused string id 2000007009
-- Texts for the fishing tournament. Should be moved to script_texts table.
DELETE FROM `db_script_string` WHERE `entry` IN (2000007008, 2000007009, 2000007010);
DELETE FROM `event_scripts` WHERE `id` IN (9534, 9535);
DELETE FROM `spell_mod` WHERE `id` IN (33017, 33018);
DELETE FROM `spell_effect_mod` WHERE `id` IN (33017, 33018);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900100, 'Let the Fishing Tournament BEGIN!', '낚시왕 선발대회를 시작합니다!', 'Que le concours de pêche COMMENCE !', 'Lasst den Angelwettbewerb BEGINNEN!', '钓鱼大赛开始啦！', '釣魚大賽開始啦!', '¡Que dé comienzo el torneo de pesca!', '¡Que dé comienzo el torneo de pesca!', 'Состязание рыбаков НАЧАЛОСЬ!', 0, 1, 0, 0, 'Fishing Tournament - Begin');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900101, 'We have a winner!  $n has won FIRST PLACE in the tournament!', '승자가 나왔습니다! $n|1이;가; 이번 주 낚시왕 선발대회에서 대상을 받았습니다!', 'Nous avons $gun gagnant:une gagnante; ! $n a remporté la PREMIÈRE PLACE du tournoi !', 'Wir haben einen Gewinner! $n hat den ERSTEN PLATZ im Turnier erreicht!', '决出优胜者了！钓鱼大赛的第一名是：$n！', '優勝者出現了!$n是大賽中的第一名!', '¡Tenemos $gun ganador:una ganadora;! ¡$n se ha hecho con el PRIMER PUESTO del torneo!', '¡Tenemos $gun ganador:una ganadora;! ¡$n se ha hecho con el PRIMER PUESTO del torneo!', 'А вот и наш победитель! Первое место $gзанял:заняла; $n!', 0, 1, 0, 0, 'Fishing Tournament - Winner');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900102, 'And the Tastyfish have gone for the week!   I will remain for another hour to allow you to turn in your fish!', '이번 주 맛둥어는 모두 잡혔습니다! 앞으로 단 한 시간 동안만 여기서 물고기를 접수하오니 서둘러 오십시오!', 'Toutes les courbines sont parties pour une semaine. Je reste encore une heure pour vous permettre de vous débarrasser de vos prises.', 'Das war\'s für diese Woche mit Leckerfischen! Ich bleibe noch eine weitere Stunde hier, damit Ihr Eure Fische abliefern könnt!', '本周的钓鱼比赛已经结束！在我逗留的一小时内，你们可以用可口鱼跟我交换物品！', '本週的釣魚比賽已經結束!我會在這裡再留一小時來購買你們的可口魚!', '¡Y los peces se han acabado! ¡Me quedaré otra hora más para que podáis entregar vuestros peces!', '¡Y los peces se han acabado! ¡Me quedaré otra hora más para que puedan entregar sus peces!', 'Все, вкуснорыбы не будет как минимум неделю! Я задержусь еще на часок, чтобы у вас была возможность принести мне рыбу.', 0, 1, 0, 0, 'Fishing Tournament - Over');
-- ERROR:Table `db_script_string` has unused string id 2000007020
-- ERROR:Table `db_script_string` has unused string id 2000007021
-- ERROR:Table `db_script_string` has unused string id 2000007022
-- No idea what these texts are for but they are unused both in db and core.
DELETE FROM `db_script_string` WHERE `entry` IN (2000007020, 2000007021, 2000007022);

-- ERROR:CreatureEventAI: EventMap for Creature 160018 is empty but creature is using CreatureEventAI.
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=160018;
-- ERROR:CreatureEventAI: EventMap for Creature 10375 is empty but creature is using CreatureEventAI.
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10375;
-- ERROR:CreatureEventAI:  Creature 2713 has param3 and param4=0 (RepeatMin/RepeatMax) but cannot be repeatable without timers. Removing EFLAG_REPEATABLE for event 271302.
DELETE FROM `creature_ai_scripts` WHERE `id`=271302;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (271302, 2713, 14, 0, 100, 0, 800, 40, 0, 0, 11, 3627, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Kinelory - Cast Rejuvenation on Friendlies');
-- ERROR:CreatureEventAI:  Event 243502 has 0 percent chance. Event will never trigger!
UPDATE `creature_ai_scripts` SET `event_chance`=100 WHERE `id`=243502;
-- ERROR:CreatureEventAI:  Creature 9449 has param3 and param4=0 (RepeatMin/RepeatMax) but cannot be repeatable without timers. Removing EFLAG_REPEATABLE for event 944901.
UPDATE `creature_ai_scripts` SET `event_flags`=2 WHERE `id`=944901;
-- ERROR:CreatureEventAI:  Creature 9450 has param3 and param4=0 (RepeatMin/RepeatMax) but cannot be repeatable without timers. Removing EFLAG_REPEATABLE for event 945003.
UPDATE `creature_ai_scripts` SET `event_flags`=2 WHERE `id`=945003;
-- ERROR:CreatureEventAI:  Creature 9451 has param3 and param4=0 (RepeatMin/RepeatMax) but cannot be repeatable without timers. Removing EFLAG_REPEATABLE for event 945101.
UPDATE `creature_ai_scripts` SET `event_flags`=2 WHERE `id`=945101;
-- ERROR:CreatureEventAI:  Creature 3691 are using repeatable event(369110) with param4 < param3 (RepeatMax < RepeatMin). Event will never repeat.
UPDATE `creature_ai_scripts` SET `event_param3`=11000, `event_param4`=13000 WHERE `id`=369110;
-- ERROR:CreatureEventAI:  Creature 14753 are using repeatable event(1475307) with param4 < param3 (RepeatMax < RepeatMin). Event will never repeat.
UPDATE `creature_ai_scripts` SET `event_param3`=12000 WHERE `id`=1475307;
-- ERROR:CreatureEventAI:  Creature 10268 has param3 and param4=0 (RepeatMin/RepeatMax) but cannot be repeatable without timers. Removing EFLAG_REPEATABLE for event 1026801.
UPDATE `creature_ai_scripts` SET `event_param3`=30000, `event_param4`=30000 WHERE `id`=1026801;
-- ERROR:CreatureEventAI:  Creature 16042 has param3 and param4=0 (RepeatMin/RepeatMax) but cannot be repeatable without timers. Removing EFLAG_REPEATABLE for event 1604207.
UPDATE `creature_ai_scripts` SET `event_flags`=2 WHERE `id`=1604207;
-- ERROR:CreatureEventAI:  Creature 16042 has param3 and param4=0 (RepeatMin/RepeatMax) but cannot be repeatable without timers. Removing EFLAG_REPEATABLE for event 1604204.
UPDATE `creature_ai_scripts` SET `event_flags`=2 WHERE `id`=1604204;
-- ERROR:CreatureEventAI:  Creature 14325 has param3 and param4=0 (RepeatMin/RepeatMax) but cannot be repeatable without timers. Removing EFLAG_REPEATABLE for event 1432505.
UPDATE `creature_ai_scripts` SET `event_flags`=2 WHERE `id`=1432505;
-- ERROR:CreatureEventAI:  Event 622813 has 0 percent chance. Event will never trigger!
-- Embers should be summoned by Burning Servant, not the Dark Iron Ambassador, and he can summon them repeatedly.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (622813, 773801);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (773801, 7738, 0, 0, 100, 3, 2000, 2000, 10000, 20000, 11, 10869, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Burning Servant - Summon Embers');
-- ERROR:CreatureEventAI:  Event 1047206 Action 2 uses nonexistent SpellID 0.
-- ERROR:CreatureEventAI:  Event 1047206 Action 2 uses incorrect Target type
UPDATE `creature_ai_scripts` SET `action2_param1`=0, `action2_param2`=33006 WHERE `id`=1047206;
-- ERROR:CreatureEventAI:  Event 427508 has 0 percent chance. Event will never trigger!
UPDATE `creature_ai_scripts` SET `event_chance`=100 WHERE `id`=427508;
-- ERROR:CreatureEventAI:  Event 427502 has 0 percent chance. Event will never trigger!
UPDATE `creature_ai_scripts` SET `event_chance`=100 WHERE `id`=427502;
-- ERROR:CreatureEventAI:  Creature 11120 are using event 1112001 with more than 100 percent chance. Adjusting to 100 percent.
UPDATE `creature_ai_scripts` SET `event_chance`=100 WHERE `id`=1112001;
-- ERROR:CreatureEventAI:  Event 1562501 Action 1 param1 references non-existing entry (-15625) in texts table.
-- ERROR:CreatureEventAI:  Entry -1141 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1140 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1139 in table `creature_ai_texts` but not used in EventAI scripts.
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=15625;
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-156251, -156252);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1562501, 15625, 10, 0, 100, 0, 0, 65, 0, 0, 1, -1139, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Corrupter - Yell on Hostile LOS 65 Yards');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1562502, 15625, 4, 0, 100, 0, 0, 0, 0, 0, 1, -1140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Corrupter - Yell on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1562503, 15625, 0, 0, 100, 1, 9000, 16000, 5000, 9000, 11, 25805, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Corrupter - Cast Soul Corruption');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1562504, 15625, 0, 0, 100, 1, 12000, 18000, 35000, 45000, 11, 25806, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Corrupter - Cast Creature of Nightmare');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1562505, 15625, 5, 0, 100, 1, 0, 0, 0, 0, 1, -1141, 0, 0, 11, 21307, 0, 1, 0, 0, 0, 0, 'Twilight Corrupter - Yell and Cast Swell of Souls on Player Kill');
-- ERROR:CreatureEventAI:  Creature 14750 has param3 and param4=0 (RepeatMin/RepeatMax) but cannot be repeatable without timers. Removing EFLAG_REPEATABLE for event 1475005.
UPDATE `creature_ai_scripts` SET `event_flags`=2 WHERE `id`=1475005;
-- ERROR:CreatureEventAI:  Creature 11359 has param3 and param4=0 (RepeatMin/RepeatMax) but cannot be repeatable without timers. Removing EFLAG_REPEATABLE for event 1135902.
UPDATE `creature_ai_scripts` SET `event_flags`=2 WHERE `id`=1135902;
-- ERROR:CreatureEventAI:  Event 1533505 Action 2 uses nonexistent SpellID 0.
-- ERROR:CreatureEventAI:  Event 1533505 Action 2 uses incorrect Target type
UPDATE `creature_ai_scripts` SET `action2_param1`=0, `action2_param2`=25374 WHERE `id`=1533505;
-- ERROR:CreatureEventAI:  Event 98800618 Action 1 has incorrect action type (255), replace by ACTION_T_NONE.
UPDATE `creature_ai_scripts` SET `action1_type`=11 WHERE `id`=98800618;
-- ERROR:CreatureEventAI:  Creature 10498 are using percentage event(1049801) with param1 <= param2 (MaxPercent <= MinPercent). Event will never trigger! 
UPDATE `creature_ai_scripts` SET `event_param2`=0 WHERE `id`=1049801;
-- ERROR:CreatureEventAI:  Creature 15215 are using percentage event(1521501) with param1 <= param2 (MaxPercent <= MinPercent). Event will never trigger! 
-- ERROR:CreatureEventAI:  Creature 15215 has param3 and param4=0 (RepeatMin/RepeatMax) but cannot be repeatable without timers. Removing EFLAG_REPEATABLE for event 1521501.
UPDATE `creature_ai_scripts` SET `event_type`=4, `event_flags`=0 WHERE `id`=1521501;
-- ERROR:CreatureEventAI:  Event 571009 has 0 percent chance. Event will never trigger!
-- ERROR:CreatureEventAI:  Event 571009 Action 1 param1 references non-existing entry (-1109001) in texts table.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-110901, -110904);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (571009, 571010);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (571010, 5710, 5, 0, 100, 0, 0, 0, 0, 0, 4, 5863, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jammal\'an the Prophet - Sound on Player Kill');
-- ERROR:CreatureEventAI:  Event 1522002 Action 1 uses nonexistent SpellID 44417.
UPDATE `creature_ai_scripts` SET `action1_param1`=25033 WHERE `id`=1522002;
-- ERROR:CreatureEventAI:  Event 1445401 Action 1 param1 references out-of-range entry (48) in texts table.
UPDATE `creature_ai_scripts` SET `action1_param1`=-144543, `action1_param2`=0 WHERE `id`=1445401;
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-144541, -144542, -144543);
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-144541, '%s causes a gale to sweep across the land, the sound of his mindless fury coming from the northwest.', '%s|1이;가; 돌풍을 일으켜 대지를 휩씁니다. 북서쪽에서 끔찍한 분노에 가득한 소리가 들려옵니다.', '%s déclenche un ouragan pour balayer la région. Le bruit de sa colère aveugle arrive du nord-ouest.', '%s verbreitet einen Schrei über das Land, der Laut seiner sinnlosen Wut kommt aus dem Nordwesten.', '狂风骤起，%s愤怒的吼叫声从西北方传来。', '%s在大地卷起一陣狂風，從西北方傳來他憤怒的吼叫聲。', '%s provoca un vendaval que se extiende por la tierra; el sonido de su furia salvaje se aproxima desde el noroeste.', '%s provoca un vendaval que se extiende por la tierra; el sonido de su furia salvaje se aproxima desde el noroeste.', '%s поднимает ужасный вихрь. Его яростный рев доносится с северо-запада.', 0, 3, 0, 0, 'Windreaver - Random OOC');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-144542, '%s and his invading forces appear amidst a tumultuous conflagration in the northwest of Silithus.', '%s|1이;가; 이끄는 침략군이 소란스러운 사태가 발생한 실리더스 북서쪽 현장에 나타납니다.', '%s et ses forces d’invasion apparaissent au milieu d’un grand embrasement, au nord-ouest de Silithus.', '%s und seine eindringende Streitmacht taucht inmitten eines ungestümen Großbrands im Nordwesten von Silithus auf.', '%s率领入侵的大军突然从希利苏斯西北方的火场中冲出。', '%s和他的大軍突然從希利蘇斯西北方的火場中躍出。', '%s y sus fuerzas invasoras aparecen en medio de una tumultuosa conflagración al noroeste de Silithus.', '%s y sus fuerzas invasoras aparecen en medio de una tumultuosa conflagración al noroeste de Silithus.', '%s и его войска появляются в самом сердце битвы на северо-западе Силитуса.', 0, 3, 0, 0, 'Windreaver - On Spawn');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-144543, '%s dissipates into the ether, his howling winds still ringing in your ears.', '%s|1이;가; 하늘로 사라집니다. 아직도 귓가에는 바람소리가 윙윙거립니다.', '%s se dissipe dans l’éther, ses vents rageurs hurlant toujours à vos oreilles.', '%s löst sich im Nichts auf, seine heulenden Winde klingen immer noch in Euren Ohren.', '%s消散在空气中，他的哀号声还在你耳边回荡。', '%s消散在空氣中，他的哀號聲還在你耳邊迴蕩。', '%s se disipa en el éter, su viento aullador sigue resonando en tus oídos.', '%s se disipa en el éter, su viento aullador sigue resonando en tus oídos.', '%s исчезает в заоблачной выси. Его завывания все еще отдаются у вас в ушах.', 0, 3, 0, 0, 'Windreaver - On Death');
-- ERROR:CreatureEventAI:  Event 1446101 Action 1 param1 references out-of-range entry (51) in texts table.
UPDATE `creature_ai_scripts` SET `action1_param1`=-144613, `action1_param2`=0 WHERE `id`=1446101;
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-144611, -144612, -144613);
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-144611, 'Hear me, denizens of the Crater!  I come to burn this land of its impurity!', '들어라! 분화구의 모든 생명체들이여, 나는 이 땅의 모든 불순한 무리를 제거하고자 왔노라!', 'Écoutez-moi, habitants du Cratère ! Je suis venu purifier cette terre par le feu !', 'Hört mich an, Bewohner des Kraters! Ich bin hier, um das Land und seine Verunreinigungen niederzubrennen!', '环形山的居民们，听我说！我是来烧毁这片不洁的土地的！', '環形山的居民們，聽我說!我是來燒毀這片不潔的土地的!', '¡Escuchadme, ciudadanos del Cráter! ¡He venido a quemar esta tierra, a poner fin a su impureza!', '¡Escuchadme, ciudadanos del Cráter! ¡He venido a quemar esta tierra, a poner fin a su impureza!', 'Слушайте меня, жители Кратера! Я пришел, чтобы выжечь скверну огнем!', 0, 6, 0, 0, 'Baron Charr - On Spawn');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-144612, 'Where are the so-called heroes of this world?  Too frightened to come out and play?', '소위 이 세계의 영웅이란 것들은 다 어디 있는 게냐? 너무 무서워서 내 앞에 나오지도 못하는 게냐?', 'Où sont les soi-disant héros de ce monde ? Trop effrayés pour venir jouer ?', 'Wo sind die so genannten Helden dieser Welt? Zu verängstigt, um zum Spielen herauszukommen?', '所谓的英雄在哪儿？心里害怕不敢出来玩吗？', '所謂的英雄在哪兒?心裡害怕不敢出來玩嗎?', '¿Dónde están los supuestos héroes de este mundo? ¿Demasiado gallinas para salir a jugar?', '¿Dónde están los supuestos héroes de este mundo? ¿Demasiado gallinas para salir a jugar?', 'И где же эти так называемые герои? Боятся выйти и поиграть?', 0, 6, 0, 0, 'Baron Charr - Random OOC');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-144613, 'You have not seen the last of me fools!  All shall be consumed in the end!', '아직 끝나지 않았다, 어리석은 놈들아! 결국 모든 것이 재로 변할 것이니라!', 'Nous n’en avons pas encore fini, imbéciles ! Tout sera consumé à la fin !', 'Ihr Narren habt mich nicht zum letzten Mal gesehen! Möge letztendlich alles vernichtet werden!', '你还没有见识过真正的我，愚蠢的家伙！我最终会毁掉一切的！', '你還沒有見識過真正的我，愚蠢的傢伙!我最終會毀掉一切的!', '¡Volveréis a verme, miserables! ¡Todo será consumido!', '¡Volveréis a verme, miserables! ¡Todo será consumido!', 'Вы еще не видели, на что я способен, глупцы! Всем придет конец!', 0, 6, 0, 0, 'Baron Charr - On Death');
-- ERROR:CreatureEventAI:  Event 1446401 Action 1 param1 references out-of-range entry (49) in texts table.
UPDATE `creature_ai_scripts` SET `action1_param1`=-987, `action1_param2`=0 WHERE `id`=1446401;
UPDATE `creature_ai_scripts` SET `action1_param1`=-988 WHERE `id`=1446404;
UPDATE `creature_ai_scripts` SET `action1_param1`=-986 WHERE `id`=1446405;
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-986, -987, -988, -144641, -144642, -144643);
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-988, 'Tiny mortals - me HERE! Doom you meet!', '하찮은 생명이여, 내가 왔도다! 너희의 운명을 맞이하라!', 'Petits mortels – moi ICI ! Votre destin rencontrez !', 'Mickrige Sterbliche - ich HIER! Verdammnis Ihr finden!', '卑微的人类——我在这儿！你们的末日到啦！', '卑微的人類─我在這兒!你們的末日到啦!', '¡Mortales diminutos, yo ESTAR AQUÍ! ¡Llegar vuestro día del Juicio Final!', '¡Mortales diminutos, yo ESTAR AQUÍ! ¡Llegar su día del Juicio Final!', 'Жалкие смертные – моя ЗДЕСЬ! Вы узреть судьбу!', 0, 6, 0, 0, 'Avalanchion - On Spawn');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-986, 'You be too scared!  Me find you!', '꽤나 겁쟁이로군! 내가 찾아내겠다!', 'Vous trop peur ! Moi trouver vous !', 'Ihr zu verängstigt sein! Ich Euch finden!', '你被吓坏啦！我找到你啦！', '你被嚇壞啦!我找到你啦!', '¡Tú tener mucho miedo! ¡Yo encontrarte!', '¡Tú tener mucho miedo! ¡Yo encontrarte!', 'Ты слишком пугаться! Моя тебя найти!', 0, 6, 0, 0, 'Avalanchion - Random OOC');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-987, 'What?!  You no can beat me!  Me will return!', '뭐라고?! 너는 날 이길 수 없다! 난 다시 돌아올 것이다!', 'Quoi ? Vous pas pouvoir battre moi ! Moi revenir !', 'Was?! Ihr mich nicht besiegen können! Ich zurückkehren werde!', '什么？！你不可能打败我！我会回来的！', '什麼?!你不可能打敗我!我會回來的!', '¡¿Qué?! ¡Tú no poder vencerme! ¡Volveré!', '¡¿Qué?! ¡Tú no poder vencerme! ¡Volveré!', 'Что?! Ты меня не победить! Моя вернуться!', 0, 6, 0, 0, 'Avalanchion - On Death');
-- ERROR:CreatureEventAI:  Event 1445701 Action 1 param1 references out-of-range entry (50) in texts table.
UPDATE `creature_ai_scripts` SET `action1_param1`=-144573, `action1_param2`=0 WHERE `id`=1445701;
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-144571, -144572, -144573);
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-144573, 'You will all pay dearly when I return from the depths!', '내가 심연에서 돌아오는 날, 너희 모두 큰 대가를 치르리라!', 'Vous le payerez très cher lorsque je reviendrai des profondeurs, tous autant que vous êtes !', 'Ihr alle werdet teuer bezahlen, wenn ich aus den Tiefen wiederkehre!', '当我从深渊回来的时候你就得付出代价！', '當我從深淵回來的時候你就得付出代價!', '¡Lo pagaréis muy caro cuando vuelva del inframundo!', '¡Lo pagaréis muy caro cuando vuelva del inframundo!', 'Вы все дорого заплатите, когда я вернусь из глубин!', 0, 6, 0, 0, 'Princess Tempestria - On Death');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-144572, 'If you mortals are all so craven, this will be easier than I thought!', '너희 필멸의 생명체들이 전부 다 이렇게 겁쟁이라면... 흠, 생각보다 훨씬 수월하겠군!', 'Si tous les mortels sont aussi pleutres, ce sera plus simple que je ne le pensais !', 'Wenn Ihr Sterblichen alle so feige seid, dann wird es einfacher werden als ich dachte!', '要是你们人类都这么胆小的话，这事儿比我想象的就容易多了！', '要是你們人類都這麼膽小的話，這事兒比我想像的就容易多了!', 'Si los mortales sois tan cobardes, ¡esto va a ser más fácil de lo que yo había pensado!', 'Si los mortales sois tan cobardes, ¡esto va a ser más fácil de lo que yo había pensado!', 'Если вы, смертные, такие трусы, все будет еще проще!', 0, 6, 0, 0, 'Princess Tempestria - Random OOC');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-144571, 'This frozen land shall suffice for a start.  Come to me, mortals - and I shall give you a quick and painful death.', '일단 이 얼어붙은 땅덩어리로 만족하도록 하지... 덤벼라! 필멸의 생명체들아... 빠르고도 고통스러운 죽음을 맛보게 해주마.', 'Cette terre gelée suffira pour commencer. Venez à moi, mortels, je vous donnerai une mort rapide et douloureuse.', 'Dieses gefrorene Land sollte für den Anfang genügen. Kommt zu mir, Sterbliche - ich sorge dann für Euren raschen und schmerzvollen Tod.', '这片被冻结的土地将成为我们的起点。来吧，凡人们，我会让你们痛苦地死去。', '這片被凍結的土地還是能承受的。跟我一起來吧，人類─我會讓你痛苦地死去的。', 'Esta tierra congelada será suficiente para empezar. Venid a mí, mortales. Y os daré una muerte rápida y dolorosa.', 'Esta tierra congelada será suficiente para empezar. Venid a mí, mortales. Y os daré una muerte rápida y dolorosa.', 'Для начала мне хватит и этих холодных земель. Идите ко мне, смертные, я дарую вам скорую и болезненную смерть.', 0, 6, 0, 0, 'Princess Tempestria - On Spawn');
-- ERROR:CreatureEventAI:  Creature 15387 are using percentage event(1538703) with param1 <= param2 (MaxPercent <= MinPercent). Event will never trigger! 
-- ERROR:CreatureEventAI:  Creature 15387 has param3 and param4=0 (RepeatMin/RepeatMax) but cannot be repeatable without timers. Removing EFLAG_REPEATABLE for event 1538703.
DELETE FROM `creature_ai_texts` WHERE `entry`=-15387;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1538701, 1538702, 1538703);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1538701, 15387, 9, 0, 100, 1, 0, 10, 7000, 11000, 11, 10966, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Warrior - Cast Uppercut');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1538702, 15387, 0, 0, 100, 1, 7000, 11000, 14000, 17000, 11, 15588, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Warrior - Cast Thunderclap');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1538703, 15387, 2, 0, 100, 0, 30, 0, 0, 0, 11, 8599, 0, 1, 1, -106, 0, 0, 0, 0, 0, 0, 'Qiraji Warrior - Cast Enrage and Emote at 30% HP');
-- ERROR:CreatureEventAI:  Event 351802 Action 1 param3 references non-existing entry (-142) in texts table.
DELETE FROM `creature_ai_scripts` WHERE `id`=351802;
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-204, -205);
DELETE FROM `db_script_string` WHERE `entry` IN (2000005099, 2000005100, 2000005101, 2000005102);
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000005099, 'Fresh bread for sale!', '신선한 빵 팔아요!', 'Pain frais !', 'Frisches Brot zu verkaufen!', '新鲜的面包啦！', '新鮮的麵包啦!', '¡Vendo pan fresco!', '¡Vendo pan fresco!', 'Свежий хлеб!');
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000005100, 'Freshly baked bread for sale!', '갓 구운 빵 팔아요!', 'Pain frais, tout juste sorti du four !', 'Frisch gebackenes Brot zu verkaufen!', '新鲜出炉的面包！', '新鮮出爐的麵包!', '¡Vendo pan recién horneado!', '¡Vendo pan recién horneado!', 'Свежевыпеченный хлеб!');
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000005101, 'Warm, wholesome bread!', '따뜻하고 건강에 좋은 빵이 있습니다!', 'Du pain bien chaud, bien nourrissant !', 'Warmes, bekömmliches Brot!', '热乎乎的新鲜面包啦！', '熱呼呼的新鮮麵包啦!', '¡Pan caliente y sano!', '¡Pan caliente y sano!', 'Горячий, вкусный хлеб!');
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000005102, 'Rolls, buns and bread. Baked fresh!', '롤빵, 작은 롤빵, 식빵 있어요. 갓 구운 빵입니다!', 'Brioches, petits pains et miches. Tout frais, sortis du four !', 'Brötchen, Kuchen und Brot. Frisch gebacken!', '长面包，圆面包，各种各样的面包，都是新鲜出炉的啊！', '長麵包，圓麵包，各種各樣的麵包，都是新鮮出爐的啊!', 'Panecillos, bollos y pan de toda clase. ¡Pan recién horneado!', 'Panecillos, bollos y pan de toda clase. ¡Pan recién horneado!', 'Хлеб, батоны, булочки! Только что из печи!');
UPDATE `creature_movement` SET `textid1`=0 WHERE `id`=79723 && `point`=1;
UPDATE `creature_movement` SET `textid1`=0 WHERE `id`=79723 && `point`=22;
UPDATE `creature_movement` SET `textid1`=2000005099, `textid2`=2000005100, `textid3`=2000005101, `textid4`=2000005102 WHERE `id`=79723 && `point` IN (2, 23, 25, 33);
-- ERROR:CreatureEventAI:  Event 384504 Action 1 uses nonexistent SpellID 32908.
UPDATE `creature_ai_scripts` SET `action1_param1`=2974 WHERE `id`=384504;
-- ERROR:CreatureEventAI:  Event 429503 has 0 percent chance. Event will never trigger!
DELETE FROM `creature_ai_scripts` WHERE `id`=429503;
-- ERROR:CreatureEventAI:  Event 430307 has 0 percent chance. Event will never trigger!
DELETE FROM `creature_ai_scripts` WHERE `id`=430307;
-- ERROR:CreatureEventAI:  Event 461901 Action 1 uses nonexistent SpellID 35913.
-- ERROR:CreatureEventAI:  Event 461902 Action 1 uses nonexistent SpellID 37628.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (461901, 461902);
-- ERROR:CreatureEventAI:  Event 572101 has 0 percent chance. Event will never trigger!
UPDATE `creature_ai_scripts` SET `event_chance`=100 WHERE `id`=572101;
UPDATE `creature_ai_scripts` SET `action1_param1`=-820 WHERE `id`=572102;
-- ERROR:CreatureEventAI:  Event 607201 Action 1 uses nonexistent SpellID 37624.
DELETE FROM `creature_ai_scripts` WHERE `id`=607201;
-- ERROR:CreatureEventAI:  Event 622203 has 0 percent chance. Event will never trigger!
-- ERROR:CreatureEventAI:  Event 622403 has 0 percent chance. Event will never trigger!
-- ERROR:CreatureEventAI:  Event 760302 has 0 percent chance. Event will never trigger!
-- Leper gnomes in Gnomeregan. Text ids were switched with Mekgineer Thermaplugg.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (622203, 622403, 760302);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (622203, 6222, 4, 0, 10, 2, 0, 0, 0, 0, 1, -188, -189, -190, 0, 0, 0, 0, 0, 0, 0, 0, 'Leprous Technician - Random Say on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (622403, 6224, 4, 0, 10, 2, 0, 0, 0, 0, 1, -188, -189, -191, 0, 0, 0, 0, 0, 0, 0, 0, 'Leprous Machinesmith - Random Say on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (760302, 7603, 4, 0, 20, 2, 0, 0, 0, 0, 1, -188, -190, -191, 0, 0, 0, 0, 0, 0, 0, 0, 'Leprous Assistant - Random Say on Aggro');
UPDATE `creature_ai_texts` SET `entry`=-107 WHERE `entry`=-188;
UPDATE `creature_ai_texts` SET `entry`=-108 WHERE `entry`=-189;
UPDATE `creature_ai_texts` SET `entry`=-109 WHERE `entry`=-190;
UPDATE `creature_ai_texts` SET `entry`=-110 WHERE `entry`=-191;
UPDATE `creature_ai_scripts` SET `action1_param1`=-107 WHERE `id`=780003;
UPDATE `creature_ai_scripts` SET `action1_param1`=-108 WHERE `id`=780004;
UPDATE `creature_ai_scripts` SET `action1_param1`=-110 WHERE `id`=780005;
UPDATE `creature_ai_scripts` SET `action3_param1`=-109 WHERE `id`=780006;
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-188, 'A foul trogg if ever I saw one.  Die!', '역겨운 트로그놈들. 죽어라!', 'Un infâme trogg. Meurs !', 'Ekelhafter Trogg! Sterbt!', '又是穴居人，去死吧！', '又是穴居怪，去死吧!', '$gUn:Una; trogg repugnante donde $glos:las; haya. ¡Muere!', '$gUn:Una; trogg repugnante donde $glos:las; haya. ¡Muere!', 'Премерзкий трогг, если это, конечно, он. Умри!', 0, 0, 7, 0, 'Common Leprous Say');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-189, 'This sickness clouds my vision, but I know you must be a trogg.  Die foul invader!', '병으로 잘 보이지는 않아도 네가 분명 트로그라는 것쯤은 안다고. 죽어라, 이 더러운 침략자!', 'Cette maladie trouble ma vision mais, à mon avis, vous devez être un trogg. Meurs, infâme envahisseur !', 'Diese Erkrankung trübt mein Sehvermögen, aber ich weiß, dass Ihr ein Trogg sein müsst. Sterbt, stinkender Eindringling!', '疾病让我的视觉受损，但我知道你一定是穴居人。去死吧，该死的入侵者！', '疾病讓我的視覺受損，但我知道你一定是穴居怪。去死吧，該死的入侵者!', 'Esta enfermedad nubla mi vista, pero sé que tienes que ser un trogg. ¡Muere, $ginvasor apestoso:invasora apestosa;!', 'Esta enfermedad nubla mi vista, pero sé que tienes que ser un trogg. ¡Muere, $ginvasor apestoso:invasora apestosa;!', 'Слабость туманит мой взор, но я знаю – ты, должно быть, трогг. Умри, злобная тварь!', 0, 0, 7, 0, 'Common Leprous Say');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-190, 'No gnome will be left behind.', '우리 종족이 아닌 자는 단 한 놈도 살려두지 않겠다!', 'Aucun gnome ne sera abandonné.', 'Kein Gnom wird zurückgelassen.', '我们不能放弃任何一个侏儒！', '我們不能放棄任何一個地精!', 'Ningún gnomo se quedará atrás.', 'Ningún gnomo se quedará atrás.', 'Ни один гном не уйдет живым!', 0, 0, 7, 0, 'Common Leprous Say');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-191, 'The troggs...they never stop coming.  Die trogg!  Die!', '질긴 트로그들... 끝도 없이 밀려오는군. 죽어라, 트로그! 죽어!', 'Les troggs... ils ne cessent de nous envahir. Qu’ils meurent ! Qu’ils meurent !', 'Die Troggs... sie kommen immer wieder. Sterbt, Trogg! Sterbt!', '穴居人……好像永远也杀不光。该死的穴居人！去死吧！', '穴居怪...好像永遠也殺不光。該死的穴居怪!去死吧!', 'Los troggs... no dejan de venir. ¡Muere, trogg! ¡Muere!', 'Los troggs... no dejan de venir. ¡Muere, trogg! ¡Muere!', 'Проклятые трогги... Так и прут! Умрите, трогги! Умрите!', 0, 0, 7, 0, 'Common Leprous Say');
-- ERROR:CreatureEventAI:  Creature 7726 has EFLAG_REPEATABLE set. Event can never be repeatable. Removing flag for event 772603.
UPDATE `creature_ai_scripts` SET `event_flags`=0 WHERE `id`=772603;
-- ERROR:CreatureEventAI:  Event 866602 Action 1 param1 references non-existing entry (-1311) in texts table.
DELETE FROM `creature_ai_scripts` WHERE `id`=866602;
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-1312, -1313, -1314, -1315, -1316);
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8666;
-- ERROR:CreatureEventAI:  Event 1222201 has 0 percent chance. Event will never trigger!
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=12222;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1222201, 12222, 9, 0, 100, 1, 0, 5, 22000, 26000, 11, 21070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Creeping Sludge - Cast Noxious Cloud');
-- ERROR:CreatureEventAI:  Event 1435101 Action 1 param1 references non-existing entry (-203) in texts table.
DELETE FROM `creature_ai_scripts` WHERE `id`=1435101;
-- ERROR:CreatureEventAI:  Event 955402 Action 1 param1 references non-existing entry (-1327) in texts table.
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1327, '%s gets really dizzy!', '%s|1이;가; 굉장히 어지러워 합니다!', '%s a un bon coup dans le nez !', '%s wird echt schwindelig!', '%s变得晕乎乎的！', '%s感到頭昏眼花!', '¡%s experimenta fuertes mareos!', '¡%s experimenta fuertes mareos!', '%s едва держится на ногах!', 0, 2, 0, 0, '9554');
-- ERROR:CreatureEventAI:  Event 294602 has 0 percent chance. Event will never trigger!
DELETE FROM `creature_ai_scripts` WHERE `id`=294602;
-- ERROR:CreatureEventAI:  Entry -1081707 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1081706 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1081705 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1081704 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1081703 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1081702 in table `creature_ai_texts` but not used in EventAI scripts.
-- Alterac Valley text duplicates.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-1081702, -1081703, -1081704, -1081705, -1081706, -1081707);
-- ERROR:CreatureEventAI:  Entry -147214 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -147213 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -147212 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -147211 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -147204 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -147203 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -147202 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -147201 in table `creature_ai_texts` but not used in EventAI scripts.
-- Texts when turning in Nefarian's head. Should be moved to script_texts as they are used in core.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-147211, -147212, -147213, -147214, -147204, -147203, -147202, -147201);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900103, 'Let your spirits rise! Rally around your champion, bask in $g his:her; glory! Revel in the rallying cry of the dragon slayer!', '기뻐하라! 용사 주위에 모여 $g그:그녀;의 영광을 만끽하라! 용을 처치한 영웅들의 단결을 향한 외침을 즐겨라!', 'Réjouissez-vous ! Ralliez-vous autour de votre $gchampion:championne;, célébrez sa gloire ! Lancez le cri de ralliement $gdu tueur:de la tueuse; de dragon !', 'Erhebt Eure Gemüter! Feiert $g Euren Helden:Eure Heldin;, erfreut Euch an $g seinem:ihrem; Ruhm! Lasst den Siegesschrei des Drachentöters Eure Herzen höher schlagen!', '兴奋起来！为你们的勇士欢呼，沐浴在$g他:她;的荣耀之中！为我们伟大的屠龙者欢呼吧！', '讓大家的情緒沸騰起來!為你們的勇士歡呼，沐浴在$g他:她;的榮耀之中!為我們偉大的屠龍者歡呼吧!', '¡Dejad que se eleven vuestros espíritus! ¡Reuníos alrededor de $gvuestro campeón:vuestra campeona;! ¡Bañaos en su gloria! ¡Deleitaos con el grito de llamamiento $gdel cazador:de la cazadora; de dragones!', '¡Dejen que se eleven sus espíritus! ¡Reúnanse alrededor de $gnuestro campeón:nuestra campeona;! ¡Gocen en su gloria! ¡Deléitense con el grito de llamamiento $gdel cazador:de la cazadora; de dragones!', 'Воспряньте же духом! Соберитесь вокруг $gсвоего защитника:своей защитницы;, грейтесь в лучах $gего:ее; славы! Радостно восславьте $gпобедителя:победительницу; дракона!', 0, 6, 0, 0, 'ally Nef Head yell2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900104, 'Citizens of the Alliance, the Lord of Blackrock is slain! Nefarian has been subdued by the combined might of $n and $g his:her; allies!', '얼라이언스의 시민들이여, 검은바위의 군주가 쓰려졌다! $n|1과;와; 그 동료의 결속된 힘에 네파리안이 무릎을 꿇었다!', 'Citoyens de l\'Alliance, le seigneur du clan Rochenoire a été tué ! Nefarian a été vaincu par la puissance conjuguée |2 $n et de ses alliés !', 'Angehörige der Allianz, der Herrscher des Schwarzfels wurde besiegt! Die vereinte Macht von $n und $g seiner:ihrer; Verbündeten bezwang Nefarian!', '联盟的人民们，黑石领主已经被干掉了！奈法利安已经被强大的$n和$g他:她;的盟友所降伏了！', '聯盟的人民們，黑石之王已經被幹掉了!奈法利安已經被萬能的$n和$g他:她;的盟友所降伏了!', '¡Ciudadanos de la Alianza, el Señor de Roca Negra está muerto! ¡Nefarian ha sido vencido gracias a la combinación del poder de $n y sus aliados!', '¡Ciudadanos de la Alianza, el Señor de Roca Negra está muerto! ¡Nefarian ha sido vencido gracias a la combinación del poder de $n y sus aliados!', 'Граждане Альянса! Владыка Черной горы повержен! $n и $gего:ее; союзники, объединив усилия, одолели Нефариана!', 0, 6, 0, 0, 'ally Nef Head yell1');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900105, 'Be lifted by $n\'s accomplishment! Revel in $g his:her; rallying cry!', '$n|1과;와; 친구들의 업적에 감사하라! 모두 함께 함성을 질러 승리를 축하하자!', 'Soyez exaltés par l\'exploit |2 $n ! Lancez son cri de ralliement !', 'Erfreut euch an der mutigen Tat von $n! Lasst $g seinen:ihren; Siegesschrei eure Herzen höher schlagen!', '为$n的成就而庆祝！为$g他:她;的胜利而狂欢吧！', '為$n的成就而慶祝!為$g他:她;的勝利而狂歡吧!', '¡Sentíos elevados por el logro de $n! ¡Deleitaos en su grito de llamamiento!', '¡Siéntanse elevados por el logro de $n! ¡Deléitense en su grito de llamamiento!', '$n $gпреуспел:преуспела;! Нас ждет удача! Внемлите боевому кличу!', 0, 6, 0, 0, 'horde Nef Head yell2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900106, 'NEFARIAN IS SLAIN! People of Orgrimmar, bow down before the might of $n and $g his:her; allies for they have laid a blow against the Black Dragonflight that is sure to stir the Aspects from their malaise! This defeat shall surely be felt by the father of the Black Flight: Deathwing reels in pain and anguish this day!', '네파리안이 쓰러졌다! 오그리마의 백성들이여, $n|1과;와; 친구들의 힘 앞에 경의를 표하라! 이들은 검은용군단에 큰 타격을 입히고 위상들을 동요시켰도다! 오늘의 참패는 분명 검은용군단의 아버지인 데스윙에게도 영향을 미칠 것이니... 오늘 데스윙이 고통으로 비틀거리는구나!', 'NEFARIAN A ÉTÉ TUÉ ! Peuple d\'Orgrimmar, inclinez-vous devant la puissance |2 $n et de ses alliés car ils ont frappé un coup contre la meute des dragons noirs qui va sûrement sortir les Aspects de leur malaise ! Cette défaite sera sans aucun doute durement ressentie par le père des dragons noirs. En ce jours, l\'Aile de mort ressent douleur et angoisse !', 'NEFARIAN IST TOT! Bürger von Orgrimmar, verbeuget euch vor der Macht von $n und $g seinen:ihren; Verbündeten, die es geschafft haben, dem schwarzen Drachenschwarm einen schweren Schlag zu versetzen, der die Aspekte sicherlich wieder aufrütteln wird. Diesesmal spürt der Anführer des schwarzen Drachenschwarms diese Niederlage bitterlich: Todesschwinge windet sich vor Schmerzen und Qualen!', '奈法利安被杀掉了！奥格瑞玛的居民，在强大的$B和$g他:她;的盟友面前鞠躬致意吧，他们对即使是神也要忌惮三分的黑龙军团进行了致命一击！这一次的失败定会让黑龙之父死亡之翼感到疼痛和苦恼！', '奈法利安被幹掉了!奧格瑪的人們，在強大的$n和$g他:她;的盟友面前鞠躬致意吧，他們對黑龍軍團進行了致命一擊!守護巨龍不必再苦惱了。這次的失敗一定會讓黑龍之父:死亡之翼感到痛苦和懊惱!', '¡NEFARIAN HA SIDO ASESINADO! Ciudadanos de Orgrimmar, inclinaos ante el poder de $n y sus aliados, porque ellos han asestado un gran golpe al Vuelo Negro que sacará a los Aspectos de su pesadumbre. El padre del Vuelo Negro sentirá esta derrota. ¡En este día, Alamuerte retrocede, lleno de dolor y angustia!', '¡NEFARIAN HA SIDO ASESINADO! Ciudadanos de Orgrimmar, inclínense ante el poder de $n y sus aliados, porque ellos han asestado un gran golpe al Vuelo Negro que sacará a los Aspectos de su pesadumbre. El padre del Vuelo Negro sentirá esta derrota. ¡En este día, Alamuerte retrocede, lleno de dolor y angustia!', 'НЕФАРИАН УБИТ! Жители Оргриммара, вот $n, склонитесь же перед $gего:ее; мощью и силой $gего:ее; союзников! Ведь удар, который они нанесли черным драконам, навсегда отвратит Аспектов от путей зла! Смертокрыл надолго запомнит это поражение – он стонет от горя и проклинает судьбу!', 0, 6, 0, 0, 'horde Nef Head yell1');
-- ERROR:CreatureEventAI:  Entry -143963 in table `creature_ai_texts` but not used in EventAI scripts. 07
-- ERROR:CreatureEventAI:  Entry -143962 in table `creature_ai_texts` but not used in EventAI scripts. 08
-- ERROR:CreatureEventAI:  Entry -143961 in table `creature_ai_texts` but not used in EventAI scripts. 09
-- Texts for the warchief blessing event. Should be moved to script_texts table.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-143963, -143962, -143961);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900107, 'Be bathed in the power of the Warchief! Drink in his might! Battle for the glory of the Horde!', '대족장의 권력에 몸을 맡겨라! 그 힘에 흠뻑 취하라! 호드의 영광을 위해 싸우라!', 'Baignez-vous dans la puissance du Chef ! Buvez à sa force ! Battez-vous pour la gloire de la Horde !', 'Badet in der Macht des Kriegshäuptlings! Trinkt seine Kraft! Kämpft zum Ruhm der Horde!', '沐浴在酋长的力量中吧！吸取他的力量！为了部落的荣耀而战！', '沐浴在大酋長的力量中吧!吸收他的力量!為了部落的榮耀而戰!', '¡Báñate en el poder del Jefe de Guerra! ¡Bebe de su fuerza! ¡Combate por la gloria de la Horda!', '¡Báñate en el poder del Jefe de Guerra! ¡Bebe de su fuerza! ¡Combate por la gloria de la Horda!', 'Окунись в силу Вождя! Причастись его могущества! Вступи в бой во славу Орды!', 0, 6, 0, 0, 'warchief blessing yell3');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900108, 'Be bathed in my power! Drink in my might! Battle for the glory of the Horde!', '온몸으로 나의 힘을 느껴라! 나의 힘에 도취하라! 호드의 영광을 위해 싸우라!', 'Que ma puissance vous baigne ! Buvez à ma grandeur ! Battez-vous pour la gloire de la Horde !', 'Badet in meiner Macht! Trinkt meine Kraft! Kämpft zum Ruhm der Horde!', '沐浴在我的力量中吧！吸取我的力量！为了部落的荣耀而战！', '沐浴在我的力量中吧!吸取我的力量!為了部落的榮耀而戰!', '¡Báñate en mi poder! ¡Bebe de mi fuerza! ¡Combate por la gloria de la Horda!', '¡Báñate en mi poder! ¡Bebe de mi fuerza! ¡Combate por la gloria de la Horda!', 'Купайтесь в моей силе! Проникнитесь моей мощью! Сражайтесь во славу Орды!', 0, 6, 0, 0, 'warchief blessing yell2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900109, 'Honor your heroes! On this day, they have dealt a great blow against one of our most hated enemies! The false Warchief, Rend Blackhand, has fallen!', '저 영웅에게 경의를 표하라! 오늘 우리가 가장 증오하던 적들에게 큰 상처를 주었노라! 가짜 대족장 렌드 블랙핸드가 쓰러졌도다!', 'Honorez vos héros ! Aujourd\'hui, ils ont porté un coup mortel à nos ennemis les plus détestés ! Le faux chef Rend Main-noire est tombé !', 'Ehret Eure Helden! Heute haben sie einem unserer verhasstesten Feinde einen schweren Schlag beigebracht! Rend Schwarzfaust, der falsche Kriegshäuptling, ist gefallen!', '为你们的英雄而欢庆！就在今天，他们给了我们最可恨的一个敌人一次重击！那个假的酋长，雷德·黑手，已经倒下了！', '為你們的英雄而歡慶!就在今天，他們給了我們最可恨的一個敵人一次重擊!那個假的大酋長，雷德·黑手，已經倒下了!', '¡Honrad a vuestros héroes! ¡En este día, han dado un gran golpe a uno de nuestros más odiados enemigos! ¡El falso Jefe de Guerra Rend Puño Negro ha caído!', '¡Honren a sus héroes! ¡En este día, han dado un gran golpe a uno de nuestros más odiados enemigos! ¡El falso Jefe de Guerra Rend Puño Negro ha caído!', 'Чествуйте своих героев! Сегодня они нанесли сокрушающий удар нашим самым ненавистным врагам! Самозванец Ренд Чернорук мертв!', 0, 6, 0, 0, 'warchief blessing yell1');
-- ERROR:CreatureEventAI:  Entry -143942 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -143941 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -143922 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -143921 in table `creature_ai_texts` but not used in EventAI scripts.
-- Texts when turning in Onyxia's head. Should be moved to script_texts as they are used in core.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-143942, -143941, -143922, -143921);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900110, 'Behold the might of the Alliance! The dread lady, Onyxia, hangs from the arches! Let the rallying cry of the dragon slayer lift your spirits!', '얼라이언스의 힘을 보라! 공포의 여군주 오닉시아의 목이 잘려 홍예문에 걸려 있다! 용을 처치한 영웅들의 환성에 함께 기쁨의 춤을 추자!', 'Admirez la puissance de l’Alliance ! La terrible Onyxia est accrochée à ces arches ! Que le cri de ralliement des tueurs de dragons vous donne du cœur et du courage !', 'Seht die Macht der Allianz! Die schreckliche Lady Onyxia baumelt leblos von den Torbögen! Lasst den Siegesschrei des Drachentöters eure Herzen höher schlagen!', '看看强大的联盟吧！奥妮克希亚的徽记悬挂在拱门之上！让我们为屠龙大军高声欢呼吧！', '看看強大的聯盟吧!奧妮克希亞的頭顱懸掛在拱門之上!讓我們為屠龍大軍高聲歡呼吧!', '¡Contemplad el poder de la Alianza! La aterradora Onyxia, está colgada de los arcos. ¡Que el grito de llamamiento de los cazadores de dragones eleve vuestros espíritus!', '¡Contemplen el poder de la Alianza! La aterradora Onyxia, está colgada de los arcos. ¡Que el grito de llamamiento de los cazadores de dragones eleve sus espíritus!', 'Узрите мощь Альянса! Ониксия подвешена под сводами! Да возвысит ваш дух победный крик убийц дракона!', 0, 6, 7, 0, 'ally Onyxia Head yell2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900111, 'Citizens and allies of Stormwind, on this day, history has been made. $n has laid waste to that which had attempted to usurp the rule of the kingdom. Gather round and join me in honoring our heroes.', '스톰윈드의 주민들과 모든 얼라이언스여! 오늘, 역사가 이루어졌노라. $n|1이;가; 우리 왕국의 질서를 파괴하려 했던 자를 물리쳤으니 모두 함께 모여 우리 영웅들에게 경의를 표해야 마땅할 것이다.', 'Citoyens et alliés de Hurlevent, ce jour est historique. $n a neutralisé celle qui avait tenté d’usurper le pouvoir dans ce royaume. Rassemblez-vous et joignez-vous à moi pour honorer nos héros.', 'Bürger und Verbündete Sturmwinds, am heutigen Tage ist Geschichte geschrieben worden. $n hat dem ein Ende gemacht, was beinahe die Herrschaft des Königreichs untergraben hätte! Versammelt Euch und ehrt gemeinsam mit mir unseren Helden.', '暴风城的城民和盟友们，今天，有人创造了历史。$n已经杀死了那个妄图篡夺王权的家伙。都聚过来吧，跟我们一起庆祝英雄的诞生。', '暴風城的城民和盟友們，今天，有人創造了歷史。$n已經殺死了那個妄圖篡奪王權的傢伙。都聚過來吧，跟我們一起慶祝英雄的誕生。', 'Ciudadanos y aliados de Ventormenta, en el día de hoy, hemos hecho historia. $n ha derrotado a quienes pretendían usurpar el gobierno del reino. Venid y reuníos para honrar a nuestros héroes.', 'Ciudadanos y aliados de Ventormenta, en el día de hoy, hemos hecho historia. $n ha derrotado a quienes pretendían usurpar el gobierno del reino. Venid y reuníos para honrar a nuestros héroes.', 'Граждане и союзники Штормграда, в этот день вершилась история. $n и $gего:ее; спутники наголову разбили того, кто пытался захватить власть над королевством. Придите же и чествуйте вместе наших героев!', 0, 6, 7, 0, 'ally Onyxia Head yell1');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900112, 'Bear witness to the undeniable power of your Warchief! Be lifted by the rallying cry of your dragon slayers!', '부인할 수 없는 대족장님의 힘을 보라! 용을 처치한 영웅들의 환성에 맞춰 기쁨의 춤을 추자!', 'Soyez témoins de la puissance de votre chef de guerre ! Soyez transportés par le cri de ralliement de vos tueurs de dragons !', 'Seid Zeugen der unleugbaren Macht eures Kriegshäuptlings! Lasst den Siegesschrei der Drachentöter eure Herzen höher schlagen!', '见证酋长的勿庸置疑的能力吧！在屠龙大军的战斗口号声中精神抖擞地前进吧！', '見證大酋長的勿庸置疑的能力吧!在屠龍大軍的戰鬥口號聲中精神抖擻地前進吧!', '¡Sed testigos del innegable poder de vuestro Jefe de Guerra! ¡Sentid cómo os eleva el grito de llamamiento de vuestros cazadragones!', '¡Sean testigos del innegable poder de su Jefe de Guerra! ¡Sientan cómo los eleva el grito de llamamiento de sus cazadragones!', 'Узри неоспоримую силу своего Вождя! Внемли боевому кличу драконоборцев!', 0, 6, 1, 0, 'horde Onyxia Head yell2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900113, 'People of the Horde, citizens of Orgrimmar, come, gather round and celebrate a hero of the Horde. On this day, $n, under the auspices of our glorious Warchief, laid a mortal blow against the Black Dragonflight. The brood mother, Onyxia, has been slain!', '호드의 백성들이여, 오그리마의 주민들이여, 모두 와서 호드의 영웅을 찬양하라. 오늘, 우리 영광스러운 대족장님의 가호 아래 $n|1이;가; 검은용군단에 죽음의 일격을 가했노라! 검은용군단의 여왕 오닉시아가 처형됐도다!', 'Peuple de la Horde, citoyens d’Orgrimmar, venez, rassemblez-vous et célébrez un héros de la Horde. En ce jour, $n, sous les auspices de notre glorieux chef de guerre, a porté un coup mortel contre le Vol noir. Leur mère, Onyxia, a été tuée !', 'Angehörige der Horde, Bürger von Orgrimmar, kommt und versammelt euch und feiert mit mir $g einen Helden:eine Heldin; der Horde. An diesem Tag hat $n, unter der Anleitung unseres glorreichen Kriegshäuptlings, einen tödlichen Schlag gegen den schwarzen Drachenschwarm geführt. Die Brutmutter Onyxia wurde getötet!', '部落的人民，奥格瑞玛的居民，来吧，聚集在一起，欢庆部落英雄的诞生！今天，$n在我们伟大的酋长的领导下，给予了黑龙致命的一击。奥妮克希亚已经被斩杀了！', '部落的人民，奧格瑪的城民，來吧，聚集到一起歡慶部落英雄的誕生。今天，$n，在我們偉大的大酋長的領導下，給予了黑龍軍團致命的一擊。黑龍公主奧妮克希亞死啦!', 'Miembros de la Horda, ciudadanos de Orgrimmar, venid y reuníos para homenajear un hecho heroico. En el día de hoy, $n, bajo los auspicios de nuestro glorioso Jefe de Guerra, asestó un golpe mortal al Vuelo Negro. ¡Onyxia, la madre de linaje del Vuelo, ha sido asesinada!', 'Miembros de la Horda, ciudadanos de Orgrimmar, venid y reuníos para homenajear un hecho heroico. En el día de hoy, $n, bajo los auspicios de nuestro glorioso Jefe de Guerra, asestó un golpe mortal al Vuelo Negro. ¡Onyxia, la madre de linaje del Vuelo, ha sido asesinada!', 'Народы Орды, жители Оргриммара! Приходите, собирайтесь и поздравляйте героя Орды! В этот день $n под руководством нашего славного военного вождя $gнанес:нанесла; смертельный удар черному дракону. Царица черных драконов Ониксия убита!', 0, 6, 1, 0, 'horde Onyxia Head yell1');
-- ERROR:CreatureEventAI:  Entry -110903 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -110902 in table `creature_ai_texts` but not used in EventAI scripts.
-- Duplicated texts for Jammalan the Prophet. Already added with another id.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-110902, -110903);
-- ERROR:CreatureEventAI:  Entry -50030 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50029 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50028 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50027 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50026 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50025 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50024 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50023 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50022 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50021 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50020 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50013 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50012 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50011 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50010 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50009 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50008 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50007 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50006 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50005 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50004 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50003 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50002 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50001 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -50000 in table `creature_ai_texts` but not used in EventAI scripts.
-- These texts are used in Alterac Valley scripts. They should be moved to script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry` BETWEEN -50030 AND -50000;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050030, 'Is that the best you can do?', '기껏 이 정도란 말인가?', 'C\'est ce que vous pouvez faire de mieux ?', 'Etwas Besseres habt Ihr nicht drauf?', '那就是你的最好表现吗？', '那就是你的最好表現嗎?', '¿Es eso lo mejor que puedes hacer?', '¿Es eso lo mejor que puedes hacer?', 'И это все, на что вы способны?', 0, 6, 0, 0, 'Vanndar Stormpike - Random Combat 6');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050029, 'The Stormpike clan bows to no one, especially the horde!', '스톰파이크 부족은 아무에게도 굴복하지 않소. 특히 호드에게는!', 'Le clan Foudrepique ne s\'incline devant personne, surtout pas devant la Horde !', 'Der Sturmlanzenklan beugt sich niemandem, und schon gar nicht der Horde!', '雷矛一族不会对任何人俯首称臣的，特别是部落！', '雷矛一族不會對任何人俯首稱臣的，特別是部落!', '¡El clan Pico Tormenta no se somete a nadie, especialmente a la Horda!', '¡El clan Pico Tormenta no se somete a nadie, especialmente a la Horda!', 'Воины Грозовой Вершины не склоняют головы ни перед кем! Тем более перед Ордой!', 0, 6, 0, 0, 'Vanndar Stormpike - Random Combat 5');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050028, 'We, the Alliance, will prevail!', '우리 얼라이언스가 승리할 거요!', 'C\'est nous, l\'Alliance, qui prévaudrons !', 'Wir, die Allianz, werden siegen!', '联盟会胜利的！', '聯盟會勝利的!', '¡Somos la Alianza y venceremos!', '¡Somos la Alianza y venceremos!', 'Альянс победит!', 0, 6, 0, 0, 'Vanndar Stormpike - Random Combat 4');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050027, 'It\'ll take more than you rabble to bring me down!', '너희 같은 오합지졸로는 나를 쓰러뜨릴 수 없다!', 'Ça ne suffira pas pour m\'abattre !', 'Es braucht mehr als einen Wicht wie Euch, um mich in die Knie zu zwingen!', '你这样的乌合之众是不可能打倒我的！', '你這樣的烏合之眾是不可能打倒我的!', '¡Va a ser necesario algo más que vuestra chusma para acabar conmigo!', '¡Va a ser necesario algo más que tu chusma para acabar conmigo!', 'Таким, как ты, меня не одолеть!', 0, 6, 0, 0, 'Vanndar Stormpike - Random Combat 3');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050026, 'We will not be swayed from our mission!', '우리는 절대 흔들리지 않을 것이오!', 'Nous ne serons pas écartés de notre mission !', 'Wir lassen uns nicht von unserer Mission abbringen!', '我们一定会完成使命的！', '我們一定會完成使命的!', '¡Nadie nos apartará de nuestra misión!', '¡Nadie nos apartará de nuestra misión!', 'Мы должны довести наше дело до конца!', 0, 6, 0, 0, 'Vanndar Stormpike - Random Combat 2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050025, 'Your attacks are weak!  Go practice on some rabbits and come back when you\'re stronger.', '주먹이 솜방망이로군! 가서 토끼 잡는 연습이나 좀 더 한 다음에 오시오.', 'Vos attaques sont faibles ! Allez vous entraîner sur des lapins et revenez quand vous aurez pris de l\'assurance !', 'Eure Angriffe lassen zu wünschen übrig! Geht und übt das an ein paar Hasen und kommt wieder her, wenn Ihr stärker seid.', '你的攻击太微弱了！去找些兔子练习一下，当你强壮些后再回来找我。', '你的攻擊太微弱了!去找些兔子練習一下，當你強壯些後再回來找我。', '¡Tus ataques son débiles! Vete a practicar con algunos conejos y vuelve cuando te hayas fortalecido.', '¡Tus ataques son débiles! Vete a practicar con algunos conejos y vuelve cuando te hayas fortalecido.', 'Слабо бьешь! Иди потренируйся на кроликах. Станешь сильнее – возвращайся.', 0, 6, 0, 0, 'Vanndar Stormpike - Random Combat 1');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050024, 'Why don\'t ya try again without yer cheap tactics, pansies! Or are you too chicken???', '어디 한 번 그 얄팍한 전술을 다시 시도해 보시지그래, 얼간이 녀석들! 왜, 이제는 너무 겁이 나나?', 'V’nez donc essayer encore une fois vos tactiques ringardes, bande de fillettes ! À moins qu’vous soyez des poules mouillées ?', 'Warum versucht Ihr es nicht nochmal ohne eure billigen Taktiken, Ihr Waschlappen! Hat da vielleicht jemand Schiss???', '为什么你们不再试验一次你们那些低贱的手段，娘娘腔？！你们是不是一群懦夫？？', '你們為什麼不丟掉那些低賤的手段再試試看呢，娘娘腔!你們是不是一群懦夫???', '¿Por qué no lo intentáis sin vuestras tácticas baratas, babosos? ¿¿¿O sois demasiado gallinas???', '¿Por qué no lo intentan sin sus tácticas baratas, babosos? ¿¿¿O son demasiado gallinas???', 'Давайте еще раз, но без ваших жалких уловок! Или кишка тонка?', 0, 6, 0, 0, 'Vanndar Stormpike - Wipe');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050023, 'Leave no survivors!', '한 놈도 살려두지 마라!', 'Ne laissez pas de survivants !', 'Lasst keinen am Leben!', '不留活口！', '不留活口!', '¡Que no quede nadie con vida!', '¡Que no quede nadie con vida!', 'Никого не оставлять в живых!', 0, 6, 0, 0, 'Vanndar Stormpike - Buff 2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050022, 'Take no prisoners! Drive these heathens from our lands!', '포로는 필요 없다! 우리 땅에서 이교도들을 몰아내라!', 'Ne faites pas de prisonniers ! Chassez les incroyants de nos terres !', 'Macht keine Gefangenen! Vertreibt diese Ungläubigen von unserem Land!', '不留俘虏！把这些异教徒都杀光！', '不要俘虜!把這些異教徒趕出我們的土地!', '¡Ejecutad a todos los prisioneros! ¡Expulsad a estos infieles de nuestras tierras!', '¡Ejecutad a todos los prisioneros! ¡Expulsad a estos infieles de nuestras tierras!', 'Пленных не брать! Вышвырнем этих неверных с нашей земли!', 0, 6, 0, 0, 'Vanndar Stormpike - Buff 1');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050021, 'You\'ll never get me out of me bunker, heathens!', '절대로 날 참호 밖으로 끌어낼 수 없을 것이다, 이 야만인 녀석들!', 'Vous m\'ferez jamais sortir d\'mon fortin, bande de sauvages !', 'Ihr werdet mich niemals aus meinem Bunker vertreiben, Ihr Ungläubigen!', '你们永远无法将我赶出我的工事！', '你們永遠無法將我趕出我的碉堡，異教徒!', '¡Nunca me sacaréis del búnker, paganos!', '¡Nunca me sacarán del búnker, paganos!', 'Вам не выманить меня из убежища, неверные!', 0, 6, 0, 0, 'Vanndar Stormpike - Reset');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050020, 'Soldiers of Stormpike, your General is under attack! I require aid! Come! Come! Slay these mangy Frostwolf dogs.', '스톰파이크의 병사들이여, 그대들의 사령관이 공격받고 있노라! 도움이 필요하다! 어서 와서 이 비열한 서리늑대 개들을 처치하라!', 'Soldats Foudrepique, votre général est attaqué ! J’ai besoin d’aide ! Venez ! Venez et tuez ces chiens galeux de Loup-de-givre !', 'Soldaten des Sturmlanzenklans, euer General wird angegriffen! Ich fordere Unterstützung! Kommt! Kommt! Löscht diese räudigen Hunde der Frostwölfe aus.', '雷矛士兵，你们的将军受到攻击！我需要援助！快！快！杀死这些卑鄙的霜狼氏族的成员。', '雷矛士兵，你們的將軍受到攻擊了!我需要援助!快來!快來!殺死這些卑鄙的霜狼氏族的走狗。', '¡Soldados de Pico Tormenta, están atacando a vuestro general! ¡Necesito ayuda! ¡Vamos! ¡Venid! Matad a esos asquerosos perros Lobo Gélido.', '¡Soldados de Pico Tormenta, están atacando a su general! ¡Necesito ayuda! ¡Vamos! ¡Vengan! Maten a esos asquerosos perros Lobo Gélido.', 'Солдаты Грозовой Вершины, на вашего генерала напали! На помощь! Сюда, ко мне! Убейте этих облезлых псов из Северного Волка!', 0, 6, 0, 0, 'Vanndar Stormpike - Aggro');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050013, 'You are no match for the strength of the Horde!', '너희는 막강한 우리 호드에게 상대도 안 돼!', 'Vous ne pouvez rien contre la puissance de la Horde !', 'Ihr seid kein Gegner für die Kraft der Horde!', '你不是部落的力量的对手！', '你不是部落的力量的對手!', '¡No sois rival para la fuerza de la Horda!', '¡No sois rival para la fuerza de la Horda!', 'Вам никогда не одолеть Орду!', 0, 6, 0, 0, 'Drek\'Thar - Random Combat 5');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050012, 'You cannot defeat the Frostwolf clan!', '너희는 절대로 서리늑대 부족을 물리칠 수 없다!', 'Vous ne pouvez pas battre le clan Loup-de-givre !', 'Ihr könnt den Frostwolfklan nicht besiegen!', '你不能击败霜狼部落！', '你不能擊敗霜狼氏族!', '¡No podéis vencer al clan Lobo Gélido!', '¡No podéis vencer al clan Lobo Gélido!', 'Тебе не справиться с Северным Волком!', 0, 6, 0, 0, 'Drek\'Thar - Random Combat 4');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050011, 'If you will not leave Alterac Valley on your own, then the Frostwolves will force you out!', '제 발로 알터랙 계곡을 떠나지 않겠다면 우리 서리늑대 부족이 그렇게 해주겠다!', 'Si vous ne quittez pas la vallée d\'Alterac de vous-même, les Loups-de-givre vous y contraindront !', 'Wenn Ihr das Alteractal nicht aus freien Stücken verlasst, werden Euch die Frostwölfe mit Gewalt vertreiben!', '如果你不自动离开奥特兰克山谷，霜狼会强迫你离开的！', '如果你不自動離開奧特蘭克山谷，霜狼會強迫你離開的!', 'Si no os vais del Valle de Alterac por vuestro propio pie, ¡los Lobo Gélido se encargarán de ello!', 'Si no se van del Valle de Alterac por su propio pie, ¡los Lobo Gélido se encargarán de ello!', 'Если вы не уберетесь из Альтеракской долины сами, Северные Волки выставят вас силой!', 0, 6, 0, 0, 'Drek\'Thar - Random Combat 3');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050010, 'Today, you will meet your ancestors!', '오늘 황천에서 네 선조를 만나게 될 줄 알아라!', 'Aujourd\'hui, vous allez partir à la rencontre de vos ancêtres !', 'Heute werdet Ihr Euren Ahnen begegnen!', '你会在今天见到你的祖先的！', '你會在今天見到你的祖先的!', '¡Hoy, conoceréis a vuestros ancestros!', '¡Hoy, conocerán a sus ancestros!', 'Сегодня ты отправишься к предкам!', 0, 6, 0, 0, 'Drek\'Thar - Random Combat 2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050009, 'Your attacks are slowed by the cold, I think!', '너무 추워서 공격도 제대로 못하는군!', 'Vos attaques sont ralenties par le froid, je pense !', 'Eure Angriffe sind wohl durch die Kälte gebremst, was?', '我想你的进攻因为寒冷减弱了！', '我想你的進攻因為寒冷減弱了!', 'Creo que el frío ralentiza vuestros ataques.', 'Creo que el frío ralentiza sus ataques.', 'Вы, наверное, замерзли! Едва ворочаете ручонками!', 0, 6, 0, 0, 'Drek\'Thar - Random Combat 1');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050008, 'Stormpike weaklings, face me in my fortress - if you dare!', '스톰파이크 약골들아, 나의 요새로 와서 한 판 붙어보자! 그럴 만한 용기가 있다면!', 'Mauviettes de Foudrepique, affrontez-moi dans ma forteresse, si vous l\'osez !', 'Sturmlanzenschwächlinge, stellt Euch mir in meiner Burg... wenn Ihr Euch traut!', '雷矛的渣滓们，如果你们真的有这么大胆的话，就来我的堡垒中挑战我吧！', '雷矛的肉腳們，如果你們真的有膽子的話，就來我的堡壘中挑戰我吧!', '¡Peleles Pico Tormenta, enfrentaos a mí en mi fortaleza si os atrevéis!', '¡Peleles Pico Tormenta, enfrentaos a mí en mi fortaleza si os atrevéis!', 'Слабаки из Грозовой Вершины, жду вас в своей крепости – приходите, если посмеете!', 0, 6, 0, 0, 'Drek\'Thar - Wipe');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050007, 'You seek to draw the General of the Frostwolf legion out from his fortress? PREPOSTEROUS!', '감히 서리늑대 사령관을 요새 밖으로 끌어내시겠다? 말도 안 되는 소리!', 'Vous voulez attirer le général de la légion Loup-de-givre hors de sa forteresse ? RIDICULE !', 'Ihr versucht, den General der Frostwolfarmee aus seiner Burg zu locken? WIE LÄCHERLICH!', '你们想要把霜狼的将军引出他的要塞？可笑！', '你們想要把霜狼軍團的將軍引出他的要塞?太可笑了!', '¿Pretendes sacar al general de la legión Lobo Gélido de su fortaleza? ¡QUÉ RIDICULEZ!', '¿Pretendes sacar al general de la legión Lobo Gélido de su fortaleza? ¡QUÉ RIDICULEZ!', 'Вы хотите выманить генерала легиона Северного Волка из его крепости? ГЛУПЦЫ!!!', 0, 6, 0, 0, 'Drek\'Thar - Reset');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050006, 'Stormpike filth! In my keep?! Slay them all!', '스톰파이크 쓰레기들이 감히 나의 요새에 쳐들어와?! 모조리 쳐라!', 'Des Foudrepiques ? Dans mon donjon ? Tuez-les tous !', 'Sturmlanzenabschaum! In meiner Burg?! Tötet sie alle!', '雷矛的渣滓！在我的要塞？！杀光他们！', '雷矛的雜碎!在我的要塞?!殺光他們!', '¡Escoria Pico Tormenta! ¿¿En mi bastión?? ¡Acabad con ellos!', '¡Escoria Pico Tormenta! ¿¿En mi bastión?? ¡Acaben con ellos!', 'Отродья Грозовой Вершины? В моей крепости?! Всех убить!', 0, 6, 0, 0, 'Drek\'Thar - Aggro');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050005, 'Take heart, Alliance!  Throw these villains from Alterac Valley!', '기운을 내라, 얼라이언스여! 저 악당들을 알터랙 계곡에서 몰아내자!', 'Courage, soldats de l\'Alliance ! Chassons ces misérables de la vallée d\'Alterac !', 'Nur Mut, Allianz! Werft diesen Abschaum aus dem Alteractal!', '把这些渣滓赶出奥特兰克！', '振作起來，聯盟軍隊!把這些惡棍趕出奧特蘭克山谷!', '¡Ánimo, Alianza! ¡Acabad con esos villanos del Valle de Alterac!', '¡Ánimo, Alianza! ¡Acabad con esos villanos del Valle de Alterac!', 'Смелей, Альянс! Выбросьте этих мерзавцев прочь из Альтеракской долины!', 0, 6, 0, 0, 'Capitaine Balinda - Reset');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050004, 'Filthy Frostwolf cowards! If you want a fight, you\'ll have to come to me!', '더러운 서리늑대 겁쟁이들 같으니! 싸우고 싶다면 직접 날 찾아와야 할 것이다!', 'Sales Loups-de-givre ! Bande de lâches ! Si vous voulez la bagarre, il faudra venir me chercher !', 'Dreckige feige Frostwölfe! Wenn ihr einen Kampf wollt, müsst ihr schon zu mir kommen!', '可恶的霜狼懦夫！如果你们想要一战的话，就放马，不，放狼过来吧！', '可惡的霜狼懦夫!如果你們想要一戰的話，就放馬，不，放狼過來吧!', '¡Cobardes asquerosos Lobo Gélido! ¡Si queréis luchar, venid a mí!', '¡Cobardes asquerosos Lobo Gélido! ¡Si queréis luchar, venid a mí!', 'Эй вы, жалкие трусы из Северного Волка! Хотите драться – так идите ко мне!', 0, 6, 0, 0, 'Capitaine Balinda');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050003, 'Begone, uncouth scum!  The Alliance shall prevail in Alterac Valley!', '꺼져라! 이 무례한 오합지졸들아! 알터랙 계곡은 얼라이언스의 땅이다!', 'Arrière, vermine inculte ! L’Alliance triomphera dans la vallée d’Alterac !', 'Verschwinde, dreckiger Abschaum! Die Allianz wird im Alteractal siegen!', '去死吧，渣滓！联盟会获得胜利的！', '去死吧，沒水準的廢物!聯盟會在奧特蘭克山谷獲得勝利的!', '¡Largo, escoria apestosa! ¡La Alianza reinará en el Valle de Alterac!', '¡Largo, escoria apestosa! ¡La Alianza reinará en el Valle de Alterac!', 'Прочь, подлецы! Альтеракская долина достанется Альянсу!', 0, 6, 0, 0, 'Capitaine Balinda - Aggro');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050002, 'Now is the time to attack!  For the Horde!', '바로 지금이 공격할 때다! 호드를 위하여!', 'L\'heure de l\'attaque a sonné ! Pour la Horde !', 'Es ist Zeit anzugreifen! Für die Horde!', '准备发动攻击！为部落而战！', '準備發動攻擊!為部落而戰!', '¡Es hora de atacar! ¡Por la Horda!', '¡Es hora de atacar! ¡Por la Horda!', 'Настало время для атаки! За Орду!', 0, 6, 0, 0, 'Capitaine Galvangar - Say');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050001, 'Die!  Your kind has no place in Alterac Valley!', '죽어라! 이 알터랙 계곡에 너희 종족이 발붙일 자리는 없다!', 'À mort ! Votre espèce n\'a rien à faire dans la vallée d\'Alterac !', 'Sterbt! Für Eure Art ist kein Platz im Alteractal!', '去死吧！你们别想在奥特兰克山谷站住脚！', '死吧!你們在奧特蘭克山谷是沒有立足之地的!', '¡Muere! ¡No hay lugar para los tuyos en el Valle de Alterac!', '¡Muere! ¡No hay lugar para los tuyos en el Valle de Alterac!', 'Умри! Таким, как ты, нет места в Альтеракской долине!', 0, 6, 0, 0, 'Capitaine Galvangar - Aggro');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1050000, 'I\'ll never fall for that, fool! If you want a battle, it will be on my terms and in my lair.', '내가 그 정도에 속아 넘어갈 것 같으냐, 어리석은 놈들! 내게 맞서고자 한다면 내가 있는 곳에서 내 방식대로 싸워야 할 것이다.', 'Vous comptiez vraiment me faire tomber dans ce piège ? Imbécile ! Si vous voulez le combat, ce sera selon mes termes, et dans mon repaire…', 'Darauf falle ich nicht rein, Dummkopf! Wenn Ihr einen Kampf wünscht, wird er nach meinen Bedingungen und in meinem Unterschlupf erfolgen!', '我永远不会被你那点伎俩算计到，蠢货！如果你想要一战的话，那就到我的地盘来挑战我吧！', '我永遠不會因此而倒下，笨蛋!如果你想要一戰的話，那麼我將決定一切，在我的巢穴裡見吧。', '¡Nunca caería en una trampa así, imbécil! Si quieres una batalla, será según mis condiciones y en mi guarida.', '¡Nunca caería en una trampa así, imbécil! Si quieres una batalla, será según mis condiciones y en mi guarida.', 'Я на такое не клюну, тупица! Если хочешь битвы, сражайся в моем логове и по моим правилам!', 0, 6, 0, 0, 'Capitaine Galvangar - Reset');
-- ERROR:CreatureEventAI:  Entry -20005 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -20004 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -20003 in table `creature_ai_texts` but not used in EventAI scripts.
-- These texts are used in Stratholme scripts. They should be moved to script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-20003, -20004, -20005);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900114, 'The Scourge have broken into the Bastion!  Redouble your efforts!  We must not fail!', '스컬지가 성채 안으로 침입했다! 힘을 내라! 절대로 져서는 안 돼!', 'Le Fléau s\'est introduit dans le Bastion ! Redoublez d\'efforts ! Nous ne devons pas échouer !', 'Die Geißel ist in die Bastion eingedrungen! Verdoppelt eure Bemühungen! Wir dürfen nicht versagen!', '亡灵天灾打进堡垒了！坚守阵地！我们绝对不能失败！', '天譴軍團被迫退守堡壘!加倍努力!我們不能失敗!', '¡La Plaga ha irrumpido en el bastión! ¡Redoblad vuestros esfuerzos! ¡No podemos fallar!', '¡La Plaga ha irrumpido en el bastión! ¡Redoblen sus esfuerzos! ¡No podemos fallar!', 'Плеть ворвалась в бастион! Удвойте усилия! Не сдаваться!', 0, 6, 0, 0, 'stratholme event');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900115, 'The Ash\'ari Crystals have been destroyed! The Slaughterhouse is vulnerable!', '애쉬아리 수정이 파괴되었다! 도살장이 위험하다!', 'Les Cristaux d\'Ash\'ari ont été détruits ! L\'Abattoir est vulnérable !', 'Die Kristalle von Ash\'ari wurden zerstört! Das Schlachthaus ist jetzt angreifbar!', '阿莎利水晶已经被摧毁了！屠宰场危险！', '阿莎利水晶已經被摧毀了!屠宰房危險!', '¡Han destruido los Cristales de Ash\'ari! ¡El Degolladero es vulnerable!', '¡Han destruido los Cristales de Ash\'ari! ¡El Degolladero es vulnerable!', 'Кристаллы Аш\'ари разрушены! Бойня в опасности!', 0, 6, 0, 0, 'stratholme all crystals destroyed');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900116, 'An Ash\'ari Crystal has been toppled! Restore the ziggurat before the Slaughterhouse is vulnerable!', '애쉬아리 수정 하나가 무너졌다! 도살장이 공격받기 전에 지구라트를 복원하라!', 'Un cristal d\'Ash\'ari vient d\'être renversé ! Restaurez la ziggourat avant que l\'abattoir ne soit vulnérable !', 'Ein Kristall von Ash\'ari wurde umgestürzt! Stellt die Ziggurat wieder her, ehe das Schlachthaus verwundbar wird!', '一块阿莎利水晶已经被摧毁了！趁屠宰场处于易受攻击状态，赶快修复通灵塔！', '阿莎利水晶已經被摧毀了!在屠宰房遭到攻擊之前修復通靈塔!', '¡Un Cristal de Ash\'ari se ha venido abajo! ¡Restaurad el zigurat antes de que El Degolladero sea vulnerable!', '¡Un Cristal de Ash\'ari se ha venido abajo! ¡Restaurad el zigurat antes de que El Degolladero sea vulnerable!', 'Кристалл Аш\'ари сброшен! Восстановите зиккурат, пока Бойня не осталась без защиты!', 0, 6, 0, 0, 'stratholme crystal destroyed');
-- ERROR:CreatureEventAI:  Entry -20002 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -20001 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -20000 in table `creature_ai_texts` but not used in EventAI scripts.
-- These texts were used in Stratholme scripts but have already been moved to script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-20000, -20001, -20002);
-- ERROR:CreatureEventAI:  Entry -14221 in table `creature_ai_texts` but not used in EventAI scripts.
-- Text belongs to Gravis Slipknot, was not assigned.
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1422102, 14221, 4, 0, 100, 0, 0, 0, 0, 0, 1, -14221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gravis Slipknot - Say on Aggro');
-- ERROR:CreatureEventAI:  Entry -2110 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1119 in table `creature_ai_texts` but not used in EventAI scripts.
-- This text belongs to Captain Tuubid but he has a core script now. Moving text to script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-1119, -2110);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900117, 'Kill $n!', '$n|1을;를; 해치워라!', 'Tuez $n !', 'Töte $n!', '杀了$n！', '殺吧，$n!', '¡Mata a $n!', '¡Mata a $n!', 'Убить |3-3($n)!', 0, 1, 0, 0, 'Captain Tuubid - Say Kill');
-- ERROR:CreatureEventAI:  Entry -1302 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1301 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1300 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1299 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1298 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1297 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1296 in table `creature_ai_texts` but not used in EventAI scripts.
-- Texts for quest The Balance of Light and Shadow. Updating eastern plaguelands scripts to use script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-1296, -1297, -1298, -1299, -1300, -1301, -1302);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900118, 'Death take me! I cannot go on! I have nothing left...', '죽음이여, 어서 날 데리고 가라! 더 이상은 견딜 수 없다! 내겐 아무것도 남은 게 없다...', 'Que la Mort me prenne ! Je ne peux pas continuer ! Il ne me reste rien…', 'Der Tod überkommt mich! Ich kann nicht mehr weitermachen! Mir bleibt nichts mehr...', '死亡来临了！我不能继续下去了！我没有什么剩下的了……', '死亡來臨了!我不能繼續下去了!我沒有什麼剩下的了...', '¡Que la muerte me lleve! No puedo seguir adelante. Ya no me queda nada...', '¡Que la muerte me lleve! No puedo seguir adelante. Ya no me queda nada...', 'Забери меня, смерть! Я не могу идти дальше! У меня ничего не осталось...', 0, 0, 0, 0, 'The Balance of Light and Shadow - Peasant Random 3');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900119, 'I won\'t make it... go... go on without me...', '저는 안 될 것... 같아요... 머... 먼저 가... 세요...', 'Je n’y arriverai pas… partez… continuez sans moi…', 'Ich werde es nicht schaffen... geht... geht ohne mich weiter...', '我不会……撒手不管的……', '我不會...撒手不管的...', 'No lo conseguiré... Vete... Sigue sin mí...', 'No lo conseguiré... Vete... Sigue sin mí...', 'Без меня... начать... не позволю.', 0, 0, 0, 0, 'The Balance of Light and Shadow - Peasant Random 2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900120, 'Should I live through this, I shall make it my life\'s sole ambition to destroy Arthas...', '여기서 살아남으면 아서스를 파괴하는 데 내 남은 일생을 바치리...', 'Si je survis, l\'unique ambition du reste de ma vie sera de détruire Arthas…', 'Sollte ich dies hier überleben, dann möge die Zerstörung Arthas mein einziges Bestreben sein...', '如果我能活下来，我一定把杀死阿尔萨斯当做毕生的目标……', '如果我經歷過，我會以殺死阿薩斯以畢生目標的...', 'Si consigo sobrevivir, la única ambición de mi vida será destruir a Arthas...', 'Si consigo sobrevivir, la única ambición de mi vida será destruir a Arthas...', 'Если я это переживу, то целью всей моей жизни будет убить Артаса...', 0, 0, 0, 0, 'The Balance of Light and Shadow - Peasant Random 1');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900121, 'Stranger, find the fallen Prince Menethil and end his reign of terror.', '이방인이여, 부디 타락한 메네실 왕자를 찾아 그의 공포 정치에 종지부를 찍어주십시오.', '$gÉtranger:Étrangère;, trouvez le prince déchu Menethil et mettez un terme à son règne de terreur.', '$g Fremder:Fremde;, findet den gefallenen Prinz Menethil und beendet seine Schreckensherrschaft.', '陌生人，去找战败的王子米奈希尔和他统治的国土。', '陌生人，去找戰敗的王子米奈希爾和他統治的國土。', '$gForastero:forastera;, encuentra al príncipe caído, Menethil, y pon fin a su reinado de terror.', '$gForastero:forastera;, encuentra al príncipe caído, Menethil, y pon fin a su reinado de terror.', '$gСтранник:Странница;, найди принца Менетила и покончи с его кошмарной властью.', 0, 0, 0, 0, 'The Balance of Light and Shadow - Peasant End 4');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900122, 'At last, it ends....', '드디어... 끝났구나...', 'C’est enfin fini…', 'Schließlich endet es...', '终于结束了……', '終於結束了...', 'Por fin ha terminado...', 'Por fin ha terminado...', 'Наконец-то все кончается...', 0, 0, 0, 0, 'The Balance of Light and Shadow - Peasant End 3');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900123, 'We shall be reunited once more, my love...', '다시 당신과 함께하게 되었군요, 내 사랑...', 'Nous serons à nouveau réunis, mon amour…', 'Wir werden bald wieder vereint sein, meine Liebe...', '我的爱人，我们会再次复合的……', '我的愛人，我們會再次複合的...', 'Podremos volver a estar juntos, amor mío...', 'Podremos volver a estar juntos, amor mío...', 'Мы снова воссоединимся, любовь моя...', 0, 0, 0, 0, 'The Balance of Light and Shadow - Peasant End 2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900124, 'The power of the light is truly great and merciful.', '빛의 힘은 참으로 위대하고 자비롭군요.', 'En vérité, le pouvoir de la Lumière est grand et miséricordieux.', 'Die Macht des Lichts ist wahrhaftig bedeutend und barmherzig.', '光明的力量如此强大、如此仁慈。', '光明的力量如此強大、如此仁慈。', 'El poder de la Luz es grandioso y misericordioso.', 'El poder de la Luz es grandioso y misericordioso.', 'Небесный Свет поистине велик и милосерден!', 0, 0, 0, 0, 'The Balance of Light and Shadow - Peasant End 1');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900125, 'I have failed once more...', '아, 난 또다시 실패했군요...', 'J\'ai échoué une fois de plus…', 'Wieder einmal habe ich versagt...', '我再次失败了……', '我再次失敗了...', 'He vuelto a fallar...', 'He vuelto a fallar...', 'Я снова потерпела неудачу...', 0, 1, 0, 0, 'The Balance of Light and Shadow - Eris Havenfire Fail 1');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900126, 'I now return to whence I came, only to find myself here once more to relive the same epic tragedy.', '이제야 내가 왔던 곳으로 돌아왔는데 또다시 엄청난 비극을 겪게 되다니...', 'Je retourne d’où je viens, et je me retrouve ici une fois de plus pour revivre la même tragédie épique.', 'Ich kehre nun dorthin zurück, woher ich kam, nur um hier ein weiteres Mal die gleiche dramatische Tragödie zu durchleben.', '我现在就回去，我到这儿来无非是再次体验相同的悲惨遭遇罢了。', '我現在就回去，我到這兒來無非是再次體驗相同的悲慘遭遇罷了。', 'Ahora regreso al lugar de donde vengo, solo para encontrarme de nuevo aquí, para revivir la misma tragedia épica.', 'Ahora regreso al lugar de donde vengo, solo para encontrarme de nuevo aquí, para revivir la misma tragedia épica.', 'Я возвращаюсь туда, откуда пришла, но лишь затем, чтобы вновь пережить ужасную трагедию.', 0, 0, 0, 0, 'The Balance of Light and Shadow - Eris Havenfire Fail 2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900127, 'The Scourge are upon us! Run! Run for your lives!', '스컬지가 나타났다! 달아나라! 목숨을 건지려면 도망쳐라!', 'Le Fléau est sur nous ! Fuyez ! Fuyez si vous voulez vivre !', 'Die Geißel ist da! Rennt! Rennt um euer Leben!', '亡灵天灾来了！快跑啊！逃命吧！', '天譴軍團來啦!跑吧!逃命吧!', '¡La Plaga nos ataca! ¡Corred! ¡Corred si queréis salvar vuestra vida!', '¡La Plaga nos ataca! ¡Corran! ¡Corran si quieren salvar su vida!', 'Плеть идет! Бежим! Спасайтесь кто может!', 0, 1, 0, 0, 'The Balance of Light and Shadow - Peasant Spawn 1');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900128, 'Please help us! The Prince has gone mad!', '도와주세요! 왕자가 미쳐버렸어요!', 'Aidez-nous, par pitié ! Le prince est devenu fou !', 'Bitte helft uns! Der Prinz ist wahnsinnig geworden!', '请帮帮我们！王子发狂了！', '請幫幫我們!王子發狂了!', '¡Por favor, ayúdanos! ¡El príncipe se ha vuelto loco!', '¡Por favor, ayúdanos! ¡El príncipe se ha vuelto loco!', 'Пожалуйста, помогите нам! Принц сошел с ума!', 0, 1, 0, 0, 'The Balance of Light and Shadow - Peasant Spawn 2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900129, 'Seek sanctuary in the Hearthglen! It is our only hope!', '하스글렌으로 피신하세요! 그게 우리의 유일한 희망입니다!', 'Réfugiez-vous à Âtreval ! C’est notre seul espoir !', 'Sucht Schutz in Herdweiler! Das ist unsere einzige Hoffnung!', '去壁炉谷寻求庇护吧！那是我们惟一的希望！', '去壁爐谷尋求庇護吧!那是我們惟一的希望!', '¡Buscad refugio en la Vega del Amparo! ¡Es nuestra única esperanza!', '¡Buscad refugio en la Vega del Amparo! ¡Es nuestra única esperanza!', 'Ищи святилище в Дольном Очаге! Это наша единственная надежда!', 0, 1, 0, 0, 'The Balance of Light and Shadow - Peasant Spawn 3');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900130, 'Stratholme is no more! The city lies in ruins. The Prince consumed by hatred... madness...', '스트라솔름은 이제 끝이로군요! 도시는 폐허가 되어버렸고 왕자는 증오로 가득 차 미쳐버렸어요...', 'Stratholme est anéantie ! La ville est en ruine. Le prince est dévoré par la haine… la folie…', 'Stratholme gibt es nicht mehr! Die ganze Stadt liegt in Trümmern. Der Prinz ist von Hass und Wahnsinn besessen!', '斯坦索姆已经面目全非了！城市变成了一片废墟。王子被仇恨和疯狂……吞噬了……', '斯坦索姆已經面目全非啦!城市成為廢墟。王子沉浸在仇恨...瘋狂...中', '¡Stratholme ha desaparecido! La ciudad está en ruinas. El Príncipe, consumido por el odio... la locura...', '¡Stratholme ha desaparecido! La ciudad está en ruinas. El Príncipe, consumido por el odio... la locura...', 'Нет больше Стратхольма! Город лежит в руинах. Принца поглотила ненависть... безумие...', 0, 1, 0, 0, 'The Balance of Light and Shadow - Peasant Spawn 4');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900131, 'We are saved! The peasants have escaped the Scourge!', '이제 됐어요! 인부들이 스컬지에게서 탈출했습니다!', 'Nous sommes sauvés ! Les paysans ont échappé au Fléau !', 'Wir sind gerettet! Die Arbeiter konnten der Geißel entkommen!', '我们得救了！农夫们逃脱了亡灵天灾的魔爪！', '我們得救了啦!農民們逃脫了亡靈之手!', '¡Estamos salvados! ¡Los campesinos se han salvado de la Plaga!', '¡Estamos salvados! ¡Los campesinos se han salvado de la Plaga!', 'Мы спасены! Крестьяне скрылись от Плети!', 0, 1, 0, 0, 'The Balance of Light and Shadow - Eris Havenfire End');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900132, 'Be healed!', '치유되어라!', 'Guéris du mal qui t\'habite !', 'Seid geheilt!', '痊愈吧！', '已接受治療!', '¡Cúrate!', '¡Cúrate!', 'Исцелись!', 0, 1, 0, 0, 'The Balance of Light and Shadow - Eris Havenfire Heal');
-- There were no database errors about the texts below, but the text itself was hardcoded in the scripts.
-- Adding texts for The Battle of Darrowshire to script_texts so that localization can be used.
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900133, 'Horgus is slain!  Take heart, defenders of Darrowshire!', '호르구스가 죽었다! 힘을 내라! 다로우골의 파수병들이여!', 'Horgus a été tué ! Courage, défenseurs de Comté-de-Darrow !', 'Horgus wurde getötet! Schöpft neuen Mut, ihr Verteidiger von Darroheim!', '霍古斯被杀了！振作起来，达隆郡的守卫们！', '霍古斯被殺了!振作起來，達隆郡的防衛者們!', '¡Horgus ha sido asesinado! ¡Ánimo, defensores de Villa Darrow!', '¡Horgus ha sido asesinado! ¡Ánimo, defensores de Villa Darrow!', 'Хоргус повержен! Мужайтесь, защитники Дарроушира!', 0, 1, 0, 0, 'The Battle of Darrowshire - Horgus Died');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900134, 'Davil Lightfire is defeated!  Darrowshire is lost!', '다빌 라이트파이어가 죽었다! 다로우골이 졌다!', 'Davil Lumefeu est tombé ! Comté-de-Darrow est perdu !', 'Davil Lichterschein ist besiegt! Darroheim ist verloren!', '达维·莱法尔死了！达隆郡沦陷了！', '達維·萊法爾死了!達隆郡淪陷了!', '¡Davil Fuegoluz ha sido derrotado! ¡Villa Darrow está perdida!', '¡Davil Fuegoluz ha sido derrotado! ¡Villa Darrow está perdida!', 'Дейвил Лайтфайр побежден! Дарроушир пал!', 0, 1, 0, 0, 'The Battle of Darrowshire - Lightfire Died');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900135, 'Captain Redpath is slain!', '경비대장 레드패스가 죽었다!', 'Le capitaine Senterouge a été tué !', 'Hauptmann Rotpfad ist tot!', '雷德帕斯队长被杀了！', '雷德帕斯隊長被殺了!', '¡El capitán Rutagrana ha sido asesinado!', '¡El capitán Rutagrana ha sido asesinado!', 'Капитан Редпат повержен!', 0, 1, 0, 0, 'The Battle of Darrowshire - Redpath Died');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900136, 'The Scourge are defeated!  Darrowshire is saved!', '스컬지가 패배했다! 우린 다로우골을 지켜냈다!', 'Le Fléau est vaincu ! Comté-de-Darrow est sauvée !', 'Die Geißel ist besiegt! Darroheim ist gerettet!', '亡灵天灾被打败了！达隆郡得救了！', '天譴軍團被打敗了!達隆郡得救了!', '¡La Plaga ha sido derrotada! ¡Villa Darrow está a salvo!', '¡La Plaga ha sido derrotada! ¡Villa Darrow está a salvo!', 'Плеть побеждена! Дарроушир спасен!', 0, 1, 0, 0, 'The Battle of Darrowshire - Scourge Defeated');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900137, 'For Darrowshire!', '다로우골을 위하여!', 'Pour Comté-de-Darrow !', 'Für Darroheim!', '为了达隆郡！', '為了達隆郡!', '¡Por Villa Darrow!', '¡Por Villa Darrow!', 'За Дарроушир!', 0, 0, 0, 0, 'The Battle of Darrowshire - Militia Spawn 1');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900138, 'Our captain will save us!', '대장님이 구해 주실 거야!', 'Notre capitaine nous sauvera !', 'Unser Hauptmann wird uns retten!', '我们的队长会救我们的！', '我們的隊長會救我們的!', '¡Nuestro capitán nos salvará!', '¡Nuestro capitán nos salvará!', 'Капитан спасет нас!', 0, 0, 0, 0, 'The Battle of Darrowshire - Militia Spawn 2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900139, 'Fight!  Fight for your families!', '싸워라! 우리의 가족을 위해!', 'Battez-vous ! Battez-vous pour vos familles !', 'Kämpft! Kämpft für eure Familien!', '战斗！为了你的家人而战！', '戰鬥!為了你的家人而戰!', '¡Luchad! ¡Luchad por vuestras familias!', '¡Luchen! ¡Luchen por sus familias!', 'Сражайтесь! Сражайтесь за свои семьи!', 0, 0, 0, 0, 'The Battle of Darrowshire - Militia Spawn 3');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900140, 'The Scourge will not prevail!', '스컬지는 결코 승리하지 못한다!', 'Le Fléau ne passera pas !', 'Die Geißel wird nicht obsiegen!', '亡灵天灾不会得逞的！', '天譴軍團不會得逞的!', '¡La Plaga no se impondrá!', '¡La Plaga no se impondrá!', 'Плеть не победит!', 0, 0, 0, 0, 'The Battle of Darrowshire - Militia Spawn 4');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900141, 'Do not give up!  Shed your blood for Darrowshire!', '포기하지 마라! 다로우골을 위해 목숨을 바쳐라!', 'N\'abandonnez pas ! Versez votre sang pour Comté-de-Darrow !', 'Gebt nicht auf! Vergießt Euer Blut für Darroheim!', '不要放弃！为达隆郡而战！', '不要放棄!為達隆郡而戰!', '¡No os rindáis! ¡Derramad vuestra sangre por Villa Darrow!', '¡No se rindan! ¡Derramen su sangre por Villa Darrow!', 'Не сдавайтесь! Пролейте свою кровь во славу Дарроушира!', 0, 0, 0, 0, 'The Battle of Darrowshire - Militia Spawn 5');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900142, 'Fight, and we will win this day!', '싸워라! 승리는 우리 것이다!', 'Combattez et nous vaincrons !', 'Kämpft, dann werden wir siegen!', '战斗，我们今天一定会赢！', '戰鬥，我們今天一定會贏!', '¡Luchad y este día será el de nuestra victoria!', '¡Luchad y este día será el de nuestra victoria!', 'Сражайтесь! Сегодня мы победим!', 0, 0, 0, 0, 'The Battle of Darrowshire - Militia Spawn 6');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900143, 'Fight to your last breath, brothers and sisters!', '형제자매들이여, 최후의 순간까지 싸우자!', 'Combattez jusqu\'à votre dernier souffle, frères et sœurs !', 'Kämpft bis zu eurem letzten Atemzug, Brüder und Schwestern!', '战斗直到最后一息，兄弟姐妹们！', '戰鬥直到最後一息，兄弟姐妹們!', '¡Luchad hasta el último aliento, hermanos y hermanas!', '¡Luchad hasta el último aliento, hermanos y hermanas!', 'Сражайтесь до последнего, братья и сестры!', 0, 0, 0, 0, 'The Battle of Darrowshire - Militia Spawn 7');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900144, 'Go back to your Lich King, foul creatures!', '리치 왕에게로 돌아가, 역겨운 놈들아!', 'Retournez à votre roi-liche, immondes créatures !', 'Kehrt zu eurem Lichkönig zurück, ihr üblen Geschöpfe!', '回到你的巫妖王那里去，肮脏的东西！', '回到你的巫妖王那裡去，骯髒的東西!', '¡Regresad con vuestro Rey Exánime, horrendas criaturas!', '¡Regresen con su Rey Exánime, horrendas criaturas!', 'Возвращайтесь к своему Королю-личу, мерзкие отродья!', 0, 0, 0, 0, 'The Battle of Darrowshire - Militia Spawn 8');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900145, 'Darrowshire, to arms!  The Scourge approach!', '다로우골의 병사들이여, 전투 준비! 스컬지가 접근한다!', 'Comté-de-Darrow, aux armes ! Le Fléau approche !', 'Zu den Waffen, Darroheim! Die Geißel rückt näher!', '达隆郡的勇士们，拿起武器吧！亡灵天灾就要来了！', '達隆郡的勇士們，拿起武器吧!天譴軍團就要來了!', '¡Villa Darrow, a las armas! ¡La Plaga se acerca!', '¡Villa Darrow, a las armas! ¡La Plaga se acerca!', 'Дарроушир, к оружию! Плеть идет!', 0, 1, 0, 0, 'The Battle of Darrowshire - Defender Yell');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900146, 'Do not lose hope, Darrowshire!  We will not fall!', '다로우골이여! 희망의 빛을 잃지 말기를! 우리는 절대 꺾이지 않을 겁니다!', 'Ne perd pas espoir, Comté-de-Darrow ! Nous n\'échouerons pas !', 'Verliere nicht die Hoffnung, oh Darroheim! Wir werden nicht fallen!', '达隆郡，别放弃希望！我们不会失败的！', '達隆郡，別放棄希望!我們不會失敗的!', '¡No pierdas la esperanza, Villa Darrow! ¡No fracasaremos!', '¡No pierdas la esperanza, Villa Darrow! ¡No fracasaremos!', 'Не теряй надежду, Дарроушир! Мы не падем!', 0, 1, 0, 0, 'The Battle of Darrowshire - Lightfire Yell');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900147, 'Horgus, your nightmare ends!  Now!', '호르구스, 네놈의 악몽도 여기까지다! 각오해라!', 'Horgus, c\'est la fin de votre cauchemar ! Maintenant !', 'Horgus, jetzt endet Euer Alptraum!', '霍古斯，你的噩梦结束了！现在！', '霍古斯，你的夢魘結束了!現在!', 'Horgus, ¡tu pesadilla ha terminado! ¡Ahora!', 'Horgus, ¡tu pesadilla ha terminado! ¡Ahora!', 'Хоргус, твой кошмар окончен! Прямо сейчас!', 0, 1, 0, 0, 'The Battle of Darrowshire - Davil Yell');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900148, 'The Light burns bright in you, Davil.  I will enjoy snuffing it out!', '다빌, 네 안에서 성스러운 빛이 불타고 있군. 그럼, 즐거운 마음으로 그 빛을 꺼볼까!', 'La Lumière est intense en vous, Davil. Je me ferai un plaisir de l\'extraire !', 'Das Licht leuchtet hell in Euch, Davil. Es wird mir eine besondere Freude sein, es zum Verlöschen zu bringen!', '戴维，圣光照亮你的内心。我要把它挖出来！', '大衛，聖光照亮你的內心。我要把它挖出來!', 'La Luz brilla con fuerza en ti, Davil. ¡Disfrutaré extinguiéndola!', 'La Luz brilla con fuerza en ti, Davil. ¡Disfrutaré extinguiéndola!', 'Свет слишком ярко горит в твоей душе, Дейвил. Я с удовольствием его погашу!', 0, 1, 0, 0, 'The Battle of Darrowshire - Horgus Yell');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900149, 'Ah!  My wounds are too severe.  Defenders, fight on without me!', '아, 부상이 너무 심해... 병사들이여, 내가 없어도 꿋꿋히 맞서 싸워야 한다.', 'Ah ! Mes blessures sont trop graves. Défenseurs, continuez sans moi !', 'Ah! Meine Wunden sind zu schwer. Verteidiger, kämpft ohne mich weiter!', '啊！我的伤太严重了。卫士们，我不在你们要继续战斗！', '啊!我的傷太嚴重了。防衛者們，我不在你們要繼續戰鬥!', '¡Ah! Mis heridas son demasiado graves. Defensores, ¡seguid luchando sin mí!', '¡Ah! Mis heridas son demasiado graves. Defensores, ¡seguid luchando sin mí!', 'Ох! Мои раны слишком тяжелы. Продолжайте бой без меня!', 0, 1, 0, 0, 'The Battle of Darrowshire - Davil Despawn');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900150, 'Defenders of Darrowshire!  Rally!  We must prevail!', '다로우골의 병사들이여! 집결하라! 반드시 승리해야 한다!', 'Défenseurs de Comté-de-Darrow ! Rassemblez-vous ! Nous devons vaincre !', 'Verteidiger von Darroheim! Sammelt euch! Wir müssen siegen!', '达隆郡的守护者们！集合起来！我们必须战胜他们！', '達隆郡的防衛者們!集合起來!我們必須戰勝他們!', '¡Defensores de Villa Darrow! ¡Reuníos! ¡Debemos imponernos!', '¡Defensores de Villa Darrow! ¡Reuníos! ¡Debemos imponernos!', 'Защитники Дарроушира! Всем собраться! Мы должны победить!', 0, 1, 0, 0, 'The Battle of Darrowshire - Redpath Yell');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900151, 'Darrowshire is defeated!  Soon, all of Lordaeron will fall!', '다로우골은 패배한다! 조만간 로데론 전역이 파괴될 것이다!', 'Comté-de-Darrow est vaincu ! Bientôt, tout Lordaeron va disparaître !', 'Darroheim ist besiegt! Schon bald wird ganz Lordaeron fallen!', '达隆郡被击败了！很快，整个洛丹伦就会陷落！', '達隆郡被擊敗了!很快，整個羅德隆就會陷落!', '¡Villa Darrow ha sido derrotada! ¡Pronto caerá todo Lordaeron!', '¡Villa Darrow ha sido derrotada! ¡Pronto caerá todo Lordaeron!', 'Дарроушир пал! Еще немного – и падет весь Лордерон!', 0, 1, 0, 0, 'The Battle of Darrowshire - Redpath Corrupted');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900152, 'Redpath!  Your life ends, here and now!', '레드패스! 넌 여기서 끝이다!', 'Senterouge ! Votre vie prend fin ici et maintenant !', 'Rotpfad! Euer Leben endet hier und jetzt!', '雷德帕斯！纳命来！', '雷德帕斯!納命來!', '¡Rutagrana! ¡Ha llegado el fin de tus días, aquí y ahora!', '¡Rutagrana! ¡Ha llegado el fin de tus días, aquí y ahora!', 'Редпат! Прощайся с жизнью!', 0, 1, 0, 0, 'The Battle of Darrowshire - Marduk Yell');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900153, 'Pamela?  Are you there, honey?', '파멜라? 아가, 거기 있느냐?', 'Pamela ? Tu es là, ma chérie ?', 'Pamela? Bist du da, Schatz?', '帕米拉？亲爱的，你在那儿吗？', '帕米拉?親愛的，你在那兒嗎?', '¿Pamela? ¿Estás ahí, tesoro?', '¿Pamela? ¿Estás ahí, tesoro?', 'Памела? Ты здесь, милая?', 0, 0, 0, 22, 'The Battle of Darrowshire - Joseph Redpath 1');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900154, 'Daddy!', '아빠!', 'Papa !', 'Papa!', '爸爸！', '爸爸!', '¡Papá!', '¡Papá!', 'Папа!', 0, 0, 0, 0, 'The Battle of Darrowshire - Pamela Redpath 1');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900155, 'Daddy!  You\'re back!', '아빠! 왜 이리 늦게 온 거야!', 'Papa ! Tu es de retour !', 'Papa! Du bist zurück!', '爸爸！你回来了！', '爸爸!你回來了!', '¡Papá! ¡Has vuelto!', '¡Papá! ¡Has vuelto!', 'Папочка! Ты вернулся!', 0, 1, 0, 0, 'The Battle of Darrowshire - Pamela Redpath 2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900156, 'Let\'s go play!  No, tell me a story, Daddy!  No... let\'s go pick flowers!  And play tea time!  I found my dollie, did I tell you?', '아빠! 나랑 놀아줘요! 재미난 이야기도 해줘! 예쁜 꽃도 꺾으러 가고! 아이스크림도 사줘요! 인형도 찾았는데... 내가 아빠한테 말해줬나?', 'Allons jouer ! Ou plutôt non, raconte-moi une histoire, papa ! Non... Allons cueillir des fleurs ! Et jouer à la dînette ! J\'ai retrouvé ma poupée, je te l\'ai dit ?', 'Komm spielen! Nein, erzähl mir lieber eine Geschichte, Papa! Nein... komm, wir gehen Blumen pflücken! Und Kaffeeklatsch spielen! Und hab ich dir erzählt, dass ich meine Puppe wiedergefunden habe?', '我们去玩吧！不，给我讲个故事，爸爸！不……我们去摘花！然后喝茶！我找到我的玩具娃娃了，我告诉过你吗？', '我們去玩吧!不，給我講個故事，爸爸!不...我們去摘花!然後喝茶!我找到我的玩具娃娃了，我告訴過你嗎?', '¡Vamos a jugar! No, ¡cuéntame un cuento, papá! No... ¡vamos a coger flores! ¡Y a jugar a cocinitas! He encontrado mi muñeca, ¿te lo había dicho?', '¡Vamos a jugar! No, ¡cuéntame un cuento, papá! No... ¡vamos a coger flores! ¡Y a jugar a cocinitas! He encontrado mi muñeca, ¿te lo había dicho?', 'Давай поиграем! Нет, расскажи мне сказку, папочка! Нет... Пойдем лучше собирать цветочки! И поиграем в чаепитие! Я нашла свою куклу, я говорила тебе?', 0, 0, 0, 0, 'The Battle of Darrowshire - Pamela Redpath 3');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900157, 'Hahah!', '하하하!', 'Ha ha ha !', 'Haha!', '哈！', '哈!', '¡Jaja!', '¡Jaja!', 'Ха-ха!', 0, 0, 0, 11, 'The Battle of Darrowshire - Joseph Redpath 2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900158, 'I missed you so much, Daddy!', '아빠, 너무 보고 싶었어요!', 'Tu m\'as tellement manqué, papa !', 'Ich hab dich so vermisst, Papa!', '我真想你，爸爸！', '我真想你，爸爸!', '¡Te he echado tanto de menos, papá!', '¡Te he echado tanto de menos, papá!', 'Я так по тебе скучала, папочка!', 0, 0, 0, 0, 'The Battle of Darrowshire - Pamela Redpath 4');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900159, 'I missed you too, honey.  And I\'m finally home...', '나도 보고 싶었단다, 아가야. 이렇게 집으로 돌아왔잖니.', 'Tu m\'as manqué aussi, ma chérie... Me voici enfin à la maison...', 'Ich hab dich auch vermisst, Kleines. Aber jetzt bin ich ja endlich zu Hause...', '我也想你，亲爱的。我终于回家了……', '我也想你，親愛的。我終於回家了...', 'Te he echado tanto de menos, tesoro. Por fin estoy en casa...', 'Te he echado tanto de menos, tesoro. Por fin estoy en casa...', 'Я тоже по тебе скучал, милая. Наконец-то я дома...', 0, 0, 0, 1, 'The Battle of Darrowshire - Joseph Redpath 3');
-- Another small correction for The Battle of Darrowshire. Wrong equipment models for Marauding Skeleton and Darrowshire Defender
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (10948, 12890, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (10952, 1909, 2053, 0);
DELETE FROM `creature_equip_template_raw` WHERE `entry` IN (10948, 10952);
-- ERROR:CreatureEventAI:  Entry -1295 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1294 in table `creature_ai_texts` but not used in EventAI scripts.
-- Duplicated texts for Grethlok the Controller in Blackwing Lair.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-1294, -1295);
-- ERROR:CreatureEventAI:  Entry -1225 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1224 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1223 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1222 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1221 in table `creature_ai_texts` but not used in EventAI scripts.
-- Texts for Amnennar the Coldbringer. Has core script, texts are already present in script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-1221, -1222, -1223, -1224, -1225);
-- ERROR:CreatureEventAI:  Entry -1205 in table `creature_ai_texts` but not used in EventAI scripts.
-- Houndmaster Loksey, has a core script, texts are moved to script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1205;
-- ERROR:CreatureEventAI:  Entry -1204 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1203 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1202 in table `creature_ai_texts` but not used in EventAI scripts.
-- Bloodmage Thalnos, has a core script, texts are moved to script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-1202, -1203, -1204);
-- ERROR:CreatureEventAI:  Entry -1201 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1199 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1198 in table `creature_ai_texts` but not used in EventAI scripts.
-- Interrogator Vishas, has a core script, texts are moved to script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-1201, -1199, -1198);
-- ERROR:CreatureEventAI:  Entry -1200 in table `creature_ai_texts` but not used in EventAI scripts.
-- The Cleaner, has a core script, texts are moved to script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1200;
-- ERROR:CreatureEventAI:  Entry -1197 in table `creature_ai_texts` but not used in EventAI scripts.
-- Timmy the Cruel, uses core script so text should be moved to script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1197;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900160, 'TIMMY!', '티미!', 'TIMMY !', 'TIMMY!', '提米！', '提米!', '¡TIMMY!', '¡TIMMY!', 'ТИММИ!', 0, 1, 0, 0, 'Timmy the Cruel');
-- ERROR:CreatureEventAI:  Entry -1196 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1195 in table `creature_ai_texts` but not used in EventAI scripts.
-- This text belongs to Postmaster Malown but he has a core script now. Moving text to script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-1195, -1196);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900161, 'Prepare to be Malowned!', '이 말로운 님이 무서운 맛을 보여주마!', 'Préparez-vous au Malownage !', 'Gleich bekommt Ihr es mit Malown zu tun!', '准备被玛罗恩干掉吧。', '準備被瑪羅恩幹掉吧。', '¡Prepárate para recibir un machaque de Gassol!', '¡Prepárate para recibir un machaque de Gassol!', 'Сейчас тебя отмэлоунят!', 0, 0, 0, 0, 'Postmaster Malown - Aggro');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900162, 'You\'ve been MALOWNED!', '이 말로운 님의 무서운 맛을 잘 보았느냐?', 'Le MALOWNAGE vous écrase !', 'Das kommt davon, wenn man sich mit Malown anlegt!', '你已经被玛罗恩搞定了！', '你已經被瑪羅恩搞定了!', '¡Recibes un MACHAQUE de Gassol!', '¡Recibes un MACHAQUE de Gassol!', 'Тебя ОТМЭЛОУНИЛИ!', 0, 0, 0, 25, 'Postmaster Malown - Killed Victim');
-- ERROR:CreatureEventAI:  Entry -1194 in table `creature_ai_texts` but not used in EventAI scripts.
-- Magmus in BRD, has a core script, texts are moved to script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1194;
-- ERROR:CreatureEventAI:  Entry -1135 in table `creature_ai_texts` but not used in EventAI scripts.
-- Text for Lady Anacondra, it is duplicated, but has localization and correct sound id.
-- Updating event ai to use that entry and deleting the other.
DELETE FROM `creature_ai_texts` WHERE `entry`=-124;
UPDATE `creature_ai_scripts` SET `action1_param1`=-1135 WHERE `id`=367101;
-- ERROR:CreatureEventAI:  Entry -1058 in table `creature_ai_texts` but not used in EventAI scripts.
-- Archmage Allistarj unassigned emote text.
UPDATE `creature_ai_scripts` SET `action2_type`=1, `action2_param1`=-1058 WHERE `id`=766616;
-- ERROR:CreatureEventAI:  Entry -1047 in table `creature_ai_texts` but not used in EventAI scripts.
-- Text belongs to Witch Doctor Zum'rah, who uses a core script now, but texts were hardcoded.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1047;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900163, 'How dare you enter my sanctum!', '어떻게 감히 내 성소에 들어오는 게냐!', 'Comment osez-vous entrer dans mon sanctuaire !', 'Wie könnt Ihr es wagen, mein Sanktum zu betreten!', '你们怎敢侵入我的圣地！', '你們怎敢侵入我的聖地!', '¡Cómo osas entrar en mi sagrario!', '¡Cómo osas entrar en mi sagrario!', 'Как вы смеете входить в мой храм!', 0, 0, 0, 0, 'Witch Doctor Zumrah - Trigger');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900164, 'Sands consume you!', '뜨거운 모래 맛을 보고 싶나?', 'Que les sables vous engloutissent !', 'Hol Euch der Sand!', '流沙会吞噬你的！', '沙漠會將你吞噬!', '¡Que las arenas te consuman!', '¡Que las arenas te consuman!', 'Чтоб тебя пески пожрали!', 5872, 1, 14, 0, 'Witch Doctor Zumrah - Yell');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900165, 'Fall!', '죽어라!', 'Tombe !', 'Fallt!', '倒下吧！', '死吧!', '¡Muere!', '¡Muere!', 'Умри!', 5873, 1, 14, 0, 'Witch Doctor Zumrah - Killed Victim');
-- Wrong text for Weegli Blastfuse, not a startup error.
-- https://youtu.be/XfD7vj4Fnx8?t=6m49s
REPLACE INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1209001, 'Ok, here I go!', '자, 그럼 시작해볼까?', 'Voilà !', 'Gut, ich bin so weit!', '好了，我这就去！', '好了，我這就去!', '¡Vale, allá voy!', '¡Vale, allá voy!', 'Ага, я иду!', 0, 0, 0, 0, 'Weegli Blastfuse SAY_WEEGLI_OK_I_GO');
-- Missing text for Chief Ukorz Sandscalp, not a startup error.
-- https://youtu.be/XfD7vj4Fnx8?t=7m35s
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1209004, 'Who dares step into my domain!  Come!  Come, and be consumed!', '감히 누가 내 땅에 발을 들여놓는 것이냐! 덤벼봐! 집어삼켜 버리겠어!', 'Qui ose entrer dans mon domaine ? Venez ! Venez et soyez consumé !', 'Wer wagt es, mein Domizil zu betreten! Kommt! Kommt und werdet verzehrt!', '谁敢踏入我的领地！来！来被消灭吧！', '誰敢踏入我的領地!來!來被消滅吧!', '¡Quién osa adentrarse en mis dominios! ¡Ven! ¡Ven para ser consumido!', '¡Quién osa adentrarse en mis dominios! ¡Ven! ¡Ven para ser consumido!', 'Кто осмелился вторгнуться в мои владения?! Идите же, идите на свою погибель!', 0, 6, 0, 0, 'Chief Ukorz Sandscalp - Yell on Door Open');
-- ERROR:CreatureEventAI:  Entry -1002 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1001 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -1000 in table `creature_ai_texts` but not used in EventAI scripts.
-- Duplicated texts for Razza, Skarr the Unbreakable and Mushgog. Already exist in db_script_string.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-1000, -1001, -1002);
-- ERROR:CreatureEventAI:  Entry -825 in table `creature_ai_texts` but not used in EventAI scripts.
-- This text belongs to Shade of Eranikus, but was not added to the EventAI script.
UPDATE `creature_ai_scripts` SET `action2_type`=1, `action2_param1`=-825 WHERE `id`=570901;
-- ERROR:CreatureEventAI:  Entry -809 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -808 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -807 in table `creature_ai_texts` but not used in EventAI scripts.
-- Texts belong to Captain Kromcrush, he has a core script and texts have been moved to script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-809, -808, -807);
-- ERROR:CreatureEventAI:  Entry -706 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -705 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -704 in table `creature_ai_texts` but not used in EventAI scripts.
-- Texts belong to Tortured Slave, but EventAI script didn't have action2 set.
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=10117;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1011701, 10117, 1, 0, 100, 1, 5000, 25000, 9000, 14000, 5, 18, 0, 0, 1, -704, -705, -706, 0, 0, 0, 0, 'Tortured Slave - Cry Emote and Random Emote Text OOC');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1011702, 10117, 1, 0, 100, 1, 18000, 35000, 9000, 14000, 5, 20, 0, 0, 1, -704, -705, -706, 0, 0, 0, 0, 'Tortured Slave - Beg Emote and Text Emote');
-- ERROR:CreatureEventAI:  Entry -703 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -702 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -701 in table `creature_ai_texts` but not used in EventAI scripts.
-- Texts belong to General Rajaxx, he has a core script and texts are already added in script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-703, -702, -701);
-- ERROR:CreatureEventAI:  Entry -695 in table `creature_ai_texts` but not used in EventAI scripts.
-- Text belong to Ironaya, she has a core script and text is already added in script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry`=-695;
-- ERROR:CreatureEventAI:  Entry -649 in table `creature_ai_texts` but not used in EventAI scripts.
-- Text belongs to Stomper Kreeg, it was not assigned in the EventAI script.
UPDATE `creature_ai_scripts` SET `action2_type`=1, `action2_param1`=-649 WHERE `id`=1432205;
-- Not a startup error, but he should sometimes say random ogre text on aggro.
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1432218, 14322, 4, 0, 50, 0, 0, 0, 0, 0, 1, -359, -360, -361, 0, 0, 0, 0, 0, 0, 0, 0, 'Stomper Kreeg - Random Say on Aggro');
-- ERROR:CreatureEventAI:  Entry -526 in table `creature_ai_texts` but not used in EventAI scripts.
-- Text should be said by Blackhand Summoner when he summons adds. The npc has a core script.
-- There is one text when they start casting the spell, and another when the cast is finished.
-- Adding a scripted effect to the spells to print the text, and removing unused EventAI stuff.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-523, -524, -525, -526);
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=9818;
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000008200, '%s summons a Blackhand Dreadweaver to his aid!', '%s|1이;가; 자신을 도울 검은손부대 공포술사를 소환합니다!', '%s invoque un Tisseur d\'effroi Main-noire pour qu\'il vienne l\'aider !', '%s beschwört einen Schreckenswirker der der Schwarzfaustlegion zu seiner Unterstützung!', '%s召唤出黑手恐法师来帮助他！', '%s召喚了一個黑手織懼者來幫他的忙!', '%s invoca a un tejedor de tinieblas Puño Negro para que le ayude.', '%s invoca a un tejedor de tinieblas Puño Negro para que le ayude.', '%s призывает ткача ужаса из легиона Чернорука!');
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000008201, '%s summons a Blackhand Veteran to his aid!', '%s|1이;가; 자신을 도울 검은손부대 고참병을 소환합니다!', '%s invoque un vétéran Main-noire pour qu\'il vienne l\'aider !', '%s beschwört einen Veteranen der Schwarzfaustlegion zu seiner Unterstützung!', '%s召唤出黑手老兵来帮助他！', '%s召喚了一個黑手老兵來幫他的忙!', '%s invoca a un veterano Puño Negro para que le ayude.', '%s invoca a un veterano Puño Negro para que le ayude.', '%s призывает на помощь ветерана легиона Чернорука!');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900166, '%s begins to summon in a Blackhand Dreadweaver!', '%s|1이;가; 검은손부대 공포술사를 소환하기 시작합니다!', '%s commence à invoquer un Tisseur d\'effroi Main-noire !', '%s beginnt, einen Schreckenswirker der Schwarzfaustlegion zu beschwören!', '%s开始召唤黑手恐法师！', '%s開始召喚一個黑手織懼者!', '%s comienza a invocar a un tejedor de tinieblas Puño Negro.', '%s comienza a invocar a un tejedor de tinieblas Puño Negro.', '%s начинает призывать ткача ужаса из легиона Чернорука!', 0, 2, 0, 0, 'Blackhand Summoner - Begin cast Summon Blackhand Dreadweaver');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900167, '%s begins to summon in a Blackhand Veteran!', '%s|1이;가; 검은손부대 고참병을 소환하기 시작합니다!', '%s commence à invoquer un vétéran Main-noire !', '%s beginnt, einen Veteranen der Schwarzfaustlegion zu beschwören!', '%s开始召唤黑手老兵！', '%s開始召喚一個黑手老兵!', '%s comienza a invocar a un veterano Puño Negro.', '%s comienza a invocar a un veterano Puño Negro.', '%s начинает призывать ветерана легиона Чернорука!', 0, 2, 0, 0, 'Blackhand Summoner - Begin cast Summon Blackhand Veteran');
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (15792, 1, 0, 2, 0, 0, 0, 0, 2000008201, 0, 0, 0, 0, 0, 0, 0, 'Summon Blackhand Veteran: Say Emote Text');
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (15794, 1, 0, 2, 0, 0, 0, 0, 2000008200, 0, 0, 0, 0, 0, 0, 0, 'Summon Blackhand Dreadweaver: Say Emote Text');
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (15792, 1, 77, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 'Summon Blackhand Veteran - Text on successful cast.');
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (15794, 1, 77, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 'Summon Blackhand Dreadweaver - Text on successful cast.');
-- ERROR:CreatureEventAI:  Entry -428 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -427 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -426 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -425 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -424 in table `creature_ai_texts` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry -423 in table `creature_ai_texts` but not used in EventAI scripts.
-- These texts belong to Ol' Emma, most are already moved to db_script_string.
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-423, -424, -425, -426, -427, -428);
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000001883, 'Think I\'m starting to wear a rut in the paving stones.', '길에 깔린 이 돌들 때문에 내 발이 패이는 것 같아.', 'J’ai l’impression de m’enraciner dans les pavés.', 'Glaube, ich laufe langsam eine Rille in die Pflastersteine.', '我要上路了。', '我要上路了。', 'Creo que estoy empezando a dejar surcos en las losas.', 'Creo que estoy empezando a dejar surcos en las losas.', 'Да, мои морщины глубоки, как колеи на дороге.');
UPDATE `creature_movement` SET `textid2`=2000005104, `textid3`=2000005105, `textid4`=2000005106, `textid5`=2000005107 WHERE `id`=79796 && `point`=7;
UPDATE `creature_movement` SET `textid2`=2000005105, `textid3`=2000005106, `textid4`=2000005107, `textid5`=2000005108 WHERE `id`=79796 && `point`=10;
UPDATE `creature_movement` SET `textid2`=2000005106, `textid3`=2000005107, `textid4`=2000005108, `textid5`=2000001883 WHERE `id`=79796 && `point`=13;
UPDATE `creature_movement` SET `textid2`=2000005107, `textid3`=2000005108, `textid4`=2000001883, `textid5`=2000005103 WHERE `id`=79796 && `point`=16;
UPDATE `creature_movement` SET `textid2`=2000005108, `textid3`=2000001883, `textid4`=2000005103, `textid5`=2000005104 WHERE `id`=79796 && `point`=22;
UPDATE `creature_movement` SET `textid2`=2000001883, `textid3`=2000005103, `textid4`=2000005104, `textid5`=2000005105 WHERE `id`=79796 && `point`=27;
-- Not a startup error, but one of Justin's texts is missing, and another one is duplicated.
-- http://wowwiki.wikia.com/wiki/Justin
DELETE FROM `db_script_string` WHERE `entry`=2000005109;
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000005109, 'There is no spoon.', '숟가락이 없네.', 'Il n’y a pas de cuillère.', 'Den Löffel gibt es nicht.', '勺子并不存在。', '湯匙並不存在。', 'No hay cucharas.', 'No hay cucharas.', 'Ложки не существует.');
-- ERROR:CreatureEventAI:  Entry -342 in table `creature_ai_texts` but not used in EventAI scripts.
-- This text belongs to Edwin VanCleef, should be said at 50% HP when he summons adds.
-- Current text is -171 but that one should be said at 75% hp instead.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (63903, 63904);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (63904, 639, 2, 0, 100, 0, 50, 36, 0, 0, 1, -342, 0, 0, 11, 5200, 0, 0, 0, 0, 0, 0, 'Edwin VanCleef - Emote and Summon VanCleef\'s Allies at 50% HP');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (63903, 639, 2, 0, 100, 0, 75, 51, 0, 0, 1, -171, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edwin VanCleef - Yell at 75% HP');
-- ERROR:CreatureEventAI:  Entry -74 in table `creature_ai_texts` but not used in EventAI scripts.
-- Text belongs to Addled Leper, not assigned in EventAI script.
UPDATE `creature_ai_scripts` SET `action2_type`=1, `action2_param1`=-74 WHERE `id`=622103;
-- ERROR:CreatureEventAI:  Entry -29 in table `creature_ai_texts` but not used in EventAI scripts.
-- Text belongs to King Gordok, who has a core script. Text already moved to script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry`=-29;
-- ERROR:CreatureEventAI:  Entry -28 in table `creature_ai_texts` but not used in EventAI scripts.
-- Text belongs to Tendris Warpwood, who has a core script. Moving text to script_texts.
DELETE FROM `creature_ai_texts` WHERE `entry`=-28;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1900168, 'You do not belong here!  Ancients, rise against these intruders!', '너희는 이곳의 존재가 아니구나! 고대 정령들이여, 일어나서 침입자들을 해치워라!', 'Votre place n\'est pas ici ! Anciens, affrontez les intrus !', 'Ihr gehört nicht hierher! Ihr Uralten, erhebt euch gegen diese elenden Eindringlinge!', '你并不属于这里！远古的守卫，醒来吧！消灭入侵者！', '你不屬於這裡!上古之人，為對抗這些入侵者而起!', '¡Este no es sitio para ti! ¡Ancestros, alzaos contra los intrusos!', '¡Este no es sitio para ti! ¡Ancestros, alzaos contra los intrusos!', 'Вам здесь не место! Древа, восстаньте против этих чужаков!', 0, 1, 0, 0, 'Tendris Warpwood - Aggro');
-- ERROR:CreatureEventAI:  Entry 10 in table `creature_ai_summons` but not used in EventAI scripts.
-- ERROR:CreatureEventAI:  Entry 11 in table `creature_ai_summons` but not used in EventAI scripts.
-- Summon data for Alzzin the Wildshaper, but he uses a core script.
DELETE FROM `creature_ai_summons` WHERE `id` IN (10, 11);
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=11492;
-- ERROR:CreatureEventAI:  Entry 20 in table `creature_ai_summons` but not used in EventAI scripts.
-- Summon data for Halycon, but he uses a core script.
DELETE FROM `creature_ai_summons` WHERE `id`=20;
-- ERROR:CreatureEventAI:  Entry 21 in table `creature_ai_summons` but not used in EventAI scripts.
-- Summon data for Princess Theradras, but he uses a core script.
DELETE FROM `creature_ai_summons` WHERE `id`=21;

-- ERROR:Entry -1000298 in table `script_texts` has Emote 393 but emote does not exist.
UPDATE `script_texts` SET `emote`=0 WHERE `entry`=-1000298;
-- ERROR:Entry -1000303 in table `script_texts` has Emote 393 but emote does not exist.
UPDATE `script_texts` SET `emote`=0 WHERE `entry`=-1000303;
-- ERROR:Entry -1033015 in table `script_texts` has Emote 432 but emote does not exist.
UPDATE `script_texts` SET `emote`=69 WHERE `entry`=-1033015;

-- ERROR:No script found for ScriptName 'go_altar_of_archaedas'.
-- ERROR:No script found for ScriptName 'go_altar_of_the_keepers'.
UPDATE `gameobject_template` SET `ScriptName`='' WHERE `entry` IN (130511, 133234);

-- ERROR:Spell entry 3236 from `spell_disabled` doesn't exist in dbc, ignoring.
DELETE FROM `spell_disabled` WHERE `entry`=3236;

--                                               `.::/+++ooooooooo+/:..
--       _____ ___ _   _                    ./oooo/:-````         `.-/+ooo/.
--      |  ___|_ _| \ | |               `/oo/.`                           .+oo/`
--      | |_   | ||  \| |             `/oo.                                   `-+o+.
--      |  _|  | || |\  |           /s-`                                         .+o+.
--      |_|   |___|_| \_|         -y:                                               .+o-
--                              `oo`                                                  `/s.
--                             .y/                                                      .o+`
--                            `h-                                                         /y.
--                            :h                                                           -h.
--                            +y                                                            -h`
--                           .d-                                                             /y`
--                          `h+::::::.            :++::::--.`                                 s+
--                          yMNNMMMMNmy:          oMMMMMMNNNmmdhs+:`                          .d`
--                         -NMmyoooo+:.h:         :yys+:::://oshmNNd/                          y:
--                         :h-.        :h          .:           `./o.                          /y
--                         :y          .m`         o:                                          .m
--                         :y  ```.-:` oy         `sh:.`                                       `m
--                         :myyhhhyy/ .d.          -/shhhyshsy/                                .m
--                         oo.-...`  :y:              `..--::-`                                /y
--                        :h`      `+y.       ``                                               h-
--                       .d.      +sm:        :s:`                                            /y
--                      `h/      .m./    `--.  .dy:                                    ..::::/y`
--                      :h        s+s+   ./:o: -d-s/                                 /o+/:++osy.
--                      +s         ``.        -o-                                       -s+-/-:h`
--                      :h                                                            -+s-  `` oo
--                      `m`       .-:////:::::-.`                `-.                `/o-.`  :s :h
--                       d.     .+o+///////++//+o+.    -`       /o/.                so` /s  :d`s+
--                       h:    +yyo+//:::::://+o+yso` `d-      /y`                ++y:  `N  sss+
--                       h:    +yso////:::::::/+sh/y. +y      `/-                `yso+:`+y  sy:
--                      ods+.   /s/////////////+o+:  /s.``  -+o+o+-            `    `oh-+`.so`
--                      my/-d.   `::://////////-`    `-o++s/h.   .h:       +/ .s:.`` ` `./s:
--                     `m/h +s                       /y`  /M/.`   +s       h:  ./+++ooy++-`
--                     /dss .d`                     -h:/``+m`+s+o-s+      -d`        `m
--                     /y`  `m.                     h/.+//yd   `` d+.`   :y-         `m
--                     /m/ /shoo.                  `m` `` ys  -oo:N++h `+y.          `m
--                     -h  s/h`+s               ```:h  .+.d+     :d .mos/            `m
--                     .d  d:m.`N             `/s+yho    `N/     ssood/              `m.
--                     .d  do: `m/.```````````ys- oM+    .N/     h+`.s+              .m
--                     .d  d-   d+hy+++++++++yy+y+yM:    .N.    `N.:-+o              -d
--                     /m``mo   h:y/         m.  `yM-    .N` ```-m   :h               d.
--                     ss:`m`   /y+s        -d  /-hN`  ``.N./o+/:d   -d               +y`
--                     s/ `m`   -d+s        oo    dN` `oo:m`    -N  `:d                :ss+-`
--                     +s `m`   `m/h        h-   `Nh     -d     .N `o/d                   ./os/`
--                     /s `m`    d/d       `m`   `Nh     /m     `m.   d.                     `:oy/.
--                     s/ .m`    yod       .d  ++`mh     /m      d:   y/                         -+so+-`
--                     d. :h     s+m`      /y     hh     /m      h/   +s.                            ./oooo++:.
--                    -d  /y     soN`      /s     oh     /m      os   -N+h:                                 `:+soo:`
--                    h/  y/     `/d-      oo     oh     -o      .:   .d`/s                                      `:oso:.
--                   os `.+.       +o      y/     oh                   h:s+                                          `-+so/`
--                  .m`.h-         +o     -d.     :y                   :dm`                                              `-os/`
--                  s+ :s          .h-    y/                            hy                                                  `:y+`
--               `/sm`              +s   :h      `       s.      -/     /y                                  `.:/+o:           `:so/`
--             .+o--d               .d`  s+     `+       y:      .d     /y                               `/oo/-.``               `:+ 
--           -o+.  .d               `h: -h`              :-      :y     s+                            `:oo-`                          
--     .:++oo/`    .d                -d.h:                       ``     s+                       `-:+oo:`                             
                  
