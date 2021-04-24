DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200807012348');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200807012348');
-- Add your query below.


DELETE FROM `script_texts` WHERE `entry` IN (-1533000, -1533001, -1533002, -1533003, -1533004, -1533005, -1533006, -1533007,
                                             -1533008, -1000003, -1533010, -1533011, -1533012, -1533013, -1533014, -1533015,
                                             -1533016, -1533044, -1533045, -1533046, -1533047, -1533048, -1533049, -1533050,
                                             -1533065, -1533066, -1533067, -1533068, -1533069, -1533070, -1533071, -1533072,
                                             -1533073, -1533074, -1533155, -1533154, -1533153, -1533051, -1533052, -1533053,
                                             -1533054, -1533055, -1533056, -1533057, -1533058, -1533059, -1533060, -1533061,
                                             -1533062, -1533063, -1533064, -1533119, -1533152, -1533040, -1533140, -1533141,
                                             -1533142, -1533041, -1533042, -1533043, -1533109, -1533110, -1533111, -1533112,
                                             -1533113, -1533114, -1533115, -1533117, -1533116, -1533105, -1533135, -1533094,
                                             -1533095, -1533096, -1533097, -1533098, -1533099, -1533100, -1533101, -1533102,
                                             -1533103, -1533104, -1533143, -1533145, -1533144, -1533146, -1533147, -1533148,
                                             -1533130, -1533131, -1533132, -1533133, -1533075, -1533076, -1533077, -1533078,
                                             -1533079, -1533080, -1533081, -1533017, -1533018, -1533019, -1533020, -1533021,
                                             -1533022, -1533120, -1533121, -1533122, -1533123, -1533124, -1533125, -1533126,
                                             -1533127, -1533128, -1533129, -1533159, -1533082, -1533083, -1533023, -1533024,
                                             -1533025, -1533026, -1533027, -1533028, -1533151, -1533030, -1533031, -1533032,
                                             -1533033, -1533034, -1533035, -1533149, -1533150, -1533036, -1533037, -1533038,
                                             -1533039, -1533090, -1533091, -1533092, -1533093, -1533089, -1533084, -1533085,
                                             -1533086, -1533087, -1533088, -1533009, -1533029, -1533052, -1533061, -1533073,
                                             -1533047);

UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8788 WHERE `entry` = 13004;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8785 WHERE `entry` = 13000;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8786 WHERE `entry` = 13002;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8787 WHERE `entry` = 13003;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8790 WHERE `entry` = 13006;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8791 WHERE `entry` = 13007;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8792 WHERE `entry` = 13008;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8793 WHERE `entry` = 13009;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8789 WHERE `entry` = 13005;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8794 WHERE `entry` = 12856;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8795 WHERE `entry` = 12857;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8796 WHERE `entry` = 12858;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8797 WHERE `entry` = 12859;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8800 WHERE `entry` = 12854;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8801 WHERE `entry` = 12855;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8798 WHERE `entry` = 12853;
UPDATE `broadcast_text` SET `sound_id` = 8892 WHERE `entry` = 13010;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8896 WHERE `entry` = 13014;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8897 WHERE `entry` = 13015;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8898 WHERE `entry` = 13016;
UPDATE `broadcast_text` SET `sound_id` = 8895 WHERE `entry` = 13013;
UPDATE `broadcast_text` SET `sound_id` = 8894 WHERE `entry` = 13014;
UPDATE `broadcast_text` SET `sound_id` = 8893 WHERE `entry` = 13011;
UPDATE `broadcast_text` SET `sound_id` = 8835 WHERE `entry` = 13051;
UPDATE `broadcast_text` SET `sound_id` = 8836 WHERE `entry` = 13052;
UPDATE `broadcast_text` SET `sound_id` = 8837 WHERE `entry` = 13053;
UPDATE `broadcast_text` SET `sound_id` = 8839 WHERE `entry` = 13055;
UPDATE `broadcast_text` SET `sound_id` = 8840 WHERE `entry` = 13056;
UPDATE `broadcast_text` SET `sound_id` = 8841 WHERE `entry` = 13057;
UPDATE `broadcast_text` SET `sound_id` = 8842 WHERE `entry` = 13058;
UPDATE `broadcast_text` SET `sound_id` = 8843 WHERE `entry` = 13059;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8844 WHERE `entry` = 13060;
UPDATE `broadcast_text` SET `sound_id` = 8838 WHERE `entry` = 13054;
UPDATE `broadcast_text` SET `sound_id` = 8899 WHERE `entry` = 13034;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8903 WHERE `entry` = 13038;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8904 WHERE `entry` = 13039;
UPDATE `broadcast_text` SET `sound_id` = 8905 WHERE `entry` = 13040;
UPDATE `broadcast_text` SET `sound_id` = 8902 WHERE `entry` = 13037;
UPDATE `broadcast_text` SET `sound_id` = 8901 WHERE `entry` = 13036;
UPDATE `broadcast_text` SET `sound_id` = 8900 WHERE `entry` = 13035;
UPDATE `broadcast_text` SET `sound_id` = 8913 WHERE `entry` = 13097;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8917 WHERE `entry` = 13101;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8918 WHERE `entry` = 13102;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8919 WHERE `entry` = 13103;
UPDATE `broadcast_text` SET `sound_id` = 8916 WHERE `entry` = 13100;
UPDATE `broadcast_text` SET `sound_id` = 8915 WHERE `entry` = 13099;
UPDATE `broadcast_text` SET `sound_id` = 8914 WHERE `entry` = 13098;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8807 WHERE `entry` = 13029;
UPDATE `broadcast_text` SET `chat_type` = 1 WHERE `entry` = 13031;
UPDATE `broadcast_text` SET `chat_type` = 1 WHERE `entry` = 13032;
UPDATE `broadcast_text` SET `chat_type` = 1 WHERE `entry` = 13033;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8806 WHERE `entry` = 13027;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8805 WHERE `entry` = 13026;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8808 WHERE `entry` = 13028;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8825 WHERE `entry` = 13041;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8826 WHERE `entry` = 13042;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8827 WHERE `entry` = 13043;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8829 WHERE `entry` = 13045;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8830 WHERE `entry` = 13046;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8831 WHERE `entry` = 13047;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8832 WHERE `entry` = 13048;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8834 WHERE `entry` = 13050;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8833 WHERE `entry` = 13049;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8819 WHERE `entry` = 12999;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8809 WHERE `entry` = 12995;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8810 WHERE `entry` = 12996;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8811 WHERE `entry` = 12997;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8817 WHERE `entry` = 13021;
UPDATE `broadcast_text` SET `sound_id` = 8818 WHERE `entry` = 13022;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8814 WHERE `entry` = 13019;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8812 WHERE `entry` = 13017;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8813 WHERE `entry` = 13018;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8815 WHERE `entry` = 13020;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8816 WHERE `entry` = 12998;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8824 WHERE `entry` = 12994;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8845 WHERE `entry` = 13061;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8846 WHERE `entry` = 13062;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8847 WHERE `entry` = 13063;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8851 WHERE `entry` = 13067;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8849 WHERE `entry` = 13065;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8850 WHERE `entry` = 13066;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8848 WHERE `entry` = 13064;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8909 WHERE `entry` = 13068;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8910 WHERE `entry` = 13069;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8912 WHERE `entry` = 13071;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8911 WHERE `entry` = 13070;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8852 WHERE `entry` = 13072;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8853 WHERE `entry` = 13073;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8854 WHERE `entry` = 13074;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8861 WHERE `entry` = 13080;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8862 WHERE `entry` = 13081;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8855 WHERE `entry` = 13075;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8856 WHERE `entry` = 13076;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8858 WHERE `entry` = 13077;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8859 WHERE `entry` = 13078;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8860 WHERE `entry` = 13079;
UPDATE `broadcast_text` SET `chat_type` = 3 WHERE `entry` = 13082;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8864 WHERE `entry` = 13083;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8866 WHERE `entry` = 13085;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8865 WHERE `entry` = 13084;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8802 WHERE `entry` = 13023;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8804 WHERE `entry` = 13025;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8803 WHERE `entry` = 13024;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8867 WHERE `entry` = 13086;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8868 WHERE `entry` = 13087;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8869 WHERE `entry` = 13088;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8877 WHERE `entry` = 13096;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8871 WHERE `entry` = 13090;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8870 WHERE `entry` = 13089;
UPDATE `broadcast_text` SET `chat_type` = 3 WHERE `entry` = 12156;
UPDATE `broadcast_text` SET `chat_type` = 3 WHERE `entry` = 12178;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8873 WHERE `entry` = 13092;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8874 WHERE `entry` = 13093;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8875 WHERE `entry` = 13094;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8876 WHERE `entry` = 13095;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8820 WHERE `entry` = 12984;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8821 WHERE `entry` = 12985;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8822 WHERE `entry` = 12986;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8823 WHERE `entry` = 12987;
UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` = 13150;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8878 WHERE `entry` = 12990;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8881 WHERE `entry` = 12988;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8879 WHERE `entry` = 12991;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8882 WHERE `entry` = 12989;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 8880 WHERE `entry` = 12992;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8799 WHERE `entry` = 12852;
UPDATE `broadcast_text` SET `chat_type` = 1, `sound_id` = 8872 WHERE `entry` = 13091;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
