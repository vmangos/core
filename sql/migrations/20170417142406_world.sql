INSERT INTO `migrations` VALUES ('20170417142406');

-- Update MechanicImmuneMask for, { 771 Commander Felstrom, 1520 Rattlecage Soldier, 1522 Darkeye Bonecaster, 1869 Ravenclaw Champion, 1870 Hand of Ravenclaw, 1871 Eliza's Guard, 1973 Ravenclaw Guardian, 2283 Ravenclaw Regent, 2946 Puppet of Helcular, 7346 Splinterbone Centurion, 8524 Cursed Mage, 8526 Dark Caster, 10489 Risen Guard, 10826 Lord Darkscythe, 11076 Cauldron Lord Razarch, 11077 Cauldron Lord Malvinious, 12208 Conquered Soul of the Blightcaller } 
update creature_template set MechanicImmuneMask = 213521 where entry in (8524, 771, 1520, 1522, 1869, 1870, 1871, 1973, 2283, 2946, 7346, 8526, 10489, 10826, 11077, 12208, 11076);
