DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180526193243');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180526193243');
-- Add your query below.


-- Make specific Ancient Core Hound in MC switch to random movement on waypoint 8.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES
(116, 46, 0, 0, 0), -- Is Alive
(117, 43, 0, 0, 1), -- Is Not In Combat
(118, -1, 116, 117, 2), -- Source Is Alive And Not In Combat
(119, 43, 0, 0, 0), -- Source Is In Combat
(120, -1, 116, 119, 2); -- Source Is Alive And In Combat
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (56851, 1, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 118, 'Ancient Core Hound - Start Random Movement (Out of Combat)');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (56851, 1, 67, 1, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 120, 'Ancient Core Hound - Set Default Movement to Random Movement (In Combat)');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (56851, 120, 20, 2, 1, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 118, 'Ancient Core Hound - Resume Waypoint Movement from Point 8 (Out of Combat)');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (56851, 120, 67, 2, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 120, 'Ancient Core Hound - Set Default Movement to Waypoint Movement (In Combat)');
UPDATE `creature_movement` SET `waittime`=5000, `script_id`=56851 WHERE `point`=8 && `id`=56851;

-- Fix newly introduced startup errors.
-- ERROR:Creature (GUID: 46654) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46655) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46656) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46657) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46658) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46659) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46660) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46661) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46662) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46663) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46664) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46665) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46666) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46667) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46668) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46669) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46670) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46671) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46672) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46673) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46690) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46724) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46725) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46726) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46727) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46728) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46729) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46730) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46731) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46732) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46733) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46734) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46735) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46736) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46737) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46738) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46739) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46740) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46741) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46742) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46743) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46744) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46745) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46856) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46892) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46893) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46895) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46896) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46960) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46962) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46963) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46965) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46966) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46967) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46969) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46970) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46977) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46978) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46979) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46990) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46991) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46992) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 46994) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47045) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47046) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47047) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47048) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47049) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47050) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47051) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47077) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47078) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47079) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47080) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47081) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47086) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47087) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47205) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47206) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47207) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47209) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47210) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47211) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47212) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47213) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47214) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47215) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 47216) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 48173) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 48174) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 48203) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 48209) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 88903) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 88904) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 88905) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 88906) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 88907) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 88908) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 88909) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 88911) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90487) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90489) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90491) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90513) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90515) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90516) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90517) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90519) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90520) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90521) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90522) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90523) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90524) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90525) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90526) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90527) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90528) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90529) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90530) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90531) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90532) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90533) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90534) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90535) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90536) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90537) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90538) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90539) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90540) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90541) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90542) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90543) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90544) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90545) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90546) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90547) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90548) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90549) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90550) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90551) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90552) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90553) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90554) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90555) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90556) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90557) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90558) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90559) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90560) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90561) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90562) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90563) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90564) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90565) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90566) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90567) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90568) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90569) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90570) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90571) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90572) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90573) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90574) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90575) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90576) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90577) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90578) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90579) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90580) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90581) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90582) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90583) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90584) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90585) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90747) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90748) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90749) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90750) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90751) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90752) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90753) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90754) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90755) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90756) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90757) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90758) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90759) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90760) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90761) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90762) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90763) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90764) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90765) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90766) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90768) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90769) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90770) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90771) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90772) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90773) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90774) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90775) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90776) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90777) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90778) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90779) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90780) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90781) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90784) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90786) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90787) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90788) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90789) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90790) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90791) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90792) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90793) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90794) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90795) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90796) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90797) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90798) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90799) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90800) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90801) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90802) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90803) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90804) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90806) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 90807) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 91108) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 91109) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 91110) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 91112) does not exist but has a record in `creature_addon`
DELETE FROM `creature_addon` WHERE `guid` IN (46654, 46655, 46656, 46657, 46658, 46659, 46660, 46661, 46662, 46663, 46664, 46665, 46666, 46667, 46668, 46669, 46670, 46671, 46672, 46673, 46690, 46724, 46725, 46726, 46727, 46728, 46729, 46730, 46731, 46732, 46733, 46734, 46735, 46736, 46737, 46738, 46739, 46740, 46741, 46742, 46743, 46744, 46745, 46856, 46892, 46893, 46895, 46896, 46960, 46962, 46963, 46965, 46966, 46967, 46969, 46970, 46977, 46978, 46979, 46990, 46991, 46992, 46994, 47045, 47046, 47047, 47048, 47049, 47050, 47051, 47077, 47078, 47079, 47080, 47081, 47086, 47087, 47205, 47206, 47207, 47209, 47210, 47211, 47212, 47213, 47214, 47215, 47216, 48173, 48174, 48203, 48209, 88903, 88904, 88905, 88906, 88907, 88908, 88909, 88911, 90487, 90489, 90491, 90513, 90515, 90516, 90517, 90519, 90520, 90521, 90522, 90523, 90524, 90525, 90526, 90527, 90528, 90529, 90530, 90531, 90532, 90533, 90534, 90535, 90536, 90537, 90538, 90539, 90540, 90541, 90542, 90543, 90544, 90545, 90546, 90547, 90548, 90549, 90550, 90551, 90552, 90553, 90554, 90555, 90556, 90557, 90558, 90559, 90560, 90561, 90562, 90563, 90564, 90565, 90566, 90567, 90568, 90569, 90570, 90571, 90572, 90573, 90574, 90575, 90576, 90577, 90578, 90579, 90580, 90581, 90582, 90583, 90584, 90585, 90747, 90748, 90749, 90750, 90751, 90752, 90753, 90754, 90755, 90756, 90757, 90758, 90759, 90760, 90761, 90762, 90763, 90764, 90765, 90766, 90768, 90769, 90770, 90771, 90772, 90773, 90774, 90775, 90776, 90777, 90778, 90779, 90780, 90781, 90784, 90786, 90787, 90788, 90789, 90790, 90791, 90792, 90793, 90794, 90795, 90796, 90797, 90798, 90799, 90800, 90801, 90802, 90803, 90804, 90806, 90807, 91108, 91109, 91110, 91112);
-- ERROR:CREATURE GROUPS: Bad leader guid 56659
DELETE FROM `creature_groups` WHERE `leaderGUID`=56659;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
