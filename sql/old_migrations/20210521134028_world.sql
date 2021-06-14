DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210521134028');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210521134028');
-- Add your query below.


-- Defias Renegade Mage is using wrong spell id for Fireball.
UPDATE `creature_template` SET `spell_id1`=20793 WHERE `entry`=450 && `spell_id1`=143;

-- Defias Renegade Mage is using wrong spell id for Fireball.
UPDATE `creature_template` SET `spell_id2`=20793 WHERE `entry`=450 && `spell_id2`=145;

-- Riverpaw Mystic is using wrong spell id for Healing Wave.
UPDATE `creature_template` SET `spell_id2`=913 WHERE `entry`=453 && `spell_id2`=11986;

-- Kobold Geomancer is using wrong spell id for Fireball.
UPDATE `creature_template` SET `spell_id1`=20793 WHERE `entry`=476 && `spell_id1`=133;

-- Murloc Nightcrawler is using wrong spell id for Backstab.
UPDATE `creature_template` SET `spell_id1`=2589 WHERE `entry`=544 && `spell_id1`=7159;

-- Defias Pillager is using wrong spell id for Fireball.
UPDATE `creature_template` SET `spell_id1`=19816 WHERE `entry`=589 && `spell_id1`=20793;

-- Wyrmkin Dreamwalker is using wrong spell id for Rejuvenation.
UPDATE `creature_template` SET `spell_id3`=12160 WHERE `entry`=743 && `spell_id3`=20664;

-- Defias Night Blade is using wrong spell id for Slowing Poison.
UPDATE `creature_template` SET `spell_id3`=7992 WHERE `entry`=909 && `spell_id3`=8601;

-- Bluegill Warrior is using wrong spell id for Battle Stance.
UPDATE `creature_template` SET `spell_id2`=7165 WHERE `entry`=1027 && `spell_id2`=2457;

-- Red Wyrmkin is using wrong spell id for Fire Blast.
UPDATE `creature_template` SET `spell_id2`=14145 WHERE `entry`=1046 && `spell_id2`=16144;

-- Stonesplinter Geomancer is using wrong spell id for Flamestrike.
UPDATE `creature_template` SET `spell_id1`=2120 WHERE `entry`=1165 && `spell_id1`=11829;

-- Bloodsail Swashbuckler is using wrong spell id for Kick.
UPDATE `creature_template` SET `spell_id2`=1768 WHERE `entry`=1563 && `spell_id2`=11978;

-- Bloodsail Warlock is using wrong spell id for Curse of Weakness.
UPDATE `creature_template` SET `spell_id1`=7646 WHERE `entry`=1564 && `spell_id1`=11980;

-- Bloodsail Sea Dog is using wrong spell id for Gouge.
UPDATE `creature_template` SET `spell_id2`=8629 WHERE `entry`=1565 && `spell_id2`=12540;

-- Dextren Ward is using wrong spell id for Battle Stance.
UPDATE `creature_template` SET `spell_id3`=7165 WHERE `entry`=1663 && `spell_id3`=2457;

-- Defias Prisoner is using wrong spell id for Kick.
UPDATE `creature_template` SET `spell_id1`=1766 WHERE `entry`=1706 && `spell_id1`=11978;

-- Defias Captive is using wrong spell id for Infected Wound.
UPDATE `creature_template` SET `spell_id2`=3427 WHERE `entry`=1707 && `spell_id2`=17230;

-- Defias Captive is using wrong spell id for Backstab.
UPDATE `creature_template` SET `spell_id1`=7159 WHERE `entry`=1707 && `spell_id1`=15657;

-- Skeletal Executioner is using wrong spell id for Strike.
UPDATE `creature_template` SET `spell_id2`=12057 WHERE `entry`=1787 && `spell_id2`=11976;

-- Skeletal Executioner is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id3`=15623 WHERE `entry`=1787 && `spell_id3`=15496;

-- Searing Ghoul is using wrong spell id for Fire Shield.
UPDATE `creature_template` SET `spell_id1`=13376 WHERE `entry`=1795 && `spell_id1`=19627;

-- Flesh Golem is using wrong spell id for Knock Away.
UPDATE `creature_template` SET `spell_id1`=10101 WHERE `entry`=1805 && `spell_id1`=18670;

-- Scarlet Mage is using wrong spell id for Frost Nova.
UPDATE `creature_template` SET `spell_id2`=11831 WHERE `entry`=1826 && `spell_id2`=22645;

-- Scarlet Sentinel is using wrong spell id for Overpower.
UPDATE `creature_template` SET `spell_id2`=17198 WHERE `entry`=1827 && `spell_id2`=14895;

-- Scarlet Magus is using wrong spell id for Fireball.
UPDATE `creature_template` SET `spell_id1`=14034 WHERE `entry`=1832 && `spell_id1`=20823;

-- Scarlet Magus is using wrong spell id for Blast Wave.
UPDATE `creature_template` SET `spell_id2`=15744 WHERE `entry`=1832 && `spell_id2`=15091;

-- Scarlet Magus is using wrong spell id for Fireball Volley.
UPDATE `creature_template` SET `spell_id4`=17203 WHERE `entry`=1832 && `spell_id4`=11988;

-- Scarlet Paladin is using wrong spell id for Crusader Strike.
UPDATE `creature_template` SET `spell_id1`=14518 WHERE `entry`=1834 && `spell_id1`=14517;

-- Scarlet Paladin is using wrong spell id for Holy Light.
UPDATE `creature_template` SET `spell_id4`=15493 WHERE `entry`=1834 && `spell_id4`=13952;

-- Scarlet Paladin is using wrong spell id for Holy Strike.
UPDATE `creature_template` SET `spell_id2`=17143 WHERE `entry`=1834 && `spell_id2`=13953;

-- Scarlet Cavalier is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id2`=15663 WHERE `entry`=1836 && `spell_id2`=15284;

-- Araj the Summoner is using wrong spell id for Chilled.
UPDATE `creature_template` SET `spell_id2`=6136 WHERE `entry`=1852 && `spell_id2`=20005;

-- Darkmaster Gandling is using wrong spell id for Arcane Missiles.
UPDATE `creature_template` SET `spell_id2`=15790 WHERE `entry`=1853 && `spell_id2`=10212;

-- Dalaran Wizard is using wrong spell id for Frostbolt.
UPDATE `creature_template` SET `spell_id2`=20792 WHERE `entry`=1889 && `spell_id2`=9672;

-- Thule Ravenclaw is using wrong spell id for Demon Armor.
UPDATE `creature_template` SET `spell_id3`=13787 WHERE `entry`=1947 && `spell_id3`=706;

-- Gnarlpine Pathfinder is using wrong spell id for Wrath.
UPDATE `creature_template` SET `spell_id1`=9739 WHERE `entry`=2012 && `spell_id1`=5177;

-- Crushridge Enforcer is using wrong spell id for Intimidation.
UPDATE `creature_template` SET `spell_id2`=7093 WHERE `entry`=2256 && `spell_id2`=19577;

-- Hillsbrad Councilman is using wrong spell id for Frost Nova.
UPDATE `creature_template` SET `spell_id3`=122 WHERE `entry`=2387 && `spell_id3`=12748;

-- Captain Stillwater is using wrong spell id for Flame Spike.
UPDATE `creature_template` SET `spell_id3`=6725 WHERE `entry`=2550 && `spell_id3`=8814;

-- Captain Stillwater is using wrong spell id for Arcane Explosion.
UPDATE `creature_template` SET `spell_id1`=8439 WHERE `entry`=2550 && `spell_id1`=11975;

-- Witherbark Shadowcaster is using wrong spell id for Summon Imp.
UPDATE `creature_template` SET `spell_id2`=11939 WHERE `entry`=2553 && `spell_id2`=688;

-- Boulderfist Shaman is using wrong spell id for Healing Wave.
UPDATE `creature_template` SET `spell_id1`=959 WHERE `entry`=2570 && `spell_id1`=11986;

-- Daggerspine Sorceress is using wrong spell id for Lightning Shield.
UPDATE `creature_template` SET `spell_id2`=8134 WHERE `entry`=2596 && `spell_id2`=13585;

-- Vilebranch Headhunter is using wrong spell id for Throw.
UPDATE `creature_template` SET `spell_id1`=15607 WHERE `entry`=2641 && `spell_id1`=10277;

-- Vilebranch Headhunter is using wrong spell id for Poisonous Stab.
UPDATE `creature_template` SET `spell_id2`=15656 WHERE `entry`=2641 && `spell_id2`=7357;

-- Vilebranch Shadowcaster is using wrong spell id for Shadow Bolt.
UPDATE `creature_template` SET `spell_id1`=12471 WHERE `entry`=2642 && `spell_id1`=9613;

-- Thunder Lizard is using wrong spell id for Lizard Bolt.
UPDATE `creature_template` SET `spell_id1`=5401 WHERE `entry`=3130 && `spell_id1`=6255;

-- Thunderhead is using wrong spell id for Lizard Bolt.
UPDATE `creature_template` SET `spell_id1`=5401 WHERE `entry`=3239 && `spell_id1`=15611;

-- Thunderhawk Hatchling is using wrong spell id for Lightning Shield.
UPDATE `creature_template` SET `spell_id2`=325 WHERE `entry`=3247 && `spell_id2`=13585;

-- Felmusk Felsworn is using wrong spell id for Curse of Weakness.
UPDATE `creature_template` SET `spell_id2`=6205 WHERE `entry`=3762 && `spell_id2`=11980;

-- Rogue Flame Spirit is using wrong spell id for Curse of Weakness.
UPDATE `creature_template` SET `spell_id2`=6205 WHERE `entry`=4036 && `spell_id2`=12741;

-- Galak Wrangler is using wrong spell id for Shoot.
UPDATE `creature_template` SET `spell_id1`=6660 WHERE `entry`=4093 && `spell_id1`=17353;

-- Galak Scout is using wrong spell id for Shoot.
UPDATE `creature_template` SET `spell_id1`=6660 WHERE `entry`=4094 && `spell_id1`=22121;

-- Galak Mauler is using wrong spell id for Demoralizing Shout.
UPDATE `creature_template` SET `spell_id1`=13730 WHERE `entry`=4095 && `spell_id1`=6190;

-- Galak Windchaser is using wrong spell id for Healing Wave.
UPDATE `creature_template` SET `spell_id2`=939 WHERE `entry`=4096 && `spell_id2`=12491;

-- Galak Windchaser is using wrong spell id for Enveloping Winds.
UPDATE `creature_template` SET `spell_id1`=6728 WHERE `entry`=4096 && `spell_id1`=23103;

-- Galak Stormer is using wrong spell id for Lightning Bolt.
UPDATE `creature_template` SET `spell_id1`=9532 WHERE `entry`=4097 && `spell_id1`=20295;

-- Gravelsnout Vermin is using wrong spell id for Infected Wound.
UPDATE `creature_template` SET `spell_id1`=3427 WHERE `entry`=4112 && `spell_id1`=17230;

-- Archmage Arugal is using wrong spell id for Void Bolt.
UPDATE `creature_template` SET `spell_id1`=7588 WHERE `entry`=4275 && `spell_id1`=22709;

-- Scarlet Preserver is using wrong spell id for Holy Light.
UPDATE `creature_template` SET `spell_id1`=1042 WHERE `entry`=4280 && `spell_id1`=13952;

-- Scarlet Disciple is using wrong spell id for Renew.
UPDATE `creature_template` SET `spell_id2`=8362 WHERE `entry`=4285 && `spell_id2`=6076;

-- Scarlet Guardsman is using wrong spell id for Disarm.
UPDATE `creature_template` SET `spell_id1`=676 WHERE `entry`=4290 && `spell_id1`=6713;

-- Firemane Scalebane is using wrong spell id for Sunder Armor.
UPDATE `creature_template` SET `spell_id3`=8380 WHERE `entry`=4328 && `spell_id3`=11971;

-- Strashaz Myrmidon is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id1`=15754 WHERE `entry`=4368 && `spell_id1`=15284;

-- Slitherblade Oracle is using wrong spell id for Slow.
UPDATE `creature_template` SET `spell_id1`=246 WHERE `entry`=4718 && `spell_id1`=11436;

-- Fallenroot Satyr is using wrong spell id for Disarm.
UPDATE `creature_template` SET `spell_id1`=676 WHERE `entry`=4788 && `spell_id1`=6713;

-- Fallenroot Rogue is using wrong spell id for Exploit Weakness.
UPDATE `creature_template` SET `spell_id1`=8355 WHERE `entry`=4789 && `spell_id1`=6595;

-- Blackfathom Tide Priestess is using wrong spell id for Heal.
UPDATE `creature_template` SET `spell_id2`=2055 WHERE `entry`=4802 && `spell_id2`=11642;

-- Shadowforge Surveyor is using wrong spell id for Frost Nova.
UPDATE `creature_template` SET `spell_id3`=865 WHERE `entry`=4844 && `spell_id3`=11831;

-- Shadowforge Ruffian is using wrong spell id for Kick.
UPDATE `creature_template` SET `spell_id1`=1767 WHERE `entry`=4845 && `spell_id1`=11978;

-- Gordunni Mage-Lord is using wrong spell id for Fireball.
UPDATE `creature_template` SET `spell_id1`=20823 WHERE `entry`=5239 && `spell_id1`=8401;

-- Woodpaw Reaver is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id2`=7369 WHERE `entry`=5255 && `spell_id2`=20605;

-- Atal'ai Witch Doctor is using wrong spell id for Lightning Bolt.
UPDATE `creature_template` SET `spell_id1`=9532 WHERE `entry`=5259 && `spell_id1`=15208;

-- Atal'ai Witch Doctor is using wrong spell id for Chain Lightning.
UPDATE `creature_template` SET `spell_id2`=12058 WHERE `entry`=5259 && `spell_id2`=10605;

-- Unliving Atal'ai is using wrong spell id for Wandering Plague.
UPDATE `creature_template` SET `spell_id1`=3436 WHERE `entry`=5267 && `spell_id1`=8247;

-- Atal'ai Priest is using wrong spell id for Shadow Bolt.
UPDATE `creature_template` SET `spell_id1`=9613 WHERE `entry`=5269 && `spell_id1`=11660;

-- Atal'ai High Priest is using wrong spell id for Shadow Bolt.
UPDATE `creature_template` SET `spell_id2`=9613 WHERE `entry`=5273 && `spell_id2`=11660;

-- Nightmare Wyrmkin is using wrong spell id for Acid Spit.
UPDATE `creature_template` SET `spell_id1`=9591 WHERE `entry`=5280 && `spell_id1`=15653;

-- Hakkari Frostwing is using wrong spell id for Frost Nova.
UPDATE `creature_template` SET `spell_id1`=11831 WHERE `entry`=5291 && `spell_id1`=9915;

-- Dunemaul Warlock is using wrong spell id for Immolate.
UPDATE `creature_template` SET `spell_id3`=2941 WHERE `entry`=5475 && `spell_id3`=707;

-- Dunemaul Warlock is using wrong spell id for Curse of Thorns.
UPDATE `creature_template` SET `spell_id1`=6909 WHERE `entry`=5475 && `spell_id1`=16247;

-- Sandfury Axe Thrower is using wrong spell id for Throw.
UPDATE `creature_template` SET `spell_id1`=15607 WHERE `entry`=5646 && `spell_id1`=10277;

-- Jammal'an the Prophet is using wrong spell id for Hex of Jammal'an.
UPDATE `creature_template` SET `spell_id3`=12479 WHERE `entry`=5710 && `spell_id3`=12480;

-- Loro is using wrong spell id for Shield Slam.
UPDATE `creature_template` SET `spell_id2`=8242 WHERE `entry`=5714 && `spell_id2`=15655;

-- Twilight Dark Shaman is using wrong spell id for Healing Wave.
UPDATE `creature_template` SET `spell_id3`=12491 WHERE `entry`=5860 && `spell_id3`=11986;

-- Twilight Dark Shaman is using wrong spell id for Shock.
UPDATE `creature_template` SET `spell_id2`=15500 WHERE `entry`=5860 && `spell_id2`=11824;

-- Twilight Geomancer is using wrong spell id for Slow.
UPDATE `creature_template` SET `spell_id3`=11436 WHERE `entry`=5862 && `spell_id3`=18972;

-- Twilight Geomancer is using wrong spell id for Fireball.
UPDATE `creature_template` SET `spell_id1`=14034 WHERE `entry`=5862 && `spell_id1`=9053;

-- Shadowsworn Adept is using wrong spell id for Blood Leech.
UPDATE `creature_template` SET `spell_id2`=11015 WHERE `entry`=6006 && `spell_id2`=6958;

-- Azuregos is using wrong spell id for Frost Breath.
UPDATE `creature_template` SET `spell_id3`=21099 WHERE `entry`=6109 && `spell_id3`=22479;

-- Fallen Champion is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id3`=15496 WHERE `entry`=6488 && `spell_id3`=19642;

-- Defias Bodyguard is using wrong spell id for Backstab.
UPDATE `creature_template` SET `spell_id3`=7159 WHERE `entry`=6866 && `spell_id3`=53;

-- Revelosh is using wrong spell id for Chain Lightning.
UPDATE `creature_template` SET `spell_id1`=16006 WHERE `entry`=6910 && `spell_id1`=15117;

-- Firegut Brute is using wrong spell id for Knock Away.
UPDATE `creature_template` SET `spell_id1`=10101 WHERE `entry`=7035 && `spell_id1`=11130;

-- Thaurissan Agent is using wrong spell id for Shoot.
UPDATE `creature_template` SET `spell_id2`=6660 WHERE `entry`=7038 && `spell_id2`=15620;

-- Thaurissan Agent is using wrong spell id for Gouge.
UPDATE `creature_template` SET `spell_id1`=12540 WHERE `entry`=7038 && `spell_id1`=13579;

-- Black Dragonspawn is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id1`=15663 WHERE `entry`=7040 && `spell_id1`=15284;

-- Black Wyrmkin is using wrong spell id for Fireball.
UPDATE `creature_template` SET `spell_id1`=14034 WHERE `entry`=7041 && `spell_id1`=9053;

-- Flamescale Dragonspawn is using wrong spell id for Fire Blast.
UPDATE `creature_template` SET `spell_id1`=13340 WHERE `entry`=7042 && `spell_id1`=16144;

-- Black Drake is using wrong spell id for Flame Breath.
UPDATE `creature_template` SET `spell_id1`=9573 WHERE `entry`=7044 && `spell_id1`=8873;

-- Searscale Drake is using wrong spell id for Fire Blast.
UPDATE `creature_template` SET `spell_id1`=13342 WHERE `entry`=7046 && `spell_id1`=16144;

-- Jadefire Betrayer is using wrong spell id for Rend.
UPDATE `creature_template` SET `spell_id2`=13443 WHERE `entry`=7108 && `spell_id2`=13738;

-- Jadefire Felsworn is using wrong spell id for Shadow Bolt.
UPDATE `creature_template` SET `spell_id1`=9613 WHERE `entry`=7109 && `spell_id1`=18211;

-- Jadefire Shadowstalker is using wrong spell id for Sneak.
UPDATE `creature_template` SET `spell_id3`=22766 WHERE `entry`=7110 && `spell_id3`=11013;

-- Jadefire Shadowstalker is using wrong spell id for Slowing Poison.
UPDATE `creature_template` SET `spell_id1`=7992 WHERE `entry`=7110 && `spell_id1`=14897;

-- Jadefire Hellcaller is using wrong spell id for Rain of Fire.
UPDATE `creature_template` SET `spell_id2`=11990 WHERE `entry`=7111 && `spell_id2`=4629;

-- Jaedenar Guardian is using wrong spell id for Improved Blocking.
UPDATE `creature_template` SET `spell_id1`=3248 WHERE `entry`=7113 && `spell_id1`=3639;

-- Chief Ukorz Sandscalp is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id2`=15623 WHERE `entry`=7267 && `spell_id2`=15496;

-- Sandfury Guardian is using wrong spell id for Poison.
UPDATE `creature_template` SET `spell_id2`=744 WHERE `entry`=7268 && `spell_id2`=13518;

-- Sandfury Executioner is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id2`=15623 WHERE `entry`=7274 && `spell_id2`=15496;

-- Death's Head Geomancer is using wrong spell id for Flame Spike.
UPDATE `creature_template` SET `spell_id2`=8814 WHERE `entry`=7335 && `spell_id2`=6725;

-- Plaguemaw the Rotting is using wrong spell id for Withered Touch.
UPDATE `creature_template` SET `spell_id1`=11442 WHERE `entry`=7356 && `spell_id1`=12947;

-- Deadwind Ogre Mage is using wrong spell id for Lightning Bolt.
UPDATE `creature_template` SET `spell_id2`=20824 WHERE `entry`=7379 && `spell_id2`=9532;

-- Ruuzlu is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id2`=15623 WHERE `entry`=7797 && `spell_id2`=15496;

-- Vile Priestess Hexx is using wrong spell id for Heal.
UPDATE `creature_template` SET `spell_id2`=15586 WHERE `entry`=7995 && `spell_id2`=11642;

-- Vile Priestess Hexx is using wrong spell id for Shadow Word: Pain.
UPDATE `creature_template` SET `spell_id3`=15654 WHERE `entry`=7995 && `spell_id3`=11639;

-- Qiaga the Keeper is using wrong spell id for Shadow Word: Pain.
UPDATE `creature_template` SET `spell_id1`=11639 WHERE `entry`=7996 && `spell_id1`=10893;

-- Qiaga the Keeper is using wrong spell id for Renew.
UPDATE `creature_template` SET `spell_id3`=11640 WHERE `entry`=7996 && `spell_id3`=10928;

-- Qiaga the Keeper is using wrong spell id for Shadow Bolt.
UPDATE `creature_template` SET `spell_id2`=20825 WHERE `entry`=7996 && `spell_id2`=11660;

-- Chronalis is using wrong spell id for Arcane Bolt.
UPDATE `creature_template` SET `spell_id3`=20720 WHERE `entry`=8197 && `spell_id3`=13748;

-- Kregg Keelhaul is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id1`=17685 WHERE `entry`=8203 && `spell_id1`=20684;

-- Hakkari Sapper is using wrong spell id for Mana Burn.
UPDATE `creature_template` SET `spell_id1`=11981 WHERE `entry`=8336 && `spell_id1`=10875;

-- Hakkari Bloodkeeper is using wrong spell id for Shadow Bolt.
UPDATE `creature_template` SET `spell_id1`=12471 WHERE `entry`=8438 && `spell_id1`=11660;

-- Trade Master Kovic is using wrong spell id for Fireball.
UPDATE `creature_template` SET `spell_id1`=14034 WHERE `entry`=8444 && `spell_id1`=9053;

-- Cursed Mage is using wrong spell id for Arcane Bolt.
UPDATE `creature_template` SET `spell_id1`=20829 WHERE `entry`=8524 && `spell_id1`=15254;

-- Dark Caster is using wrong spell id for Shadow Bolt.
UPDATE `creature_template` SET `spell_id1`=20825 WHERE `entry`=8526 && `spell_id1`=17435;

-- Dread Weaver is using wrong spell id for Mind Flay.
UPDATE `creature_template` SET `spell_id1`=16568 WHERE `entry`=8528 && `spell_id1`=17165;

-- Dark Adept is using wrong spell id for Snap Kick.
UPDATE `creature_template` SET `spell_id1`=8646 WHERE `entry`=8546 && `spell_id1`=15618;

-- Shadowmage is using wrong spell id for Shadowform.
UPDATE `creature_template` SET `spell_id1`=16592 WHERE `entry`=8550 && `spell_id1`=22917;

-- Dark Summoner is using wrong spell id for Arcane Bolt.
UPDATE `creature_template` SET `spell_id2`=20829 WHERE `entry`=8551 && `spell_id2`=15254;

-- Morta'gya the Keeper is using wrong spell id for Shadow Bolt.
UPDATE `creature_template` SET `spell_id2`=20825 WHERE `entry`=8636 && `spell_id2`=9613;

-- Felguard Elite is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id2`=15754 WHERE `entry`=8717 && `spell_id2`=15284;

-- Anvilrage Medic is using wrong spell id for Prayer of Healing.
UPDATE `creature_template` SET `spell_id2`=15585 WHERE `entry`=8894 && `spell_id2`=10961;

-- Anvilrage Medic is using wrong spell id for Heal.
UPDATE `creature_template` SET `spell_id1`=15586 WHERE `entry`=8894 && `spell_id1`=8812;

-- Anvilrage Medic is using wrong spell id for Mind Blast.
UPDATE `creature_template` SET `spell_id3`=15587 WHERE `entry`=8894 && `spell_id3`=10947;

-- Anvilrage Officer is using wrong spell id for Divine Shield.
UPDATE `creature_template` SET `spell_id2`=13874 WHERE `entry`=8895 && `spell_id2`=1020;

-- Cave Creeper is using wrong spell id for Poison.
UPDATE `creature_template` SET `spell_id2`=13298 WHERE `entry`=8933 && `spell_id2`=744;

-- Felpaw Ravager is using wrong spell id for Infected Wound.
UPDATE `creature_template` SET `spell_id2`=3427 WHERE `entry`=8961 && `spell_id2`=17230;

-- Warder Stilgiss is using wrong spell id for Frost Armor.
UPDATE `creature_template` SET `spell_id3`=12544 WHERE `entry`=9041 && `spell_id3`=12556;

-- Spirestone Mystic is using wrong spell id for Forked Lightning.
UPDATE `creature_template` SET `spell_id4`=8435 WHERE `entry`=9198 && `spell_id4`=22945;

-- Spirestone Reaver is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id2`=15754 WHERE `entry`=9200 && `spell_id2`=15284;

-- Smolderthorn Shadow Hunter is using wrong spell id for Kick.
UPDATE `creature_template` SET `spell_id3`=15614 WHERE `entry`=9265 && `spell_id3`=15610;

-- Flamekin Spitter is using wrong spell id for Venom Spit.
UPDATE `creature_template` SET `spell_id1`=15664 WHERE `entry`=9776 && `spell_id1`=16866;

-- Flamekin Torcher is using wrong spell id for Fireball.
UPDATE `creature_template` SET `spell_id1`=15665 WHERE `entry`=9778 && `spell_id1`=20808;

-- Burning Felhound is using wrong spell id for Mana Burn.
UPDATE `creature_template` SET `spell_id1`=15980 WHERE `entry`=10261 && `spell_id1`=20817;

-- Burning Felguard is using wrong spell id for Thunderclap.
UPDATE `creature_template` SET `spell_id2`=15548 WHERE `entry`=10263 && `spell_id2`=15588;

-- Gyth is using wrong spell id for Freeze.
UPDATE `creature_template` SET `spell_id3`=16350 WHERE `entry`=10339 && `spell_id3`=18763;

-- Gyth is using wrong spell id for Corrosive Acid Breath.
UPDATE `creature_template` SET `spell_id1`=16359 WHERE `entry`=10339 && `spell_id1`=20667;

-- Gyth is using wrong spell id for Flame Breath.
UPDATE `creature_template` SET `spell_id2`=16390 WHERE `entry`=10339 && `spell_id2`=20712;

-- Fellicent's Shade is using wrong spell id for Arcane Bolt.
UPDATE `creature_template` SET `spell_id2`=13901 WHERE `entry`=10358 && `spell_id2`=15451;

-- Rage Talon Dragon Guard is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id3`=15754 WHERE `entry`=10366 && `spell_id3`=15284;

-- Black Guard Sentry is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id2`=15623 WHERE `entry`=10394 && `spell_id2`=15584;

-- Ghoul Ravener is using wrong spell id for Ravenous Claw.
UPDATE `creature_template` SET `spell_id1`=16553 WHERE `entry`=10406 && `spell_id1`=12538;

-- Ghoul Ravener is using wrong spell id for Ravenous Claw.
UPDATE `creature_template` SET `spell_id2`=16553 WHERE `entry`=10406 && `spell_id2`=15608;

-- Fleshflayer Ghoul is using wrong spell id for Rend.
UPDATE `creature_template` SET `spell_id1`=13738 WHERE `entry`=10407 && `spell_id1`=18200;

-- Crimson Battle Mage is using wrong spell id for Immolate.
UPDATE `creature_template` SET `spell_id1`=15732 WHERE `entry`=10425 && `spell_id1`=12742;

-- Warchief Rend Blackhand is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id1`=15754 WHERE `entry`=10429 && `spell_id1`=20691;

-- Marduk Blackpool is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id3`=15754 WHERE `entry`=10433 && `spell_id3`=15284;

-- Chromatic Dragonspawn is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id2`=15663 WHERE `entry`=10447 && `spell_id2`=15284;

-- Scholomance Acolyte is using wrong spell id for Shadowform.
UPDATE `creature_template` SET `spell_id4`=16592 WHERE `entry`=10471 && `spell_id4`=15473;

-- Kirtonos the Herald is using wrong spell id for Shadow Bolt Volley.
UPDATE `creature_template` SET `spell_id2`=17228 WHERE `entry`=10506 && `spell_id2`=20741;

-- Scarlet Priest is using wrong spell id for Heal.
UPDATE `creature_template` SET `spell_id1`=12039 WHERE `entry`=10608 && `spell_id1`=15586;

-- Grimtotem Geomancer is using wrong spell id for Fireball.
UPDATE `creature_template` SET `spell_id1`=20811 WHERE `entry`=10760 && `spell_id1`=8400;

-- Grimtotem Geomancer is using wrong spell id for Flamestrike.
UPDATE `creature_template` SET `spell_id2`=20813 WHERE `entry`=10760 && `spell_id2`=2121;

-- Hitah'ya the Keeper is using wrong spell id for Renew.
UPDATE `creature_template` SET `spell_id3`=11640 WHERE `entry`=10802 && `spell_id3`=23895;

-- Hitah'ya the Keeper is using wrong spell id for Shadow Bolt.
UPDATE `creature_template` SET `spell_id2`=20825 WHERE `entry`=10802 && `spell_id2`=9613;

-- Archivist Galford is using wrong spell id for Fire Nova.
UPDATE `creature_template` SET `spell_id2`=17366 WHERE `entry`=10811 && `spell_id2`=23462;

-- Fras Siabi is using wrong spell id for Flame Breath.
UPDATE `creature_template` SET `spell_id2`=17294 WHERE `entry`=11058 && `spell_id2`=20712;

-- Vilebranch Speaker is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id3`=15663 WHERE `entry`=11391 && `spell_id3`=15284;

-- Gordok Ogre-Mage is using wrong spell id for Fireball.
UPDATE `creature_template` SET `spell_id1`=12466 WHERE `entry`=11443 && `spell_id1`=10149;

-- Gordok Mage-Lord is using wrong spell id for Fire Blast.
UPDATE `creature_template` SET `spell_id1`=14145 WHERE `entry`=11444 && `spell_id1`=20832;

-- Illyanna Ravenoak is using wrong spell id for Multi-Shot.
UPDATE `creature_template` SET `spell_id3`=20735 WHERE `entry`=11488 && `spell_id3`=14290;

-- Illyanna Ravenoak is using wrong spell id for Volley.
UPDATE `creature_template` SET `spell_id4`=22908 WHERE `entry`=11488 && `spell_id4`=14295;

-- Illyanna Ravenoak is using wrong spell id for Concussive Shot.
UPDATE `creature_template` SET `spell_id1`=22914 WHERE `entry`=11488 && `spell_id1`=5116;

-- Necrofiend is using wrong spell id for Web Explosion.
UPDATE `creature_template` SET `spell_id1`=15474 WHERE `entry`=11551 && `spell_id1`=16469;

-- Scholomance Dark Summoner is using wrong spell id for Curse of Blood.
UPDATE `creature_template` SET `spell_id2`=12279 WHERE `entry`=11582 && `spell_id2`=15042;

-- Flamewaker Priest is using wrong spell id for Shadow Word: Pain.
UPDATE `creature_template` SET `spell_id2`=19776 WHERE `entry`=11662 && `spell_id2`=23952;

-- Borelgore is using wrong spell id for Venom Spit.
UPDATE `creature_template` SET `spell_id2`=16866 WHERE `entry`=11896 && `spell_id2`=6917;

-- Flamewaker Protector is using wrong spell id for Dominate Mind.
UPDATE `creature_template` SET `spell_id1`=20604 WHERE `entry`=12119 && `spell_id1`=20740;

-- Flamewaker Protector is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id2`=20605 WHERE `entry`=12119 && `spell_id2`=20677;

-- Lord Vyletongue is using wrong spell id for Smoke Bomb.
UPDATE `creature_template` SET `spell_id2`=7964 WHERE `entry`=12236 && `spell_id2`=8817;

-- Spirit of Gelk is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id1`=15663 WHERE `entry`=12239 && `spell_id1`=15284;

-- Infiltrator Hameya is using wrong spell id for Rend.
UPDATE `creature_template` SET `spell_id1`=11977 WHERE `entry`=12248 && `spell_id1`=14118;

-- Lava Spawn is using wrong spell id for Fireball.
UPDATE `creature_template` SET `spell_id1`=19391 WHERE `entry`=12265 && `spell_id1`=18108;

-- Doomguard Commander is using wrong spell id for Cripple.
UPDATE `creature_template` SET `spell_id2`=20812 WHERE `entry`=12396 && `spell_id2`=11443;

-- Blackwing Legionnaire is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id1`=15754 WHERE `entry`=12416 && `spell_id1`=15284;

-- Death Talon Dragonspawn is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id1`=15663 WHERE `entry`=12422 && `spell_id1`=15284;

-- Dreamtracker is using wrong spell id for Corrosive Acid Breath.
UPDATE `creature_template` SET `spell_id1`=20667 WHERE `entry`=12496 && `spell_id1`=16359;

-- Dreamstalker is using wrong spell id for Corrosive Acid Breath.
UPDATE `creature_template` SET `spell_id1`=20667 WHERE `entry`=12498 && `spell_id1`=16359;

-- Dreamstalker is using wrong spell id for Sleep.
UPDATE `creature_template` SET `spell_id2`=20669 WHERE `entry`=12498 && `spell_id2`=12098;

-- Somnus is using wrong spell id for Corrosive Acid Breath.
UPDATE `creature_template` SET `spell_id4`=20667 WHERE `entry`=12900 && `spell_id4`=16359;

-- Imp Minion is using wrong spell id for Firebolt.
UPDATE `creature_template` SET `spell_id1`=20801 WHERE `entry`=12922 && `spell_id1`=3110;

-- Burning Blade Seer is using wrong spell id for Flame Buffet.
UPDATE `creature_template` SET `spell_id2`=9658 WHERE `entry`=13019 && `spell_id2`=16536;

-- Lethtendris is using wrong spell id for Immolate.
UPDATE `creature_template` SET `spell_id1`=12742 WHERE `entry`=14327 && `spell_id1`=11668;

-- Rogue Black Drake is using wrong spell id for Flame Breath.
UPDATE `creature_template` SET `spell_id1`=9573 WHERE `entry`=14388 && `spell_id1`=8873;

-- Blackwing Guardsman is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id1`=15754 WHERE `entry`=14456 && `spell_id1`=15284;

-- Revanchion is using wrong spell id for Frost Nova.
UPDATE `creature_template` SET `spell_id1`=14907 WHERE `entry`=14690 && `spell_id1`=29849;

-- Voodoo Slave is using wrong spell id for Shadow Bolt.
UPDATE `creature_template` SET `spell_id1`=24668 WHERE `entry`=14883 && `spell_id1`=20825;

-- Prince Skaldrenox is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id1`=15754 WHERE `entry`=15203 && `spell_id1`=15284;

-- High Marshal Whirlaxis is using wrong spell id for Lightning Breath.
UPDATE `creature_template` SET `spell_id1`=20543 WHERE `entry`=15204 && `spell_id1`=20627;

-- High Marshal Whirlaxis is using wrong spell id for Lightning Shield.
UPDATE `creature_template` SET `spell_id2`=20545 WHERE `entry`=15204 && `spell_id2`=25020;

-- The Duke of Shards is using wrong spell id for Thunderclap.
UPDATE `creature_template` SET `spell_id1`=15588 WHERE `entry`=15208 && `spell_id1`=8078;

-- The Duke of Shards is using wrong spell id for Strike.
UPDATE `creature_template` SET `spell_id2`=18368 WHERE `entry`=15208 && `spell_id2`=13446;

-- Crimson Templar is using wrong spell id for Fireball Volley.
UPDATE `creature_template` SET `spell_id1`=15285 WHERE `entry`=15209 && `spell_id1`=11989;

-- Azure Templar is using wrong spell id for Frost Shock.
UPDATE `creature_template` SET `spell_id1`=19133 WHERE `entry`=15211 && `spell_id1`=12548;

-- Hoary Templar is using wrong spell id for Lightning Shield.
UPDATE `creature_template` SET `spell_id1`=25020 WHERE `entry`=15212 && `spell_id1`=19514;

-- Timbermaw Ancestor is using wrong spell id for Lightning Bolt.
UPDATE `creature_template` SET `spell_id1`=9532 WHERE `entry`=15720 && `spell_id1`=20295;

-- Dread Creeper is using wrong spell id for Veil of Shadow.
UPDATE `creature_template` SET `spell_id1`=28440 WHERE `entry`=15974 && `spell_id1`=22687;

-- Crypt Reaver is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id1`=15579 WHERE `entry`=15978 && `spell_id1`=15284;

-- Unrelenting Rider is using wrong spell id for Unholy Aura.
UPDATE `creature_template` SET `spell_id1`=27987 WHERE `entry`=16126 && `spell_id1`=28340;

-- Deathknight is using wrong spell id for Intimidating Shout.
UPDATE `creature_template` SET `spell_id2`=19134 WHERE `entry`=16146 && `spell_id2`=5246;

-- Spectral Deathknight is using wrong spell id for Mana Burn.
UPDATE `creature_template` SET `spell_id3`=27992 WHERE `entry`=16148 && `spell_id3`=20817;

-- Deathknight Cavalier is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id1`=15754 WHERE `entry`=16163 && `spell_id1`=15284;

-- Deathknight Vindicator is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id1`=15754 WHERE `entry`=16451 && `spell_id1`=15284;

-- Naxxramas Follower is using wrong spell id for Silence.
UPDATE `creature_template` SET `spell_id1`=30225 WHERE `entry`=16505 && `spell_id1`=29943;

-- Death Lord is using wrong spell id for Cleave.
UPDATE `creature_template` SET `spell_id1`=15754 WHERE `entry`=16861 && `spell_id1`=15284;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
