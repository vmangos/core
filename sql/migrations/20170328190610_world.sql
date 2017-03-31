INSERT INTO `migrations` VALUES ('20170328190610'); 

-- Warchief's Blessing event texts
INSERT INTO creature_ai_texts (entry, content_default, `comment`) VALUES (-143961, 'Honor your heroes! On this day, they have dealt a great blow against one of our most hated enemies! The false Warchief, Rend Blackhand, has fallen!', 'warchief blessing yell1');
INSERT INTO creature_ai_texts (entry, content_default, `comment`) VALUES (-143962, 'Be bathed in my power! Drink in my might! Battle for the glory of the Horde!', 'warchief blessing yell2');
INSERT INTO creature_ai_texts (entry, content_default, `comment`) VALUES (-143963, 'Be bathed in the power of the Warchief! Drink in his might! Battle for the glory of the Horde!', 'warchief blessing yell3');
INSERT INTO creature_template (entry, modelid_1, name, minhealth, maxhealth, armor, faction_A, faction_H, mindmg, maxdmg, attackpower, baseattacktime, rangeattacktime, unit_class, unit_flags, `type`, flags_extra) VALUES (21003, 13069, 'Warchief Blessing Generator', 8, 8, 7, 85, 85, 2, 2, 44, 2000, 2000, 1, 33554946, 10, 2);
