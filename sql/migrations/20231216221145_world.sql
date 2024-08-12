DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231216221145');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231216221145');
-- Add your query below.


-- Rock Elemental
-- Mechanic Stun: Cheap Shot, Hammer of Justice, Charge Stun, Intercept Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=92;

-- Fire Elemental
-- Mechanic Snare: Chilled, Chilled, Curse of Exhaustion
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=575;
-- Mechanic Stun: Revenge Stun, War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=575;

-- Lesser Water Elemental
-- Mechanic Root: Boar Charge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=691;
-- Mechanic Snare: Concussive Shot, Curse of Exhaustion
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=691;
-- Mechanic Stun: Charge Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=691;

-- Tangled Horror
-- Mechanic Bleed: Rupture, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=766;

-- Cursed Sailor
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=1157;

-- Skeletal Acolyte
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=1789;

-- Hungering Wraith
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=1802;

-- Wailing Death
-- Mechanic Disoriented: Blind
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=1804;

-- Araj the Summoner
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=1852;

-- Lake Skulker
-- Mechanic Bleed: Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=1953;

-- Elder Lake Skulker
-- Mechanic Bleed: Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=1954;

-- Timberling Bark Ripper
-- Mechanic Bleed: Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=2025;

-- Cursed Highborne
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=2176;

-- Elemental Slave
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=2359;
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=2359;
-- Mechanic Snare: Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=2359;
-- Mechanic Stun: Charge Stun, Impact
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=2359;

-- Lesser Rock Elemental
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=2735;
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=2735;
-- Mechanic Fear: Intimidating Shout, Fear, Psychic Scream, Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=2735;
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=2735;
-- Mechanic Snare: Concussive Shot, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=2735;
-- Mechanic Stun: Kidney Shot, Cheap Shot, Hammer of Justice, Hammer of Justice, Charge Stun, Blackout, Intercept Stun, Intimidation
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=2735;

-- Greater Rock Elemental
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=2736;
-- Mechanic Stun: Kidney Shot, Charge Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=2736;

-- Myzrael
-- Mechanic Bleed: Rupture
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=2755;

-- Enraged Rock Elemental
-- Mechanic Fear: Intimidating Shout, Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=2791;
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=2791;
-- Mechanic Stun: Charge Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=2791;

-- Evolving Ectoplasm (HAS AURAS: Immunity: Frost)
-- Poison: Serpent Sting
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~32) WHERE `entry`=3640;

-- Mutanus the Devourer
-- Mechanic Fear: Intimidating Shout, Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=3654;

-- Shadethicket Wood Shaper
-- Mechanic Bleed: Rip
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=3781;

-- Shadethicket Raincaller
-- Mechanic Bleed: Rip
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=3783;

-- Shadethicket Bark Ripper
-- Mechanic Bleed: Rip
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=3784;

-- Bleak Worg
-- School Frost: Cone of Cold, Frost Nova, Chilled, Chilled, Frostbolt, Cone of Cold, Chilled, Frostbite, Winter's Chill
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` & ~16) WHERE `entry`=3861;

-- Tormented Officer
-- Mechanic Bleed: Rend, Garrote, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=3873;

-- Haunted Servitor
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=3875;

-- Wailing Guardsman
-- Mechanic Bleed: Rend, Garrote, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=3877;

-- Razorclaw the Butcher
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1) WHERE `entry`=3886;
-- Mechanic Snare: Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=3886;

-- Befouled Water Elemental
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=3917;
-- Mechanic Root: Improved Wing Clip, Boar Charge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=3917;
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=3917;
-- Mechanic Stun: Charge Stun, War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=3917;

-- Wolf Master Nandos
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1) WHERE `entry`=3927;

-- Taneel Darkwood
-- Mechanic Fear: Fear
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=3940;

-- Houndmaster Loksey
-- Mechanic Snare: Crippling Poison, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=3974;
-- Mechanic Stun: Charge Stun, Impact
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=3974;

-- Interrogator Vishas
-- Mechanic Fear: Intimidating Shout, Fear, Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=3983;

-- Charred Ancient
-- Mechanic Bleed: Garrote
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=4028;

-- Eye of Kilrogg
-- Mechanic Shield: Power Word: Shield, Power Word: Shield, Power Word: Shield, Power Word: Shield
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~262144) WHERE `entry`=4277;

-- Odo the Blindwatcher
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1) WHERE `entry`=4279;

-- Aggem Thorncurse
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=4424;

-- Death Speaker Jargba
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1) WHERE `entry`=4428;
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=4428;

-- High Inquisitor Fairbanks
-- Mechanic Snare: Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=4542;
-- Mechanic Stun: War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=4542;

-- Bloodmage Thalnos
-- Mechanic Snare: Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=4543;

-- Twilight Elementalist
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1) WHERE `entry`=4814;
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=4814;
-- Mechanic Fear: Fear
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=4814;
-- Mechanic Stun: Cheap Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=4814;
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=4814;

-- Earthcaller Halmgar
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1) WHERE `entry`=4842;

-- Deviate Lasher
-- Mechanic Bleed: Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=5055;

-- Sea Elemental
-- Mechanic Fear: Intimidating Shout, Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=5461;
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=5461;
-- Mechanic Stun: Charge Stun, Improved Concussive Shot, Intercept Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=5461;

-- Thistleshrub Dew Collector
-- Mechanic Bleed: Rend, Pounce Bleed, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=5481;

-- Thistleshrub Rootshaper
-- Mechanic Bleed: Pounce Bleed, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=5485;

-- Gnarled Thistleshrub
-- Mechanic Bleed: Pounce Bleed, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=5490;

-- Shade of Eranikus (HAS AURAS: Deep Slumber)
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=5709;

-- Jammal'an the Prophet
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=5710;

-- Morphaz
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=5719;

-- Dreamscythe
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=5721;

-- Hazzas
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=5722;

-- Deviate Shambler
-- Mechanic Bleed: Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=5761;

-- Verdan the Everliving
-- Mechanic Bleed: Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=5775;

-- Blazing Elemental
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=5850;
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=5850;
-- Mechanic Stun: Hammer of Justice, Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=5850;

-- Inferno Elemental
-- Mechanic Snare: Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=5852;
-- Mechanic Stun: Hammer of Justice, Charge Stun, War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=5852;

-- Heavy War Golem
-- Mechanic Snare: Concussive Shot, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=5854;

-- Magma Elemental
-- Mechanic Root: Frostbite, Boar Charge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=5855;
-- Mechanic Snare: Concussive Shot, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=5855;
-- Mechanic Stun: Cheap Shot, Hammer of Justice, Charge Stun, Revenge Stun, Intercept Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=5855;

-- Mechano-Frostwalker
-- Mechanic Fear: Fear
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=6227;

-- Arcane Nullifier X-21
-- Taunt: Taunt, Growl
-- IMMUNE Challenging Shout, Challenging Roar
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=6232;

-- Gelihast
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1) WHERE `entry`=6243;

-- Haunting Phantasm
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=6427;

-- Azshir the Sleepless
-- Mechanic Snare: Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=6490;
-- Mechanic Bleed: Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=6490;

-- Rift Spawn
-- School Arcane: Arcane Explosion
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` & ~64) WHERE `entry`=6492;

-- Bloodpetal Lasher
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=6509;

-- Bloodpetal Flayer
-- Mechanic Bleed: Rend, Pounce Bleed, Deep Wounds, Deep Wound
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=6510;

-- Bloodpetal Thresher
-- Mechanic Bleed: Rend, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=6511;

-- Tar Beast
-- Mechanic Bleed: Rupture, Garrote, Deep Wounds, Deep Wound
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=6517;

-- Tar Lurker
-- Mechanic Bleed: Rend, Rend, Deep Wounds, Deep Wound, Deep Wounds, Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=6518;

-- Tar Lord
-- Mechanic Bleed: Deep Wounds, Deep Wound, Deep Wounds, Deep Wounds, Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=6519;

-- Scorching Elemental
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=6520;
-- Mechanic Stun: Hammer of Justice, Charge Stun, Hammer of Justice, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=6520;

-- Tar Creeper
-- Mechanic Bleed: Rend, Rupture, Garrote, Rend, Deep Wounds, Deep Wound
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=6527;

-- Obsidian Elemental
-- Mechanic Stun: Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=7031;
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=7031;

-- Greater Obsidian Elemental
-- Mechanic Snare: Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=7032;

-- Condemned Monk
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=7069;

-- Warpwood Moss Flayer
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=7100;

-- Warpwood Shredder
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=7101;

-- Toxic Horror
-- School Frost: Chilled, Cone of Cold, Frostbolt, Frost Nova
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` & ~16) WHERE `entry`=7132;
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=7132;

-- Irontree Wanderer
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=7138;

-- Irontree Stomper
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=7139;

-- Ironaya
-- Mechanic Stun: Cheap Shot, Mace Stun Effect, Hammer of Justice, Charge Stun, Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=7228;

-- Chief Ukorz Sandscalp
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~4) WHERE `entry`=7267;

-- Witch Doctor Zum'rah
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~4) WHERE `entry`=7271;
-- Mechanic Silence: Silence
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~256) WHERE `entry`=7271;
-- Mechanic Stun: Stun, Cheap Shot, Hammer of Justice, Charge Stun, Kidney Shot, Intimidation
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=7271;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~33554432) WHERE `entry`=7271;

-- Theka the Martyr (HAS AURAS: Theka Transform)
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=7272;
-- Mechanic Snare: Chilled, Piercing Howl, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=7272;
-- Mechanic Stun: Cheap Shot, Big Iron Bomb, Hammer of Justice, Charge Stun, Kidney Shot, Hi-Explosive Bomb, Concussion Blow, Intercept Stun, Intimidation
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=7272;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~33554432) WHERE `entry`=7272;

-- Shadowpriest Sezz'ziz
-- Mechanic Stun: Big Iron Bomb, Hammer of Justice, Charge Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=7275;
-- Mechanic Knockout: Gouge, Repentance
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=7275;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~33554432) WHERE `entry`=7275;

-- Zul'Farrak Zombie
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=7286;

-- Sergeant Bly
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~4) WHERE `entry`=7604;
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=7604;
-- Mechanic Stun: Charge Stun, Kidney Shot, War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=7604;

-- Ilifar
-- School Nature: Wrath
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` & ~8) WHERE `entry`=7734;
-- Poison: Instant Poison VI
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` | 32) WHERE `entry`=7734;

-- Hydromancer Velratha
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=7795;
-- Mechanic Stun: Cheap Shot, Kidney Shot, Intercept Stun, Intimidation
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=7795;
-- Mechanic Freeze: Freezing Trap Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~4096) WHERE `entry`=7795;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~33554432) WHERE `entry`=7795;

-- Nekrum Gutchewer (HAS AURAS: Theka Transform)
-- Mechanic Stun: Cheap Shot, Big Iron Bomb, Hammer of Justice, Charge Stun, Concussion Blow, Intimidation
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=7796;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=7796;
-- Mechanic Interrupt: Counterspell
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~33554432) WHERE `entry`=7796;

-- Chronalis
-- Taunt: Taunt
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=8197;

-- Deep Lurker
-- Mechanic Bleed: Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=8384;

-- Avatar of Hakkar
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=8443;

-- Clunk
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=8447;

-- Scourge Champion
-- Mechanic Disoriented: Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=8529;

-- Death Singer
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=8542;

-- Battle Chicken
-- Mod Stat: Cripple
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~4) WHERE `entry`=8836;

-- Fireguard
-- Mechanic Root: Frostbite, Improved Hamstring
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=8909;
-- Mechanic Snare: Chilled, Piercing Howl, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=8909;
-- Mechanic Knockout: Gouge, Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=8909;

-- Blazing Fireguard
-- Mechanic Snare: Concussive Shot, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=8910;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=8910;

-- Fireguard Destroyer
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=8911;

-- Panzor the Invincible
-- Mechanic Stun: Cheap Shot, Kidney Shot, Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=8923;

-- High Interrogator Gerstahn
-- Mechanic Silence: Silence
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~256) WHERE `entry`=9018;
-- Mechanic Stun: Big Iron Bomb, Charge Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9018;

-- Pyromancer Loregrain
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=9024;
-- Mechanic Snare: Crippling Poison, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=9024;
-- Mechanic Stun: Cheap Shot, Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9024;

-- Lord Roccor
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=9025;
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=9025;
-- Mechanic Snare: Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=9025;
-- Mechanic Bleed: Deep Wound, Deep Wounds, Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=9025;

-- Hate'rel
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Revenge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9034;

-- Anger'rel
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Revenge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9035;

-- Vile'rel
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Hammer of Justice, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9036;

-- Gloom'rel (HAS AURAS: Recklessness)
-- Mechanic Snare: Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=9037;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Concussion Blow
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9037;

-- Seeth'rel
-- Mechanic Snare: Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=9038;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9038;

-- Doom'rel (HAS AURAS: Banish)
-- Mechanic Snare: Earthbind, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=9039;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Revenge Stun, War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9039;

-- Dope'rel
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Revenge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9040;

-- Warder Stilgiss
-- Mechanic Silence: Silence
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~256) WHERE `entry`=9041;
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=9041;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Improved Concussive Shot, Intimidation
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9041;

-- Verek
-- Mechanic Root: Improved Hamstring
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=9042;
-- Mechanic Snare: Crippling Poison, Chilled, Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=9042;
-- Mechanic Stun: Cheap Shot, Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9042;

-- Fineous Darkvire
-- Mechanic Silence: Silence
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~256) WHERE `entry`=9056;
-- Mechanic Stun: Cheap Shot, Hammer of Justice, Charge Stun, Hammer of Justice, Revenge Stun, Intimidation
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9056;

-- Rage Talon Dragonspawn
-- Taunt: Taunt, Challenging Shout, Challenging Roar, Growl, Mocking Blow
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=9096;

-- Highlord Omokk
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=9196;
-- Mechanic Stun: Cheap Shot, Iron Grenade, Charge Stun, Hammer of Justice, Impact, Intercept Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9196;

-- Spirestone Battle Lord
-- Mechanic Stun: Charge Stun, Hammer of Justice, War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9218;

-- Spirestone Butcher
-- Mechanic Stun: Cheap Shot, Charge Stun, Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9219;

-- Shadow Hunter Vosh'gajin
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=9236;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Hammer of Justice, Impact, Starfire Stun, Intercept Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9236;

-- Houndmaster Grebmar
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=9319;
-- Mechanic Snare: Piercing Howl, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=9319;
-- Mechanic Stun: Charge Stun, Kidney Shot, War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9319;

-- Aquementas
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=9453;

-- Phalanx
-- Mechanic Snare: Chilled, Hamstring
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=9502;

-- Hurley Blackbreath
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=9537;
-- Mechanic Snare: Chilled, Piercing Howl, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=9537;
-- Mechanic Stun: Cheap Shot, Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9537;

-- Ribbly Screwspigot
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=9543;
-- Mechanic Snare: Chilled, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=9543;
-- Mechanic Stun: Cheap Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9543;

-- Overlord Wyrmthalak
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=9568;
-- Mechanic Stun: Charge Stun, Kidney Shot, Hammer of Justice, Revenge Stun, Intercept Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9568;

-- Quartermaster Zigris
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=9736;
-- Mechanic Fear: Intimidating Shout, Fear, Howl of Terror, Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=9736;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Impact, Revenge Stun, Concussion Blow, Starfire Stun, Intercept Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=9736;

-- Rage Talon Flamescale
-- Taunt: Taunt, Challenging Shout, Challenging Roar, Growl
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=10083;

-- Halycon
-- Mechanic Stun: Cheap Shot, Charge Stun, Hammer of Justice, Revenge Stun, Concussion Blow, Starfire Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10220;

-- Rookery Guardian
-- Taunt: Taunt
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=10258;

-- Solakar Flamewreath
-- Mechanic Stun: Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10264;
-- Taunt: Taunt
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=10264;

-- Gizrul the Slavener
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Hammer of Justice, Revenge Stun, Concussion Blow, Starfire Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10268;

-- Rage Talon Dragon Guard
-- Taunt: Taunt, Mocking Blow, Challenging Roar, Growl, Mocking Blow, Mocking Blow
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=10366;

-- Rage Talon Captain
-- Taunt: Taunt, Challenging Shout, Challenging Roar, Growl, Mocking Blow, Mocking Blow
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=10371;

-- Rage Talon Fire Tongue
-- Taunt: Taunt, Challenging Shout, Growl, Mocking Blow, Mocking Blow, Mocking Blow
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=10372;

-- Skeletal Guardian
-- Mechanic Disoriented: Blind
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=10390;

-- Skeletal Berserker
-- Mechanic Disoriented: Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=10391;

-- Skul
-- Mechanic Bleed: Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=10393;

-- Black Guard Sentry
-- Mechanic Polymorph: Discombobulate
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~65536) WHERE `entry`=10394;

-- Vectus
-- Mechanic Stun: Hammer of Justice, Revenge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10432;

-- Magistrate Barthilas
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=10435;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Hammer of Justice, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10435;

-- Chromatic Dragonspawn
-- Taunt: Taunt, Challenging Shout, Growl, Mocking Blow
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=10447;

-- Risen Construct
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=10488;

-- Risen Guard
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=10489;

-- Jandice Barov (HAS AURAS: Banish)
-- Mechanic Stun: Charge Stun, Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10503;

-- Lord Alexei Barov
-- Mechanic Stun: Charge Stun, Hammer of Justice, Revenge Stun, Starfire Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10504;

-- Instructor Malicia
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=10505;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Starfire Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10505;

-- The Ravenian
-- Mechanic Stun: Cheap Shot, Charge Stun, Hammer of Justice, Starfire Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10507;

-- Ras Frostwhisper
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Starfire Stun, Intercept Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10508;
-- Mechanic Bleed: Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=10508;

-- Jed Runewatcher
-- Mechanic Stun: Cheap Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10509;

-- The Unforgiven
-- Mechanic Stun: Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10516;

-- Hearthsinger Forresten
-- Mechanic Snare: Chilled, Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=10558;
-- Mechanic Stun: Cheap Shot, Charge Stun, Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10558;

-- Urok Doomhowl
-- Mechanic Stun: War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10584;

-- Mother Smolderweb
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=10596;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Pounce, Hammer of Justice, Impact, Revenge Stun, Concussion Blow
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10596;

-- Scryer
-- Taunt: Growl
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=10664;

-- Rookery Hatcher
-- Taunt: Taunt
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=10683;

-- Scalding Elemental
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=10756;
-- Mechanic Fear: Intimidating Shout, Psychic Scream, Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=10756;
-- Mechanic Stun: Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10756;

-- Boiling Elemental
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=10757;
-- Mechanic Stun: Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10757;

-- Timmy the Cruel
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=10808;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Revenge Stun, Concussion Blow, Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10808;

-- Chromatic Elite Guard
-- Taunt: Taunt, Challenging Shout, Growl, Mocking Blow
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=10814;

-- Wandering Skeleton
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=10816;

-- Lorekeeper Polkelt
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10901;

-- Darrowshire Defender
-- Mechanic Bleed: Rupture
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=10948;

-- Summoned Water Elemental
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=10955;
-- Mechanic Stun: Cheap Shot, Charge Stun, Revenge Stun, War Stomp, Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10955;

-- Fallen Hero
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=10996;

-- Cannon Master Willey
-- Mechanic Snare: Crippling Poison, Hallow's End Fright
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=10997;
-- Mechanic Stun: Cheap Shot, Charge Stun, Revenge Stun, Concussion Blow
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=10997;

-- Malor the Zealous
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Hammer of Justice, Intercept Stun, Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=11032;

-- Cauldron Lord Soulwrath
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=11078;

-- Spirit of Trey Lightforge
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=11141;
-- Mechanic Bleed: Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=11141;

-- Undead Postman
-- Mechanic Snare: Chilled, Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=11142;
-- Mechanic Stun: Cheap Shot, Hammer of Justice, Revenge Stun, Concussion Blow, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=11142;

-- Molten Elemental
-- Mechanic Root: Boar Charge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=11321;
-- Mechanic Stun: Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=11321;

-- Gurubashi Berserker
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=11352;

-- Gurubashi Champion
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1) WHERE `entry`=11356;
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=11356;
-- Mechanic Fear: Intimidating Shout, Fear, Psychic Scream, Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=11356;
-- Mechanic Root: Frostbite, Entrapment, Improved Wing Clip
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=11356;
-- Mechanic Snare: Concussive Shot, Piercing Howl, Chilled, Aftermath
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=11356;
-- Mechanic Freeze: Freezing Trap Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~4096) WHERE `entry`=11356;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=11356;
-- Mechanic Polymorph: Polymorph, Polymorph, Polymorph: Turtle, Polymorph: Pig
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~65536) WHERE `entry`=11356;

-- Petrified Treant
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=11458;

-- Ironbark Protector
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds, Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=11459;

-- Warpwood Guardian
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=11461;

-- Warpwood Treant
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=11462;

-- Warpwood Tangler
-- Mechanic Bleed: Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=11464;

-- Warpwood Stomper
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=11465;

-- Skeletal Highborne
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=11476;

-- Tendris Warpwood
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=11489;

-- Alzzin the Wildshaper
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=11492;

-- Ragnaros (HAS AURAS: Ragnaros Submerge Effect)
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=11502;

-- Rattlegore
-- Mechanic Stun: Cheap Shot, Kidney Shot, Hammer of Justice, Revenge Stun, Concussion Blow, Starfire Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=11622;

-- Molten Giant
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=11658;

-- Flamewaker
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=11661;

-- Flamewaker Priest
-- Mod Cast Speed: Curse of Tongues, Fang of the Crystal Spider
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~8) WHERE `entry`=11662;

-- Flamewaker Healer
-- Mechanic Stun: Cheap Shot, Kidney Shot, Bash, Hammer of Justice, Revenge Stun, Concussion Blow, Blackout, Intercept Stun, War Stomp, Intercept Stun, Earthshaker
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=11663;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=11663;
-- Mechanic Polymorph: Polymorph, Polymorph, Polymorph, Polymorph, Polymorph: Turtle, Polymorph: Pig
-- IMMUNE Polymorph: Polymorph, Polymorph, Polymorph: Pig
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~65536) WHERE `entry`=11663;

-- Lava Annihilator
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=11665;

-- Firelord
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=11668;

-- Flame Imp
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=11669;
-- Mechanic Snare: Earthbind, Concussive Shot, Chilled, Chilled, Piercing Howl, Chilled, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=11669;
-- Mechanic Stun: Cheap Shot, Iron Grenade, Big Iron Bomb, Mace Stun Effect, Charge Stun, Hammer of Justice, Impact, Revenge Stun, Concussion Blow, War Stomp, Intercept Stun, Earthshaker, Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=11669;
-- Mechanic Bleed: Garrote, Garrote, Rend, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=11669;

-- Captain Galvangar
-- Mechanic Stun: Mace Stun Effect, Charge Stun, Revenge Stun, Intercept Stun, Intercept Stun, Earthshaker
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=11947;

-- Captain Balinda Stonehearth
-- Mechanic Silence: Silence
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~256) WHERE `entry`=11949;
-- Mechanic Stun: Cheap Shot, Mace Stun Effect, Charge Stun, Concussion Blow, Intercept Stun, Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=11949;

-- Garr
-- Mechanic Bleed: Rupture, Garrote, Rend, Deep Wound, Deep Wounds, Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=12057;

-- Sulfuron Harbinger
-- Mod Cast Speed: Curse of Tongues, Fang of the Crystal Spider
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~8) WHERE `entry`=12098;

-- Lava Surger
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=12101;

-- Flamewaker Protector
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=12119;
-- Mechanic Bleed: Garrote, Rupture, Deep Wound, Deep Wounds, Rend
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=12119;

-- Onyxian Warder
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=12129;
-- Mechanic Stun: Cheap Shot, Iron Grenade, Mace Stun Effect, Charge Stun, Kidney Shot, Hammer of Justice, Impact, Revenge Stun, Concussion Blow, Blackout, Intercept Stun, War Stomp, Intercept Stun, Intercept Stun, Intimidation
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=12129;

-- Son of Flame
-- Mechanic Disoriented: Scatter Shot
-- IMMUNE Disoriented: Blind
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=12143;
-- Mechanic Fear: Intimidating Shout, Fear, Psychic Scream, Psychic Scream, Howl of Terror, Intimidating Shout
-- IMMUNE Fear: Howl of Terror
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=12143;

-- Barbed Lasher
-- Mechanic Bleed: Rend, Garrote, Garrote, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=12219;

-- Constrictor Vine
-- Mechanic Bleed: Garrote, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=12220;

-- Cavern Lurker
-- Mechanic Bleed: Garrote, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=12223;

-- Cavern Shambler
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=12224;

-- Razorlash
-- Mechanic Bleed: Garrote, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=12258;

-- Gehennas
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=12259;

-- Shazzrah
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=12264;

-- Death Talon Dragonspawn
-- Mechanic Freeze: Freezing Trap Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~4096) WHERE `entry`=12422;
-- Mechanic Knockout: Gouge, Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=12422;

-- Razorgore the Untamed
-- Mechanic Bleed: Rupture, Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=12435;

-- Blackwing Spellbinder (HAS AURAS: Spell Immunity)
-- Mechanic Disoriented: Scatter Shot
-- IMMUNE Disoriented: Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=12457;
-- Mechanic Snare: Piercing Howl
-- IMMUNE Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=12457;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Revenge Stun, Concussion Blow, Intercept Stun, War Stomp, Intercept Stun
-- IMMUNE Stun: Iron Grenade, Hammer of Justice, Hammer of Justice, Thorium Grenade
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=12457;
-- Mechanic Knockout: Gouge, Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=12457;

-- Blackwing Taskmaster
-- Mechanic Disoriented: Scatter Shot, Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=12458;
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=12458;
-- Mechanic Snare: Earthbind, Concussive Shot, Chilled, Piercing Howl, Chilled, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=12458;
-- Mechanic Stun: Cheap Shot, Hammer of Justice, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Revenge Stun, Concussion Blow, Blackout, Intercept Stun, War Stomp, Intercept Stun, Earthshaker
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=12458;

-- Blackwing Warlock
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=12459;

-- Death Talon Wyrmkin
-- Mechanic Disoriented: Scatter Shot, Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=12465;
-- Mechanic Fear: Intimidating Shout, Fear, Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=12465;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=12465;

-- Death Talon Hatcher
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=12468;

-- Axtroz (HAS AURAS: Immunity: Fire)
-- Taunt: Taunt
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=12899;

-- Somnus (HAS AURAS: Immunity: Nature)
-- Taunt: Taunt, Growl
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=12900;

-- Lorgus Jett
-- Mechanic Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1) WHERE `entry`=12902;
-- Mechanic Snare: Slow
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=12902;

-- Warpwood Crusher
-- Mechanic Bleed: Rupture, Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=13021;

-- Whip Lasher
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=13022;

-- Lieutenant Spencer
-- Mechanic Snare: Earthbind, Concussive Shot, Chilled, Chilled, Crippling Poison, Piercing Howl, Chilled, Chilled
-- IMMUNE Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=13138;

-- Deeprot Stomper
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=13141;

-- Deeprot Tangler
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=13142;

-- Phase Lasher
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=13196;

-- Fel Lash
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=13197;

-- Noxxion
-- Mechanic Bleed: Garrote, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=13282;

-- Death Lash
-- Mechanic Bleed: Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=13285;

-- Lieutenant Greywand
-- Mechanic Root: Frostbite, Improved Hamstring, Boar Charge
-- IMMUNE Root: Entangling Roots
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=13298;
-- Mechanic Snare: Earthbind, Concussive Shot, Chilled, Chilled, Crippling Poison, Piercing Howl, Curse of Exhaustion
-- IMMUNE Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=13298;

-- Noxxious Scion
-- School Frost: Frost Nova, Cone of Cold, Chilled
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` & ~16) WHERE `entry`=13696;

-- Corrupt Force of Nature
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=13743;

-- Blackwing Technician
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=13996;

-- Enraged Felguard
-- Mechanic Root: Frostbite
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=14101;
-- Mechanic Stun: Kidney Shot, Hammer of Justice, Revenge Stun, Concussion Blow, Blackout, Intercept Stun
-- IMMUNE Stun: Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=14101;

-- Green Drakonid
-- Mechanic Polymorph: Polymorph
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~65536) WHERE `entry`=14262;

-- Chromatic Drakonid
-- Mechanic Stun: Cheap Shot, Kidney Shot, Bash, Hammer of Justice, Revenge Stun, Concussion Blow, Intercept Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=14302;
-- Mechanic Bleed: Garrote, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=14302;

-- Petrified Guardian
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=14303;

-- Ferra
-- Mechanic Fear: Scare Beast
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=14308;

-- Cho'Rush the Observer
-- Mechanic Stun: Kidney Shot, Concussion Blow, War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=14324;

-- Pimgib
-- Mechanic Stun: Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=14349;

-- Pusillin
-- Mechanic Stun: Kidney Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=14354;

-- Arcane Torrent
-- School Nature: Earth Shock, Lightning Shield, Lightning Shield
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` & ~8) WHERE `entry`=14399;

-- Arcane Feedback
-- School Nature: Earth Shock
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` & ~8) WHERE `entry`=14400;

-- Master Elemental Shaper Krixix
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=14401;
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=14401;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Hammer of Justice, War Stomp, Intercept Stun, War Stomp
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=14401;
-- Mechanic Knockout: Gouge, Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=14401;
-- Mechanic Bleed: Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=14401;
-- Mechanic Polymorph: Polymorph
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~65536) WHERE `entry`=14401;

-- Prince Thunderaan
-- Taunt: Taunt, Growl
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=14435;

-- Thundering Invader
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=14462;

-- Scourge Footsoldier
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=14486;

-- Gurubashi Bat Rider
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=14750;

-- Sacrificed Troll
-- Mechanic Fear: Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=14826;

-- Blood Steward of Kirtonos
-- Mechanic Stun: Hammer of Justice
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=14861;

-- Emeriss (HAS AURAS: Summon Player)
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=14889;

-- Prince Skaldrenox
-- School Fire: Fireball, Fire Blast, Fire Blast, Scorch, Ignite, Searing Pain, Fireball, Firebolt
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` & ~4) WHERE `entry`=15203;
-- Taunt: Taunt, Challenging Roar, Growl
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=15203;

-- High Marshal Whirlaxis
-- Taunt: Taunt
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=15204;

-- Baron Kazum
-- Taunt: Taunt, Challenging Roar, Growl
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=15205;

-- Vekniss Stinger
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=15235;

-- Vekniss Wasp
-- Mechanic Root: Improved Wing Clip
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=15236;
-- Mechanic Snare: Concussive Shot, Piercing Howl, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=15236;
-- Mechanic Stun: Cheap Shot, Iron Grenade, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Impact, Revenge Stun, Concussion Blow, Blackout, Starfire Stun, Thorium Grenade, Intercept Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=15236;

-- Vekniss Hive Crawler
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=15240;

-- Anubisath Defender (HAS AURAS: Explode)
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=15277;

-- Lord Skwol
-- School Frost: Frostbolt
-- IMMUNE Frost: Chilled
UPDATE `creature_template` SET `school_immune_mask` = (`school_immune_mask` & ~16) WHERE `entry`=15305;
-- Taunt: Taunt, Challenging Shout, Growl
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=15305;

-- Hive'Zara Soldier
-- Mechanic Snare: Crippling Poison, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=15320;

-- Hive'Zara Sandstalker
-- Mechanic Snare: Crippling Poison, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=15323;

-- Qiraji Gladiator
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=15324;

-- Hive'Zara Wasp
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=15325;
-- Mechanic Snare: Concussive Shot, Crippling Poison, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=15325;

-- Hive'Zara Stinger
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=15327;

-- Obsidian Destroyer
-- Mechanic Bleed: Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=15338;

-- Qiraji Swarmguard
-- Mechanic Root: Entrapment
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~64) WHERE `entry`=15343;
-- Mechanic Snare: Concussive Shot, Crippling Poison, Chilled
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=15343;
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Hammer of Justice, Revenge Stun, Concussion Blow, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=15343;

-- Buru Egg
-- Mechanic Snare: Crippling Poison
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=15514;
-- Mechanic Stun: Charge Stun, Impact, Intercept Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=15514;

-- Battleguard Sartura (HAS AURAS: Whirlwind)
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=15516;
-- Mechanic Stun: Cheap Shot, Kidney Shot, Bash, Hammer of Justice, Impact, Revenge Stun, Concussion Blow, Blackout, Starfire Stun, Thorium Grenade, Intercept Stun, Intercept Stun
-- IMMUNE Stun: Kidney Shot, Bash, Hammer of Justice, Impact, Revenge Stun, Concussion Blow, Blackout, Starfire Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=15516;

-- Flesh Tentacle
-- Mechanic Disoriented: Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=15802;
-- Mechanic Bleed: Rupture, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=15802;

-- Qiraji Lieutenant
-- Mechanic Stun: Charge Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=15806;

-- Qiraji Officer Zod
-- Mechanic Stun: Charge Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=15813;

-- Thaddius
-- Taunt: Taunt, Challenging Shout, Growl
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=15928;

-- Grobbulus
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=15931;

-- Dread Creeper
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=15974;

-- Venom Stalker
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=15976;

-- Infectious Skitterer
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=15977;

-- Sartura's Royal Guard
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=15984;

-- Patchwork Golem
-- Mechanic Bleed: Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=16017;

-- Bile Retcher
-- Mechanic Bleed: Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=16018;

-- Mad Scientist
-- Mechanic Stun: Cheap Shot, Iron Grenade, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Mithril Frag Bomb, Hi-Explosive Bomb, Thorium Grenade, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=16020;

-- Stitched Spewer
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Intercept Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=16025;
-- Mechanic Bleed: Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=16025;

-- Patchwerk
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=16028;
-- Mechanic Fumble: Fumble
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~32) WHERE `entry`=16028;

-- Sludge Belcher
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Intercept Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=16029;
-- Mechanic Bleed: Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=16029;

-- Gothik the Harvester (HAS AURAS: Stun Self + Immune)
-- Taunt: Taunt, Challenging Shout, Growl, Mocking Blow
UPDATE `creature_template` SET `immunity_flags` = (`immunity_flags` & ~2) WHERE `entry`=16060;

-- Unrelenting Rider
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~4) WHERE `entry`=16126;
-- Mechanic Snare: Concussive Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=16126;

-- Shadow of Doom
-- Mechanic Disoriented: Blind, Scatter Shot, Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=16143;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=16143;

-- Deathknight Captain
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~4) WHERE `entry`=16145;

-- Bony Construct
-- Mechanic Snare: Concussive Shot, Piercing Howl
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1024) WHERE `entry`=16167;
-- Mechanic Shackle: Shackle Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~524288) WHERE `entry`=16167;

-- Stoneskin Gargoyle (HAS AURAS: Stoneskin)
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=16168;

-- Skeletal Smith
-- Mechanic Disarm: Disarm
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~4) WHERE `entry`=16193;
-- Mechanic Bleed: Garrote, Rend, Deep Wound, Deep Wounds
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16384) WHERE `entry`=16193;

-- Eye Stalk
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=16236;

-- Skeletal Shocktrooper
-- Mechanic Disoriented: Scatter Shot, Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=16299;

-- Sewage Slime
-- Mechanic Stun: Cheap Shot, Charge Stun, Kidney Shot, Bash, Hammer of Justice, Hi-Explosive Bomb, Thorium Grenade, Intercept Stun, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=16375;

-- Bone Witch
-- Mechanic Disoriented: Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=16380;

-- Deathchill Servant
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=16390;
-- Mechanic Shackle: Shackle Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~524288) WHERE `entry`=16390;

-- Soldier of the Frozen Wastes
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=16427;

-- Unstoppable Abomination
-- Mechanic Stun: Cheap Shot, Kidney Shot, Bash, Hammer of Justice, Hi-Explosive Bomb, Thorium Grenade, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=16428;

-- Guardian of Icecrown
-- Mechanic Disoriented: Blind, Scatter Shot
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=16441;
-- Mechanic Stun: Bash, Hammer of Justice, War Stomp, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=16441;
-- Mechanic Freeze: Freezing Trap Effect
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~4096) WHERE `entry`=16441;
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=16441;
-- Mechanic Shackle: Shackle Undead, Shackle Undead, Shackle Undead
-- IMMUNE Shackle: Shackle Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~524288) WHERE `entry`=16441;
-- Mechanic Turn: Turn Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~4194304) WHERE `entry`=16441;

-- Plagued Gargoyle (HAS AURAS: Stoneskin)
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=16446;

-- Plagued Deathhound
-- Mechanic Stun: Charge Stun, Intercept Stun
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2048) WHERE `entry`=16448;

-- Spirit of Naxxramas
-- Mechanic Disoriented: Scatter Shot, Glimpse of Madness
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~2) WHERE `entry`=16449;
-- Mechanic Shackle: Shackle Undead
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~524288) WHERE `entry`=16449;

-- Necro Stalker
-- Mechanic Distract: Distract
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8) WHERE `entry`=16453;

-- Naxxramas Worshipper (HAS AURAS: Mind Exhaustion)
-- Mechanic Charm: Mind Control
-- IMMUNE Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1) WHERE `entry`=16506;

-- Corpse Scarab
-- Mechanic Fear: Fear, Psychic Scream, Psychic Scream
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=16698;

-- Deathknight Understudy (HAS AURAS: Mind Exhaustion)
-- Mechanic Charm: Mind Control
-- IMMUNE Charm: Mind Control
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~1) WHERE `entry`=16803;

-- Plagued Champion
-- Mechanic Knockout: Gouge
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~8192) WHERE `entry`=16983;

-- Maexxna Spiderling
-- Mechanic Fear: Intimidating Shout
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` & ~16) WHERE `entry`=17055;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
