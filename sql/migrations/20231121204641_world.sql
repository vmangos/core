DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231121204641');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231121204641');
-- Add your query below.


-- Harvest Watcher
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=114;
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=114;

-- Fire Elemental
-- Poison: Instant Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=575;

-- Lesser Water Elemental
-- Poison: Serpent Sting, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=691;

-- Rot Hide Brute
-- Mechanic Sleep: Sleep
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 512) WHERE `entry`=1939;

-- Cracked Golem
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=2156;

-- Stone Behemoth
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=2157;

-- High Executor Darthalia
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=2215;

-- Elemental Slave
-- School Nature: Deadly Poison, Instant Poison, Instant Poison II, Lightning Bolt, Serpent Sting, Lightning Shield, Lightning Shield
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=2359;
-- Poison: Deadly Poison, Instant Poison, Instant Poison II, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=2359;

-- Stone Golem
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=2723;

-- Lesser Rock Elemental
-- Disease: Devouring Plague
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 16) WHERE `entry`=2735;

-- Ambassador Infernus
-- Poison: Serpent Sting, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=2745;

-- Archaedas
-- Mechanic Stun: Hammer of Justice, Bash, Pounce, War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=2748;
-- Mechanic Bleed: Rend, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=2748;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=2748;

-- Myzrael
-- Mechanic Root: Improved Wing Clip
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=2755;
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=2755;

-- Blacklash
-- Mechanic Stun: Kidney Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=2757;

-- Hematus
-- School Fire: Fireball
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 4) WHERE `entry`=2759;
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=2759;
-- Mechanic Stun: Cheap Shot, Kidney Shot, Concussion Blow, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=2759;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=2759;

-- Burning Exile
-- Poison: Crippling Poison, Instant Poison III, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=2760;

-- Cresting Exile
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=2761;

-- Vengeful Surge
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=2776;

-- Urda
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=2851;

-- Fam'retor Guardian
-- School Nature: Earth Shock, Lightning Bolt
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=2919;

-- Grisha
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=3305;

-- Evolving Ectoplasm (HAS AURAS: Immunity: Frost)
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=3640;

-- Mutanus the Devourer
-- School Shadow: Shadow Bolt, Curse of Agony, Corruption
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 32) WHERE `entry`=3654;

-- Skum
-- School Nature: Earth Shock, Serpent Sting
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=3674;

-- Dark Strand Enforcer
-- Mechanic Fear: Fear
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=3727;

-- Shadowfang Darksoul
-- School Shadow: Curse of Agony, Corruption, Mind Control, Mind Blast, Shadow Bolt
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 32) WHERE `entry`=3855;

-- Befouled Water Elemental
-- Poison: Serpent Sting, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=3917;

-- High Inquisitor Whitemane
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=3977;

-- Monika Sengutz
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=3982;
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=3982;

-- XT:9
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=4074;

-- Thundering Boulderkin
-- Poison: Deadly Poison
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=4120;

-- Archmage Arugal
-- Mechanic Stun: Hammer of Justice, Charge Stun, Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=4275;

-- Unfettered Spirit
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=4308;

-- Agathelos the Raging
-- Mechanic Stun: Kidney Shot, Cheap Shot, Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=4422;

-- Parqual Fintallas
-- Mechanic Fear: Aura of Fear
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=4488;

-- Wind Howler
-- Disease: Devouring Plague
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 16) WHERE `entry`=4526;

-- Stone Rumbler
-- School Nature: Earthbind, Earth Shock, Instant Poison II, Lightning Bolt, Lightning Shield, Lightning Shield
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=4528;
-- Poison: Instant Poison II
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=4528;

-- Bloodmage Thalnos
-- Mechanic Bleed: Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=4543;

-- Gelkis Rumbler
-- School Nature: Crippling Poison, Earth Shock, Instant Poison II, Earth Shock, Serpent Sting, Serpent Sting, Lightning Shield, Lightning Shield
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=4661;
-- Poison: Crippling Poison, Instant Poison II, Serpent Sting, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=4661;

-- Burning Blade Augur
-- Mechanic Fear: Fear
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=4663;

-- Lesser Infernal
-- Mechanic Bleed: Rend, Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=4676;
-- Poison: Instant Poison III, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=4676;

-- Stone Keeper
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=4857;
-- Poison: Crippling Poison
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=4857;

-- Stone Steward
-- Mechanic Fear: Howl of Terror
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=4860;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=4860;

-- Obsidian Golem
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=4872;

-- Aku'mai Servant
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=4978;

-- Phantim
-- School Nature: Faerie Fire, Earth Shock, Crippling Poison, Instant Poison VI, Mind-numbing Poison III, Serpent Sting, Faerie Fire (Feral), Wrath, Lightning, Lightning Shield, Lightning Shield
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=5314;
-- Mechanic Snare: Frost Shock
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=5314;
-- Mechanic Stun: Charge Stun, Impact, Intercept Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=5314;
-- Mechanic Interrupt: Earth Shock, Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=5314;

-- Sea Spray
-- Poison: Instant Poison IV
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=5462;

-- Land Rager
-- School Nature: Lightning Shield, Lightning Shield
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=5465;

-- Rothos
-- School Nature: Instant Poison VI
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=5718;
-- Mechanic Stun: Cheap Shot, Charge Stun, Revenge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=5718;

-- Morphaz
-- Poison: Instant Poison IV, Instant Poison V, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=5719;

-- Dreamscythe
-- Poison: Instant Poison V, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=5721;

-- Hazzas
-- Poison: Instant Poison V, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=5722;

-- Nightmare Ectoplasm
-- Mechanic Root: Boar Charge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=5763;

-- Verdan the Everliving
-- Mechanic Root: Boar Charge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=5775;
-- Mechanic Stun: Charge Stun, War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=5775;

-- Blazing Elemental
-- Poison: Instant Poison IV, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=5850;

-- Inferno Elemental
-- Poison: Instant Poison IV
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=5852;

-- Tempered War Golem
-- Poison: Instant Poison III, Deadly Poison III, Serpent Sting, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=5853;

-- Heavy War Golem
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8) WHERE `entry`=5854;
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=5854;
-- Poison: Instant Poison III, Crippling Poison, Instant Poison IV, Instant Poison V, Serpent Sting, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=5854;

-- Aqua Guardian
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=6047;

-- Irradiated Horror
-- Poison: Scorpid Sting, Crippling Poison, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=6220;

-- Mechano-Tank
-- Poison: Crippling Poison
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=6225;

-- Mechano-Flamewalker
-- Poison: Crippling Poison, Instant Poison II, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=6226;

-- Mechano-Frostwalker
-- Disease: Devouring Plague
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 16) WHERE `entry`=6227;
-- Poison: Crippling Poison, Instant Poison II, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=6227;

-- Crowd Pummeler 9-60
-- Poison: Instant Poison II, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=6229;

-- Peacekeeper Security Suit
-- Poison: Crippling Poison, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=6230;

-- Techbot
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=6231;

-- Arcane Nullifier X-21
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8) WHERE `entry`=6232;
-- Taunt: Challenging Shout, Challenging Roar
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 2) WHERE `entry`=6232;
-- Poison: Crippling Poison, Instant Poison II, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=6232;

-- Mechanized Sentry
-- Poison: Crippling Poison, Instant Poison II, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=6233;

-- Mechanized Guardian
-- Disease: Devouring Plague
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 16) WHERE `entry`=6234;
-- Poison: Crippling Poison, Instant Poison II
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=6234;

-- Cyclonian
-- Mechanic Stun: Hammer of Justice, Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=6239;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=6239;

-- Venomhide Ravasaur
-- Poison: Venomhide Poison
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=6508;

-- Living Blaze
-- Poison: Crippling Poison, Instant Poison VI
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=6521;

-- Baelog
-- Mechanic Polymorph: Polymorph
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 65536) WHERE `entry`=6906;

-- Eric "The Swift"
-- Mechanic Stun: Bash
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=6907;

-- Olaf
-- Mechanic Root: Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=6908;
-- Mechanic Stun: Pounce
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=6908;
-- Mechanic Interrupt: Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=6908;

-- Revelosh
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=6910;

-- Earthen Rocksmasher
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=7011;
-- Mechanic Snare: Crippling Poison, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=7011;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7011;

-- Earthen Sculptor
-- Mechanic Snare: Crippling Poison, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=7012;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7012;

-- Obsidian Sentinel
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=7023;

-- War Reaver
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=7039;
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=7039;

-- Black Drake
-- Mechanic Stun: Hammer of Justice, Kidney Shot, Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=7044;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7044;

-- Searscale Drake
-- Mechanic Stun: Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=7046;

-- Earthen Guardian
-- Mechanic Fear: Psychic Scream, Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=7076;

-- Vile Ooze
-- School Nature: Earthbind, Earth Shock, Lightning Shield, Lightning Shield
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=7093;

-- Toxic Horror
-- Poison: Crippling Poison
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=7132;

-- Ancient Stone Keeper
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7206;
-- Poison: Crippling Poison
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=7206;

-- Ironaya
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7228;

-- Chief Ukorz Sandscalp
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7267;

-- Witch Doctor Zum'rah
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7271;

-- Gahz'rilla
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=7273;
-- Mechanic Stun: Hammer of Justice, Charge Stun, Intimidation
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=7273;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=7273;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7273;

-- Galgann Firehammer
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=7291;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7291;

-- Earthen Custodian
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7309;

-- Ragglesnout
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=7354;

-- Tuten'kash
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=7355;

-- Plaguemaw the Rotting
-- Mechanic Root: Improved Wing Clip
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=7356;
-- Mechanic Snare: Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=7356;

-- Mordresh Fire Eye
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=7357;

-- Amnennar the Coldbringer
-- Mechanic Snare: Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=7358;
-- Mechanic Stun: Cheap Shot, Charge Stun, Starfire Stun, War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=7358;
-- Mod Stat: Scorpid Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7358;

-- Earthen Stonebreaker
-- Mechanic Fear: Howl of Terror, Fear
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=7396;
-- Mechanic Snare: Crippling Poison, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=7396;
-- Mechanic Knockout: Repentance
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=7396;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7396;

-- Earthen Stonecarver
-- Mechanic Fear: Howl of Terror, Fear
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=7397;
-- Mechanic Snare: Crippling Poison, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=7397;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7397;

-- Grol the Destroyer
-- School Fire: Flame Shock, Fiery Weapon
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 4) WHERE `entry`=7665;
-- School Frost: Frost Shock
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 16) WHERE `entry`=7665;
-- Mechanic Stun: Kidney Shot, Revenge Stun, Concussion Blow
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=7665;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=7665;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7665;

-- Archmage Allistarj
-- School Fire: Flame Shock, Fiery Weapon
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 4) WHERE `entry`=7666;
-- School Frost: Frost Shock
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 16) WHERE `entry`=7666;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Revenge Stun, Concussion Blow
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=7666;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=7666;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7666;

-- Lady Sevine
-- School Fire: Flame Shock, Fiery Weapon
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 4) WHERE `entry`=7667;
-- School Frost: Frost Shock
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 16) WHERE `entry`=7667;
-- Mechanic Stun: Charge Stun, Kidney Shot, Concussion Blow
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=7667;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=7667;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7667;

-- Ilifar
-- School Nature: Instant Poison VI
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=7734;
-- Mechanic Stun: Kidney Shot, Revenge Stun, Concussion Blow
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=7734;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=7734;

-- Felcular
-- School Nature: Instant Poison VI
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=7735;
-- Mechanic Stun: Revenge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=7735;

-- Ruuzlu
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=7797;

-- Mekgineer Thermaplugg
-- Poison: Instant Poison II
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=7800;

-- Teremus the Devourer
-- School Fire: Flame Shock, Fiery Weapon
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 4) WHERE `entry`=7846;
-- School Frost: Frost Shock
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 16) WHERE `entry`=7846;
-- Mechanic Bleed: Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=7846;
-- Poison: Instant Poison VI, Deadly Poison IV
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=7846;

-- Mobile Alert System
-- Poison: Crippling Poison
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=7849;

-- Deathguard Elite
-- Mechanic Fear: Aura of Fear
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=7980;

-- Dark Iron Land Mine
-- Poison: Crippling Poison
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=8035;

-- Sul'lithuz Sandcrawler
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=8095;
-- Mechanic Snare: Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=8095;
-- Mechanic Freeze: Freezing Trap Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4096) WHERE `entry`=8095;
-- Mechanic Knockout: Gouge, Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=8095;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=8095;

-- Sul'lithuz Abomination
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=8120;
-- Mechanic Snare: Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=8120;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=8120;

-- Antu'sul
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=8127;

-- Servant of Antu'sul
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=8156;
-- Mechanic Snare: Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=8156;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=8156;

-- Occulus
-- School Arcane: Counterspell, Arcane Shot
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 64) WHERE `entry`=8196;
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=8196;
-- Mechanic Snare: Earthbind
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=8196;
-- Mechanic Stun: Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=8196;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=8196;

-- Chronalis
-- School Arcane: Arcane Shot, Hunter's Mark
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 64) WHERE `entry`=8197;
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=8197;
-- Mechanic Snare: Earthbind
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=8197;
-- Mechanic Stun: Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=8197;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=8197;

-- Tick
-- School Arcane: Arcane Shot
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 64) WHERE `entry`=8198;
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=8198;
-- Mechanic Snare: Earthbind
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=8198;
-- Mechanic Stun: Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=8198;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=8198;

-- Scald
-- Poison: Instant Poison IV
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=8281;

-- Atal'ai Deathwalker's Spirit
-- School Physical: Auto Shot, Cleave, Whirlwind, Shoot, Thunder Clap, Whirlwind, Demoralizing Roar, Swipe, Claw, Maul, Swipe, Sinister Strike, Demoralizing Shout, Cleave, Sweeping Strikes, Multi-Shot, Multi-Shot, Cleave, Blade Flurry
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 1) WHERE `entry`=8317;

-- Atal'ai Slave
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=8318;
-- Curse: Curse of Agony
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 64) WHERE `entry`=8318;

-- Blighted Surge
-- Poison: Instant Poison VI
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=8519;

-- Glutton
-- Mechanic Root: Improved Wing Clip
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=8567;
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=8567;
-- Mechanic Stun: Kidney Shot, Cheap Shot, Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=8567;

-- Infernal Servant
-- Poison: Instant Poison VI
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=8616;

-- Dreadlord
-- Poison: Instant Poison VI, Serpent Sting, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=8716;

-- Battle Chicken
-- Mechanic Silence: Silence
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 256) WHERE `entry`=8836;
-- Mechanic Sleep: Sleep
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 512) WHERE `entry`=8836;
-- Mechanic Knockout: Blast Wave
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=8836;
-- Mechanic Polymorph: Hex
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 65536) WHERE `entry`=8836;
-- Mod Stat: Plague Cloud
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=8836;
-- Disease: Plague Cloud
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 16) WHERE `entry`=8836;
-- Poison: Poisonous Blood, Toxic Volley, Poison Bolt Volley, Poison Aura
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=8836;

-- Muck Splash
-- Poison: Instant Poison IV
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=8837;

-- Warbringer Construct
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=8905;
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=8905;
-- Mechanic Snare: Earthbind, Concussive Shot, Crippling Poison, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=8905;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=8905;
-- Poison: Crippling Poison, Instant Poison IV, Instant Poison V, Deadly Poison III, Poison Cloud, Serpent Sting, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=8905;

-- Ragereaver Golem
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=8906;
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=8906;
-- Mechanic Snare: Concussive Shot, Crippling Poison, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=8906;
-- Poison: Crippling Poison, Instant Poison IV, Instant Poison V, Instant Poison VI, Deadly Poison III, Poison Cloud
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=8906;

-- Wrath Hammer Construct
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=8907;
-- Mechanic Snare: Concussive Shot, Crippling Poison, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=8907;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=8907;
-- Mechanic Horror: Death Coil
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8388608) WHERE `entry`=8907;
-- Poison: Crippling Poison, Instant Poison IV, Instant Poison V, Instant Poison VI, Deadly Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=8907;

-- Molten War Golem
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8) WHERE `entry`=8908;
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=8908;
-- Mechanic Snare: Concussive Shot, Piercing Howl, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=8908;
-- Poison: Instant Poison IV, Serpent Sting, Numbing Pain
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=8908;

-- Fireguard
-- Mechanic Root: Frost Nova
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=8909;
-- Mechanic Snare: Cone of Cold
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=8909;
-- Poison: Instant Poison IV, Instant Poison V, Instant Poison VI, Deadly Poison III, Poison Cloud, Serpent Sting, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=8909;

-- Blazing Fireguard
-- Mechanic Snare: Crippling Poison, Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=8910;
-- Poison: Crippling Poison, Crippling Poison, Instant Poison IV, Instant Poison V, Deadly Poison III, Serpent Sting, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=8910;

-- Fireguard Destroyer
-- Poison: Crippling Poison, Crippling Poison, Instant Poison IV, Instant Poison V, Instant Poison VI, Deadly Poison III, Poison Cloud, Serpent Sting, Serpent Sting, Numbing Pain
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=8911;

-- Bloodhound Mastiff
-- Mechanic Fear: Intimidating Shout, Howl of Terror
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=8922;

-- Golem Lord Argelmach
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=8983;

-- Bael'Gar
-- Mechanic Bleed: Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=9016;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=9016;

-- Lord Incendius
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=9017;
-- Poison: Instant Poison IV, Instant Poison V
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9017;

-- Overmaster Pyron
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=9026;
-- Mechanic Snare: Crippling Poison, Earthbind, Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=9026;
-- Mechanic Stun: Cheap Shot, Hammer of Justice, Charge Stun, Hammer of Justice, War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=9026;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=9026;
-- Poison: Crippling Poison, Instant Poison V, Instant Poison VI, Deadly Poison III, Serpent Sting, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9026;

-- Ok'thor the Breaker
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=9030;

-- Hate'rel
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=9034;
-- Poison: Instant Poison IV, Serpent Sting, Numbing Pain
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9034;
-- Curse: Curse of Agony
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 64) WHERE `entry`=9034;

-- Anger'rel
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=9035;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=9035;
-- Poison: Instant Poison IV, Serpent Sting, Numbing Pain
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9035;
-- Curse: Curse of Agony
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 64) WHERE `entry`=9035;

-- Vile'rel
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=9036;
-- Poison: Instant Poison IV, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9036;

-- Gloom'rel (HAS AURAS: Recklessness)
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=9037;
-- Poison: Instant Poison IV, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9037;

-- Seeth'rel
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=9038;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=9038;
-- Poison: Instant Poison IV, Serpent Sting, Numbing Pain
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9038;
-- Curse: Curse of Agony
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 64) WHERE `entry`=9038;

-- Doom'rel (HAS AURAS: Banish)
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=9039;
-- Poison: Instant Poison IV
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9039;

-- Dope'rel
-- Mechanic Bleed: Rend, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=9040;
-- Poison: Instant Poison IV, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9040;
-- Curse: Curse of Agony
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 64) WHERE `entry`=9040;

-- Fineous Darkvire
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=9056;

-- Ambassador Flamelash
-- School Fire: Fire Blast, Immolate
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 4) WHERE `entry`=9156;
-- Mechanic Bleed: Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=9156;
-- Poison: Instant Poison V, Instant Poison VI, Serpent Sting, Numbing Pain
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9156;

-- Burning Spirit
-- Poison: Crippling Poison, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9178;

-- Highlord Omokk
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=9196;

-- Blazerunner
-- Poison: Crippling Poison, Instant Poison VI
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9376;

-- Ground Pounder
-- Poison: Crippling Poison, Instant Poison VI
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9396;

-- Spawn of Bael'Gar
-- School Fire: Fire Blast
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 4) WHERE `entry`=9436;
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=9436;
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9436;

-- Watchman Doomgrip
-- Mechanic Polymorph: Polymorph
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 65536) WHERE `entry`=9476;

-- Phalanx
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=9502;
-- Poison: Instant Poison IV, Instant Poison VI, Poison
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9502;

-- Overlord Wyrmthalak
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=9568;

-- Pyroguard Emberseer
-- Poison: Instant Poison V, Instant Poison VI, Serpent Sting, Poison
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=9816;

-- Magmus
-- School Fire: Fire Blast
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 4) WHERE `entry`=9938;
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=9938;

-- Theodore Mont Claire
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=10057;
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=10057;

-- Vault Warder
-- Mechanic Fear: Howl of Terror, Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=10120;
-- Mechanic Root: Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=10120;
-- Mechanic Banish: Banish
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 131072) WHERE `entry`=10120;
-- Mechanic Interrupt: Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=10120;

-- Onyxia
-- Mod Stat: Curse of Timmy, Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=10184;

-- Halycon
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=10220;

-- Gyth
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=10339;

-- General Drakkisath
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4) WHERE `entry`=10363;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=10363;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=10363;

-- Rage Talon Dragon Guard
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=10366;
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=10366;
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=10366;
-- Mechanic Snare: Piercing Howl, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=10366;
-- Mechanic Freeze: Freezing Trap Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4096) WHERE `entry`=10366;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=10366;

-- Rage Talon Captain
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=10371;
-- Mechanic Fear: Intimidating Shout, Howl of Terror
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=10371;
-- Mechanic Snare: Earthbind, Piercing Howl, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=10371;
-- Mechanic Freeze: Freezing Trap Effect, Freezing Trap Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4096) WHERE `entry`=10371;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=10371;

-- Rage Talon Fire Tongue
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=10372;
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=10372;
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=10372;
-- Mechanic Sleep: Hibernate
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 512) WHERE `entry`=10372;
-- Mechanic Snare: Earthbind, Concussive Shot, Piercing Howl, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=10372;
-- Mechanic Freeze: Freezing Trap Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4096) WHERE `entry`=10372;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=10372;

-- The Beast
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=10430;

-- Maleki the Pallid
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=10438;

-- Baron Rivendare
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=10440;

-- Chromatic Whelp
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=10442;
-- Mechanic Snare: Piercing Howl, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=10442;

-- Chromatic Dragonspawn
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=10447;
-- Mechanic Snare: Concussive Shot, Piercing Howl, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=10447;

-- Lady Illucia Barov
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=10502;
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=10502;

-- Kirtonos the Herald
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=10506;

-- Scalding Elemental
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=10756;

-- Boiling Elemental
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=10757;

-- Archivist Galford
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=10811;
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=10811;

-- Grand Crusader Dathrohan
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=10812;

-- Balnazzar
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=10813;
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=10813;

-- Summoned Water Elemental
-- Poison: Instant Poison V, Instant Poison VI
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=10955;

-- Crimson Rifleman
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=11054;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11054;

-- Fras Siabi
-- Mechanic Disoriented: Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=11058;
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=11058;

-- Stratholme Courier
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=11082;
-- Mechanic Turn: Turn Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4194304) WHERE `entry`=11082;

-- Doctor Theolen Krastinov
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=11261;

-- Zealot Lor'Khan
-- Mod Stat: Scorpid Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11347;

-- Zealot Zath
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11348;

-- Gurubashi Berserker
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=11352;
-- Mod Stat: Scorpid Sting, Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11352;

-- Jin'do the Hexxer
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=11380;
-- Taunt: Taunt, Growl
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 2) WHERE `entry`=11380;
-- Mod Stat: Scorpid Sting, Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11380;

-- Bloodlord Mandokir
-- Mod Stat: Scorpid Sting, Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11382;

-- Eldreth Seether
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=11469;

-- Eldreth Sorcerer
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=11470;

-- Eldreth Spirit
-- Mechanic Bleed: Deep Wound, Deep Wounds, Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=11472;

-- Eldreth Spectre
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds, Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=11473;

-- Eldreth Phantasm
-- Mechanic Bleed: Deep Wound, Deep Wounds, Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=11475;

-- Arcane Aberration
-- Poison: Serpent Sting, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=11480;

-- Mana Remnant (HAS AURAS: Blink)
-- Poison: Serpent Sting, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=11483;

-- Magister Kalendris
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=11487;

-- Zevrim Thornhoof
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=11490;

-- Ragnaros (HAS AURAS: Ragnaros Submerge Effect)
-- Mod Stat: Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11502;
-- Disease: Gift of Arthas, Devouring Plague
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 16) WHERE `entry`=11502;
-- Poison: Instant Poison V, Instant Poison VI, Deadly Poison IV, Poison Cloud, Corrosive Poison, Serpent Sting, Numbing Pain, Serpent Sting, Deadly Poison V
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=11502;

-- Rattlegore
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=11622;

-- Molten Giant
-- Mod Stat: Vindication, Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11658;

-- Molten Destroyer
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11659;

-- Flamewaker Healer
-- Mechanic Polymorph: Polymorph, Polymorph, Polymorph: Pig
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 65536) WHERE `entry`=11663;
-- Mod Stat: Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11663;

-- Flamewaker Elite (HAS AURAS: Separation Anxiety)
-- Mechanic Stun: Charge Stun, Kidney Shot, Bash, Hammer of Justice, Revenge Stun, Blackout, Intercept Stun, War Stomp, Intercept Stun, Intercept Stun, Earthshaker
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=11664;
-- Mod Stat: Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11664;

-- Lava Annihilator
-- Mod Stat: Vindication, Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11665;
-- Poison: Instant Poison V, Instant Poison VI, Deadly Poison IV, Corrosive Poison, Serpent Sting, Serpent Sting, Numbing Pain, Poison, Serpent Sting, Deadly Poison V
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=11665;

-- Firewalker
-- Mod Stat: Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11666;
-- Disease: Gift of Arthas
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 16) WHERE `entry`=11666;
-- Poison: Instant Poison V, Instant Poison VI, Deadly Poison IV, Corrosive Poison, Serpent Sting, Numbing Pain, Poison, Serpent Sting, Deadly Poison V
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=11666;

-- Flameguard
-- Mod Stat: Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11667;
-- Poison: Instant Poison V, Instant Poison VI, Deadly Poison IV, Corrosive Poison, Serpent Sting, Numbing Pain, Serpent Sting, Deadly Poison V
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=11667;

-- Firelord
-- Mod Stat: Vindication, Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11668;
-- Disease: Gift of Arthas
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 16) WHERE `entry`=11668;
-- Poison: Instant Poison V, Instant Poison VI, Deadly Poison IV, Corrosive Poison, Serpent Sting, Numbing Pain, Poison, Serpent Sting, Deadly Poison V
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=11668;

-- Core Hound
-- Mod Stat: Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11671;

-- Ancient Core Hound
-- Mod Stat: Vindication, Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11673;

-- Ambershard Crusher
-- School Nature: Instant Poison IV, Instant Poison V, Deadly Poison III, Lightning Shield, Lightning Shield
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=11781;
-- Poison: Instant Poison IV, Instant Poison V, Deadly Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=11781;

-- Ambershard Destroyer
-- School Nature: Wrath, Earth Shock, Instant Poison IV, Instant Poison V, Deadly Poison III, Lightning Shield, Lightning Shield
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=11782;
-- Poison: Instant Poison IV, Instant Poison V, Deadly Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=11782;

-- Ambereye Basilisk
-- School Nature: Earth Shock, Instant Poison IV, Instant Poison V, Deadly Poison III, Serpent Sting, Faerie Fire (Feral), Lightning Shield, Lightning Shield, Keeper's Sting
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=11785;
-- Mechanic Bleed: Rend, Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=11785;

-- Ambereye Reaver
-- School Nature: Wrath, Lightning Bolt, Earth Shock, Instant Poison IV, Instant Poison V, Deadly Poison III, Chain Lightning, Faerie Fire (Feral), Lightning Shield, Lightning Shield
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=11786;
-- Mechanic Bleed: Rend, Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=11786;

-- Keeper Remulos
-- Mechanic Stun: Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=11832;

-- Nathanos Blightcaller
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11878;

-- Blighthound
-- Mechanic Fear: Fear, Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=11885;

-- Captain Galvangar
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11947;

-- Vanndar Stormpike
-- Mod Stat: Scorpid Sting, Blessing of Kings
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11948;
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=11948;

-- Flamegor
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11981;

-- Magmadar
-- Mod Stat: Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11982;

-- Firemaw
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=11983;
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=11983;

-- Baron Geddon
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=12056;

-- Garr
-- Mod Stat: Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12057;
-- Poison: Instant Poison V, Instant Poison VI, Corrosive Poison, Numbing Pain, Poison, Serpent Sting, Deadly Poison V
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=12057;

-- Lava Elemental
-- Mod Stat: Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12076;
-- Mod Cast Speed: Curse of Tongues
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=12076;
-- Poison: Instant Poison V, Instant Poison VI, Deadly Poison IV, Corrosive Poison, Serpent Sting, Numbing Pain, Poison, Serpent Sting, Deadly Poison V
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=12076;

-- Sulfuron Harbinger
-- Mod Stat: Scorpid Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12098;

-- Firesworn
-- Poison: Instant Poison V, Instant Poison VI, Serpent Sting, Serpent Sting, Serpent Sting, Deadly Poison V
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=12099;

-- Lava Reaver
-- Mod Stat: Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12100;
-- Disease: Gift of Arthas
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 16) WHERE `entry`=12100;
-- Poison: Instant Poison V, Instant Poison VI, Deadly Poison IV, Corrosive Poison, Serpent Sting, Numbing Pain, Poison, Deadly Poison V
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=12100;

-- Lava Surger
-- Mod Stat: Vindication, Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12101;
-- Poison: Instant Poison V, Instant Poison VI, Deadly Poison IV, Corrosive Poison, Serpent Sting, Serpent Sting, Numbing Pain, Poison, Serpent Sting, Deadly Poison V
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=12101;

-- Onyxian Warder
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12129;

-- Son of Flame
-- Mechanic Disoriented: Blind
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=12143;
-- Mechanic Root: Frost Nova, Frost Nova, Frost Nova
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=12143;
-- Mechanic Snare: Earthbind, Frostbolt, Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=12143;
-- Poison: Blind, Instant Poison V, Instant Poison VI, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=12143;

-- Princess Theradras
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12201;

-- Landslide
-- Mechanic Stun: Cheap Shot, Hammer of Justice, Charge Stun, Bash
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=12203;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12203;

-- Primordial Behemoth
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=12206;
-- Mechanic Snare: Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=12206;
-- Mechanic Freeze: Freezing Trap Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4096) WHERE `entry`=12206;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12206;

-- Celebras the Cursed
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12225;

-- Lord Vyletongue (HAS AURAS: Blink)
-- Mechanic Stun: Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=12236;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12236;

-- Razorlash
-- Mechanic Stun: Cheap Shot, Hammer of Justice, Charge Stun, Bash
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=12258;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12258;

-- Lava Spawn
-- Mod Stat: Vindication, Curse of Timmy
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12265;
-- Poison: Instant Poison V, Instant Poison VI, Deadly Poison IV, Serpent Sting, Poison, Deadly Poison V
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=12265;

-- Demetria
-- Mechanic Bleed: Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=12339;

-- Lord Kazzak
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12397;

-- Death Talon Dragonspawn
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=12422;

-- Blackwing Warlock
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=12459;
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12459;

-- Death Talon Wyrmguard
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=12460;
-- Mod Stat: Scorpid Sting, Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12460;

-- Death Talon Overseer
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4) WHERE `entry`=12461;
-- Mod Stat: Scorpid Sting, Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12461;

-- Death Talon Flamescale
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12463;

-- Death Talon Captain (HAS AURAS: Commanding Shout)
-- Mod Stat: Scorpid Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12467;

-- Death Talon Hatcher
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12468;

-- Arcanite Dragonling
-- Disease: Brood Affliction: Red
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 16) WHERE `entry`=12473;
-- Poison: Poison Aura
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=12473;

-- Emeraldon Boughguard
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=12474;

-- Emeraldon Tree Warder (HAS AURAS: Faerie Fire)
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=12475;
-- Mechanic Snare: Concussive Shot, Crippling Poison, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=12475;

-- Emeraldon Oracle
-- Mechanic Snare: Crippling Poison, Chilled, Aftermath
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=12476;

-- Verdantine Boughguard
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=12477;
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=12477;

-- Verdantine Oracle
-- Mechanic Root: Entangling Roots, Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=12478;
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=12478;

-- Verdantine Tree Warder (HAS AURAS: Faerie Fire)
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=12479;
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=12479;

-- Dreamtracker
-- School Nature: Faerie Fire, Instant Poison VI, Serpent Sting, Faerie Fire (Feral), Lightning Strike, Serpent Sting
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=12496;
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=12496;
-- Mechanic Snare: Frost Shock
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=12496;
-- Mechanic Stun: Cheap Shot, Charge Stun, Impact, Revenge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=12496;

-- Dreamstalker
-- School Nature: Faerie Fire, Wrath, Chain Lightning, Crippling Poison, Instant Poison V, Instant Poison VI, Mind-numbing Poison III, Serpent Sting, Lightning Bolt, Faerie Fire (Feral), Wrath, Lightning Strike, Acid Blast, Deadly Poison V, Lightning Shield, Lightning Shield
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=12498;
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=12498;
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=12498;
-- Mechanic Stun: Charge Stun, Kidney Shot, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=12498;

-- Grethok the Controller
-- Mechanic Root: Frostbite, Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=12557;
-- Mechanic Snare: Crippling Poison, Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=12557;
-- Mechanic Stun: Cheap Shot, Charge Stun, Bash, Impact, Crystal Charge, Blackout, Intercept Stun, Intercept Stun, War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=12557;
-- Mechanic Polymorph: Polymorph
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 65536) WHERE `entry`=12557;
-- Mechanic Interrupt: Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=12557;
-- Mod Stat: Scorpid Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=12557;

-- Tideress
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=12759;

-- Baron Aquanis
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=12876;

-- Burning Blade Seer
-- Mechanic Fear: Fear
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=13019;

-- Vaelastrasz the Corrupt
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=13020;

-- Warpwood Crusher
-- Mechanic Stun: Charge Stun, Concussion Blow
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=13021;
-- Disease: Devouring Plague
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 16) WHERE `entry`=13021;
-- Poison: Instant Poison VI
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=13021;

-- Lieutenant Spencer
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=13138;

-- Lieutenant Grummus
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=13145;

-- Phase Lasher
-- Poison: Crippling Poison, Instant Poison VI
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=13196;

-- Fel Lash
-- Poison: Instant Poison VI
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=13197;

-- Jekyll Flandring
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=13219;

-- Lokholar the Ice Lord
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=13256;

-- Hydrospawn
-- Poison: Instant Poison VI
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=13280;

-- Noxxion
-- Mechanic Stun: Cheap Shot, Charge Stun, Bash, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=13282;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=13282;

-- Death Lash
-- Poison: Instant Poison VI
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=13285;

-- Lieutenant Greywand
-- Mechanic Root: Entangling Roots
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=13298;
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=13298;

-- Rotgrip
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=13596;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=13596;

-- Tinkerer Gizlock
-- Mechanic Stun: Cheap Shot, Hammer of Justice, Charge Stun, Bash, Intimidation
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=13601;
-- Mod Stat: Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=13601;

-- Veng
-- Mechanic Bleed: Garrote
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=13738;

-- Maraudos
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=13739;

-- Magra
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=13740;

-- Gelk
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=13741;

-- Kolk
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds, Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=13742;

-- Corporal Teeka Bloodsnarl
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=13776;

-- Voggah Deathgrip
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=13817;

-- Warmaster Laggrond
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=13840;

-- Alterac Yeti
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=13959;
-- Mechanic Stun: Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=13959;
-- Mechanic Polymorph: Polymorph: Pig
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 65536) WHERE `entry`=13959;

-- Chromaggus
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=14020;

-- Massive Geyser
-- School Physical: Multi-Shot, Multi-Shot
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 1) WHERE `entry`=14122;
-- School Nature: Lightning Shield, Lightning Shield
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=14122;
-- School Shadow: Shadowguard, Shadowguard
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 32) WHERE `entry`=14122;

-- Chromatic Drakonid
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=14302;

-- Captain Kromcrush
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=14325;

-- Arcane Torrent
-- School Arcane: Counterspell, Arcane Explosion
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 64) WHERE `entry`=14399;

-- Arcane Feedback
-- School Arcane: Arcane Explosion
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 64) WHERE `entry`=14400;

-- Molt Thorn
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=14448;

-- Horde Battle Standard
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=14466;

-- High Priest Venoxis
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=14507;
-- Mod Stat: Scorpid Sting, Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=14507;

-- High Priest Thekal
-- Mod Stat: Scorpid Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=14509;

-- High Priestess Mar'li
-- Mod Stat: Scorpid Sting, Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=14510;

-- Shadowed Spirit
-- Mechanic Stun: Bash
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=14511;

-- High Priestess Arlokk (HAS AURAS: Vanish)
-- Mod Stat: Scorpid Sting, Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=14515;

-- Death Knight Darkreaver
-- Mechanic Stun: Bash
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=14516;

-- High Priestess Jeklik
-- Mod Stat: Scorpid Sting, Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=14517;

-- Ebonroc
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=14601;
-- Mod Stat: Scorpid Sting, Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=14601;

-- Bone Construct
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=14605;

-- Corrupted Infernal
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=14668;
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=14668;
-- Poison: Instant Poison VI
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=14668;

-- Sever
-- Mechanic Stun: Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=14682;
-- Mechanic Turn: Turn Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4194304) WHERE `entry`=14682;

-- Balzaphon
-- Mechanic Stun: Cheap Shot, Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=14684;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=14684;

-- Lady Falther'ess
-- Mechanic Stun: Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=14686;
-- Mechanic Turn: Turn Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4194304) WHERE `entry`=14686;

-- Revanchion
-- Mechanic Silence: Kick - Silenced
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 256) WHERE `entry`=14690;
-- Mechanic Stun: Cheap Shot, Charge Stun, Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=14690;
-- Mechanic Bleed: Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=14690;
-- Mechanic Turn: Turn Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4194304) WHERE `entry`=14690;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=14690;

-- Scorn
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=14693;
-- Mechanic Turn: Turn Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4194304) WHERE `entry`=14693;

-- Lord Blackwood
-- Mechanic Root: Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=14695;
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=14695;
-- Mechanic Stun: Bash, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=14695;
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=14695;
-- Mechanic Interrupt: Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=14695;

-- High Overlord Saurfang
-- Mechanic Fear: Panic
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=14720;
-- Mechanic Stun: War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=14720;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=14720;
-- Mod Stat: Power Word: Fortitude, Divine Spirit
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=14720;

-- Gurubashi Bat Rider
-- Mod Stat: Scorpid Sting, Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=14750;
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=14750;

-- Dun Baldar South Marshal
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=14763;

-- West Frostwolf Marshal
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=14769;

-- Hakkar
-- Mod Stat: Scorpid Sting, Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=14834;

-- Taerar
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=14890;

-- Jeztor's War Rider
-- Mod Stat: Power Word: Fortitude
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=14944;

-- Shade of Jin'do
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=14986;

-- Ohgan
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=14988;

-- Hazza'rah
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15083;

-- Wushoolay
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15085;

-- Gahz'ranka
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15114;

-- Rutherford Twing
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=15126;
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=15126;

-- Defiler Elite
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=15128;

-- League of Arathor Elite
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=15130;

-- Azure Templar
-- Poison: Instant Poison VI
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=15211;

-- Hoary Templar
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=15212;

-- Vekniss Hive Crawler
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15240;
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=15240;

-- Qiraji Mindslayer (HAS AURAS: Immune Effect: Taunt & AttackMe)
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15246;

-- Qiraji Lasher
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15249;

-- Qiraji Champion
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15252;

-- The Prophet Skeram (HAS AURAS: ClearAll)
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15263;

-- Anubisath Sentinel
-- Taunt: Taunt, Growl
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 2) WHERE `entry`=15264;
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15264;

-- Emperor Vek'nilash
-- School Fire: Fire Blast, Fireball, Fire Blast, Scorch, Fire Nova, Fire Nova, Hellfire Effect, Goblin Sapper Charge, Fiery Weapon, Dragonbreath Chili, Searing Pain, Fireball, Dense Dynamite, Firebolt, Fireball, Immolate
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 4) WHERE `entry`=15275;
-- School Nature: Faerie Fire, Wrath, Earth Shock, Chain Lightning, Instant Poison VI, Gift of Arthas, Serpent Sting, Serpent Sting, Lightning Bolt, Lightning Bolt, Faerie Fire (Feral), Faerie Fire (Feral), Wrath, Thunderfury, Lightning Strike, Zulian Slice, Insect Swarm, Serpent Sting, Deadly Poison V, Lightning Shield, Lightning Shield
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=15275;
-- School Shadow: Shadow Word: Pain, Mind Blast, Shadow Bolt, Corruption, Curse of Recklessness, Curse of the Elements, Curse of Shadow, Shadow Bolt, Shadow Bolt, Shadowburn, Siphon Life, Touch of Weakness, Gutgore Ripper, Drain Life, Shadow Bolt, Corruption, Shadowguard, Shadowguard, Touch of Weakness, Drain Life
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 32) WHERE `entry`=15275;
-- School Arcane: Arcane Shot, Starfire, Arcane Explosion, Arcane Shot, Arcane Shot, Hunter's Mark, Distracting Shot, Expose Weakness
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 64) WHERE `entry`=15275;

-- Emperor Vek'lor
-- School Physical: Auto Shot, Shield Bash, Whirlwind, Shoot Bow, Shred, Claw, Maul, Demoralizing Roar, Swipe, Backstab, Sinister Strike, Demoralizing Shout, Sunder Armor, Raptor Strike, Aimed Shot, Bloodthirst, Shield Slam, Heroic Strike, Multi-Shot, Backstab, Vampirism
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 1) WHERE `entry`=15276;

-- Viscidus
-- Disease: Gift of Arthas, Creeping Mold, Devouring Plague
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 16) WHERE `entry`=15299;
-- Poison: Instant Poison VI, Serpent Sting, Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=15299;

-- Shade of Taerar
-- School Nature: Instant Poison VI, Mind-numbing Poison III, Lightning Bolt, Thunderfury, Acid Blast
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 8) WHERE `entry`=15302;
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=15302;

-- Qiraji Scarab
-- Mechanic Root: Frostbite, Entrapment, Improved Hamstring
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=15316;
-- Mechanic Snare: Earthbind, Concussive Shot, Piercing Howl, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=15316;

-- Qiraji Scorpion
-- Mechanic Root: Entrapment, Improved Wing Clip
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=15317;
-- Mechanic Snare: Earthbind, Concussive Shot, Piercing Howl, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=15317;

-- Hive'Zara Stinger
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15327;

-- Flesh Hunter
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15335;
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15335;

-- Obsidian Destroyer
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15338;

-- Ossirian the Unscarred
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15339;

-- Moam
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=15340;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15340;
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15340;

-- General Rajaxx
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15341;

-- Kurinnaxx
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15348;
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15348;

-- Anubisath Guardian (HAS AURAS: Explode)
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15355;

-- Captain Qeez
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15391;

-- Captain Tuubid
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15392;

-- Kaldorei Infantry
-- Mechanic Stun: War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=15423;

-- Lieutenant General Andorov
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=15471;
-- Mechanic Stun: War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=15471;
-- Mod Stat: Power Word: Fortitude, Blessing of Kings
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15471;

-- Kaldorei Elite
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=15473;
-- Mechanic Stun: War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=15473;
-- Mod Stat: Blessing of Kings
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15473;

-- Princess Huhuran
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15509;

-- Fankriss the Unyielding
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15510;

-- Lord Kri
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15511;

-- Battleguard Sartura (HAS AURAS: Whirlwind)
-- Mechanic Stun: Kidney Shot, Bash, Hammer of Justice, Impact, Revenge Stun, Concussion Blow, Blackout, Starfire Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=15516;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15516;

-- Mana Fiend
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=15527;
-- Mechanic Stun: Hammer of Justice, Impact, Revenge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=15527;

-- Princess Yauj
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15543;

-- Doctor Weavil
-- Taunt: Taunt
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 2) WHERE `entry`=15552;

-- Maws
-- Taunt: Taunt
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 2) WHERE `entry`=15571;

-- Minion of Weavil
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=15591;

-- Twilight Corrupter
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15625;
-- Taunt: Taunt, Challenging Shout, Growl
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 2) WHERE `entry`=15625;

-- Eye Tentacle
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=15726;

-- Colossus of Zora
-- Taunt: Taunt
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 2) WHERE `entry`=15740;

-- Colossal Anubisath Warbringer
-- Mod Stat: Vindication, Vindication
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15743;
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=15743;

-- Lesser Silithid Flayer
-- Mechanic Snare: Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=15749;

-- Qiraji Major
-- Mod Stat: Scorpid Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15750;

-- Anubisath Warbringer
-- Mod Stat: Scorpid Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15751;

-- Silithid Flayer
-- Mechanic Fear: Howl of Terror
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=15752;
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=15752;

-- Greater Silithid Flayer
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=15756;
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=15756;
-- Mod Stat: Scorpid Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15756;

-- Supreme Anubisath Warbringer
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=15758;

-- Supreme Silithid Flayer
-- Mechanic Fear: Fear
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=15759;
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=15759;

-- Thaddius
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15928;

-- Stalagg
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15929;

-- Grobbulus
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15931;

-- Heigan the Unclean
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4) WHERE `entry`=15936;

-- Maexxna
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15952;
-- Mod Stat: Scorpid Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15952;

-- Grand Widow Faerlina
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4) WHERE `entry`=15953;

-- Vekniss Hatchling
-- Mechanic Snare: Crippling Poison, Earthbind, Piercing Howl, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=15962;

-- Dread Creeper
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Blackout, Intercept Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=15974;

-- Carrion Spinner
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Impact, Blackout, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=15975;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15975;
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=15975;

-- Venom Stalker
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=15976;

-- Infectious Skitterer
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Impact, Blackout, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=15977;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15977;
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=15977;

-- Crypt Reaver
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=15978;
-- Mod Cast Speed: Mind-numbing Poison III
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 8) WHERE `entry`=15978;

-- Naxxramas Cultist
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Concussion Blow, Blackout, Intercept Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=15980;

-- Naxxramas Acolyte
-- Mechanic Silence: Counterspell - Silenced
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 256) WHERE `entry`=15981;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Blackout, Intercept Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=15981;

-- Sartura's Royal Guard
-- Mod Stat: Frightalon
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15984;

-- Sapphiron
-- Mod Stat: Scorpid Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=15989;

-- Bile Retcher
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=16018;

-- Mad Scientist
-- Mechanic Disoriented: Scatter Shot, Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16020;
-- Mechanic Root: Entrapment
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=16020;

-- Living Monstrosity
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=16021;

-- Surgical Assistant
-- Mechanic Disoriented: Scatter Shot, Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16022;
-- Mechanic Root: Entrapment, Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=16022;
-- Mechanic Snare: Earthbind
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16022;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Intercept Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=16022;
-- Mechanic Interrupt: Counterspell, Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=16022;

-- Embalming Slime
-- Mechanic Root: Entrapment
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=16024;

-- Frenzied Bat
-- Mechanic Disoriented: Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16036;
-- Mechanic Root: Entrapment
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=16036;
-- Mechanic Snare: Concussive Shot, Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16036;
-- Mechanic Stun: Cheap Shot, Kidney Shot, Hammer of Justice, Intercept Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=16036;

-- Plagued Bat
-- Mechanic Root: Entrapment
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=16037;
-- Mechanic Snare: Concussive Shot, Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16037;
-- Mechanic Stun: Cheap Shot, Kidney Shot, Hammer of Justice, Intercept Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=16037;

-- Diseased Maggot
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16056;
-- Mechanic Snare: Earthbind, Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16056;

-- Rotting Maggot
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16057;
-- Mechanic Snare: Earthbind, Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16057;

-- Theldren
-- Taunt: Taunt
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 2) WHERE `entry`=16059;

-- Instructor Razuvious
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4) WHERE `entry`=16061;

-- Skeletal Steed
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16067;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Hammer of Justice, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=16067;

-- Commander Eligor Dawnbringer
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=16115;

-- Unrelenting Trainee
-- Mechanic Root: Entrapment
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=16124;
-- Mechanic Snare: Earthbind, Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16124;

-- Unrelenting Deathknight
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=16125;
-- Mechanic Turn: Turn Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4194304) WHERE `entry`=16125;

-- Spectral Trainee
-- School Holy: Hammer of Justice, Exorcism, Shackle Undead, Stratholme Holy Water, Holy Nova
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 2) WHERE `entry`=16127;
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16127;
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=16127;
-- Mechanic Snare: Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16127;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=16127;

-- Bile Sludge
-- Taunt: Taunt, Challenging Shout, Growl
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 2) WHERE `entry`=16142;

-- Deathknight (HAS AURAS: Veil of Darkness)
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=16146;

-- Spectral Deathknight
-- School Holy: Shackle Undead
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 2) WHERE `entry`=16148;
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16148;
-- Mechanic Snare: Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16148;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=16148;

-- Spectral Horse
-- School Holy: Hammer of Justice, Shackle Undead
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 2) WHERE `entry`=16149;
-- Mechanic Snare: Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16149;
-- Mechanic Stun: Kidney Shot, Bash, Hammer of Justice, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=16149;

-- Spectral Rider
-- School Holy: Hammer of Justice, Shackle Undead
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` | 2) WHERE `entry`=16150;

-- Risen Deathknight
-- Mechanic Disoriented: Blind, Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16154;
-- Mechanic Freeze: Freezing Trap Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4096) WHERE `entry`=16154;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=16154;
-- Mechanic Shackle: Shackle Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 524288) WHERE `entry`=16154;

-- Dark Touched Warrior
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16156;
-- Mechanic Root: Entrapment
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=16156;
-- Mechanic Snare: Concussive Shot, Crippling Poison, Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16156;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=16156;
-- Mechanic Shackle: Shackle Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 524288) WHERE `entry`=16156;

-- Doom Touched Warrior
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=16157;
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16157;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=16157;

-- Death Touched Warrior
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=16158;
-- Mechanic Disoriented: Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16158;
-- Mechanic Root: Entrapment
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=16158;
-- Mechanic Snare: Concussive Shot, Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16158;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 8192) WHERE `entry`=16158;

-- Deathknight Cavalier
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4) WHERE `entry`=16163;

-- Shade of Naxxramas
-- Mechanic Root: Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=16164;
-- Mechanic Snare: Earthbind, Concussive Shot, Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16164;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Intercept Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=16164;
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=16164;
-- Mechanic Interrupt: Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=16164;

-- Necro Knight (HAS AURAS: Blink)
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=16165;

-- Bony Construct
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=16167;

-- Unholy Axe
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4) WHERE `entry`=16194;
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=16194;

-- Unholy Staff
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=16215;

-- Unholy Swords
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4) WHERE `entry`=16216;
-- Mechanic Bleed: Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=16216;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=16216;

-- Argent Recruiter
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=16241;

-- Argent Scout
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=16255;

-- Argent Emissary
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=16285;

-- Spore
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16286;
-- Mechanic Stun: Intercept Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=16286;

-- Mutated Grub
-- Mechanic Disoriented: Scatter Shot, Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16297;
-- Mechanic Root: Entrapment, Improved Wing Clip
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=16297;
-- Mechanic Snare: Earthbind, Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16297;
-- Mechanic Stun: Charge Stun, Kidney Shot, Bash, Hammer of Justice, Intercept Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=16297;

-- Argent Messenger
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=16359;

-- Necropolis Acolyte
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=16368;

-- Argent Sentry
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=16378;
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=16378;

-- Atiesh
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=16387;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=16387;

-- Deathchill Servant
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=16390;

-- Soul Weaver
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=16429;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=16429;

-- Guardian of Icecrown
-- Mechanic Shackle: Shackle Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 524288) WHERE `entry`=16441;

-- Plagued Ghoul
-- Mechanic Disoriented: Blind, Scatter Shot, Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16447;
-- Mechanic Root: Entrapment, Improved Wing Clip
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=16447;
-- Mechanic Snare: Concussive Shot, Stygian Grasp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16447;
-- Mechanic Shackle: Shackle Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 524288) WHERE `entry`=16447;

-- Spirit of Naxxramas
-- Mechanic Bleed: Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=16449;

-- Deathknight Vindicator
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4) WHERE `entry`=16451;

-- Necro Knight Guardian (HAS AURAS: Blink)
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=16452;

-- Naxxramas Follower
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=16505;

-- Naxxramas Worshipper (HAS AURAS: Mind Exhaustion)
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=16506;
-- Mechanic Silence: Silence
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 256) WHERE `entry`=16506;
-- Mechanic Stun: Kidney Shot, Hammer of Justice, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=16506;
-- Mod Stat: Juju Power
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 4) WHERE `entry`=16506;

-- Argent Outfitter
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=16787;

-- Deathknight Understudy (HAS AURAS: Mind Exhaustion)
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=16803;
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4) WHERE `entry`=16803;

-- Death Lord
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 4) WHERE `entry`=16861;

-- Plagued Guardian (HAS AURAS: Blink, Blink, Blink, Blink)
-- Mechanic Disoriented: Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16981;
-- Mechanic Root: Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=16981;
-- Mechanic Interrupt: Counterspell, Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=16981;
-- Taunt: Taunt, Challenging Roar, Growl
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 2) WHERE `entry`=16981;

-- Plagued Champion
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=16983;

-- Plagued Warrior
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2) WHERE `entry`=16984;
-- Mechanic Root: Entrapment, Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 64) WHERE `entry`=16984;
-- Mechanic Snare: Earthbind
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1024) WHERE `entry`=16984;
-- Mechanic Stun: Kidney Shot, Bash, Hammer of Justice, Intercept Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 2048) WHERE `entry`=16984;
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16384) WHERE `entry`=16984;
-- Mechanic Shackle: Shackle Undead, Shackle Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 524288) WHERE `entry`=16984;
-- Mechanic Interrupt: Feral Charge Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 33554432) WHERE `entry`=16984;

-- Alliance Silithyst Sentinel
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry`=17765;
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 16) WHERE `entry`=17765;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
