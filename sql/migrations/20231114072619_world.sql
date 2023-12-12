DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231114072619');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231114072619');
-- Add your query below.


-- Correct chat type for broadcast texts based on sniffs.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=494; -- Help! We're being attacked! Dark Irons!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=737; -- Where in the Outlands are those shipments? For days they keep me waiting!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=738; -- Stupidity! I'm surrounded by stupidity!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=739; -- Orcs are smarter than those couriers! Where the blazes are they?
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=854; -- You've plundered our treasures too long.  Prepare to meet your watery grave!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=855; -- Nothing will stop us!  You will die!
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=1017; -- I am slain!  Summon Verog!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=1040; -- There's the stolen shredder! Stop it or Lugwizzle will have our hides!
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=1072; -- $n coming right at us!
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=1073; -- Get this $n off of me!
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=1074; -- Help! $n attacking!
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=1075; -- $n heading this way fast! Time for revenge!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=1148; -- You there! Check out that noise.
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=1273; -- Attacked! Help get this $n off of me!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=1523; -- Me scared! Me run now!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=1905; -- I am here!  Come face me, if you dare!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=1932; -- Intruders at the Horn!  Don't let them escape!!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=1933; -- Kill the intruders!
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=2231; -- You will be easy prey, $C.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=2308; -- $N ran the Gauntlet!  Three cheers for $N!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=2359; -- You won't ruin my lands, you scum!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=2366; -- Kill her! Take the farm!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=3081; -- Malton, you dummy!
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=3562; -- Oh! I almost forgot! I slipped you a set of thieven' tools. You'll need those where you're going.
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=3799; -- Don't listen to that old fool, kid. He's like that with everyone. I've been watching you, though; you got real talent. Come have a talk with me.
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=3903; -- Come and have a talk with me if you're going to go to Gnomeregan, $N!
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=3934; -- What?! How dare you!
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=3936; -- The Defias shall succeed! No meek adventurer will stop us!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4390; -- You have returned to finish the job? <Lathoric laughs.> Obsidion rise and annihilate them!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4392; -- Obsidion rise and serve your master!
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=4435; -- We will enslave the quilboar!
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=4436; -- We will spread across this barren land!
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=4437; -- Soon, the Scourge will rule the world!
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=4440; -- Foolish mortal, I will rend your soul in two once I am released!
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=4441; -- You are an agent of their wicked god, fool.  I will see you destroyed!
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=4442; -- My soul is not a trinket!  Mortal, you must release me from these chains!
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=4443; -- It hurts so much... Itharius, my old friend... please help me...
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=4444; -- Will the nightmare ever end?!  I cannot force myself awake!
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=4445; -- My charge to watch the temple has failed... my corrupted soul knows no peace...
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4549; -- Who dares summon me?
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=4594; -- Leave this place. <The relic emits a white hot arc of flame. A memory has been gained: A lone Dark Iron dwarf is surrounded by seven corpses, kneeling before a monolith of flame.>
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=4595; -- You will perish here. <Your mind fills with visions of chaos and destruction.>
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=4596; -- Do not taint these ruins, mortal. <You are engulfed in a blinding flash of light. A creature composed entirely of flame is the only thing you can remember seeing.>
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=4597; -- Help us, outsider. <The relic crumbles to dust. A vision of eight Dark Iron dwarves performing some sort of ritual fills your head.>
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=4598; -- He cannot be defeated. <The relic burns to nothing. The memories it held are now your own. This city was destroyed by a being not of this world.>
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=4599; -- Your existence is acknowledged. <The relic turns to dust. Your head throbs with newfound wisdom. Something evil lurks in the heart of the mountain.>
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=4600; -- Defiler... you will be punished for this incursion. <A symbol of flame radiates from the relic before it crumbles to the earth.>
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=4613; -- That's it! That's what you were waiting for! KILL THEM!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4920; -- I am here!  Your rule of this land is over!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=4962; -- What are you doing?  Intruders!!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5053; -- Hey!  Get away from that!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5054; -- What are you doing over there?
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5055; -- No stealing the goods!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5060; -- That's it!  You're going down!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5268; -- Ha! Ha! Ha! Thank you for freeing me, fools. Now let me repay you by charring the flesh from your bones.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5271; -- You can't hide from us.  Prepare to burn!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5300; -- Violence!  Property damage!  None shall pass!!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5311; -- Thank you for clearing out those foolish senators.  Now prepare to meet your doom at the hands of Ragnaros' most powerful servant.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5312; -- Your efforts are utterly pointless, fools!  You will never be able to defeat me!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5313; -- They were just getting in the way anyways.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5314; -- Ha! You can't even begin to imagine the futility of your efforts.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5315; -- Is that the best you can do?  Do you really expect that you could defeat someone as awe inspiring as me?
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5389; -- HALT!  There were...reports...of a...disturbance.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5390; -- We...are...investigating.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5430; -- Emperor Thaurissan does not wish to be disturbed! Turn back now or face your doom, weak mortals!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5431; -- Hail to the king, baby!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5444; -- Haha! I bet you thought you were done!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5445; -- But your real punishment lies ahead.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5446; -- Good riddance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5457; -- Come to the aid of the Throne!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5538; -- Intruders are destroying our eggs!  Stop!!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5622; -- We're doomed!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5670; -- Curse you, mortal.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5675; -- You will learn of the sanctuary only death can offer...
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5676; -- It appears as if I will have to step in and take care of you myself.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5677; -- I will tear off your limbs and use them to beat you into submission!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5679; -- I can stand no more of this!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5710; -- The mortals have fallen! The new age of the Blackrock legion is at hand!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5712; -- WOOT!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5713; -- That will surely save me some work.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5714; -- I want those boots! Nobody touch that corpse!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5715; -- Consider yourself lucky, mortal. At least your corpse is still somewhat presentable.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5716; -- Do not consume the entire corpse just yet, children! Save room for dessert!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5717; -- Served!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5718; -- You actually believed that you stood a chance?
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=5832; -- You have summoned me, fool!  Now DIE!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6105; -- Hahah!  Revenge is mine!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6126; -- Rawww!  Urok is dead!!  Hahah!!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6150; -- TIMMY!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6185; -- Me smell stench of the living!
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=6274; -- Save me...
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6289; -- The Ash'ari Crystals have been destroyed! The Slaughterhouse is vulnerable!
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=6329; -- RAAAAAAAR!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6371; -- THIS CANNOT BE!!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6372; -- All hands to battle stations! Naga incoming!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6377; -- Move back and hold the line!  We cannot fail or all will be lost!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6398; -- So you see fit to toy with the Lich King's creations? Ramstein, be sure to give the intruders a proper greeting.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6401; -- Time to take matters into my own hands. Come. Enter my domain and challenge the might of the Scourge!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6415; -- Who dares disturb our master?
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=6422; -- I'm going to wear your skin as a smoking jacket! The stogies? You'll have to pry them from my cold dead... er... RAWR!!!!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6425; -- Ramstein hunger for flesh!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6436; -- The Scourge have broken into the Bastion!  Redouble your efforts!  We must not fail!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6441; -- Today you have unmade what took me years to create! For this you shall all die by my hand!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6447; -- You fools think you can defeat me so easily? Face the true might of the Nathrezim!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6466; -- BETRAYER!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6492; -- One of the Ash'ari Crystals has been destroyed!  Slay the intruders!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6526; -- An Ash'ari Crystal has fallen! Stay true to the Lich King, my brethren, and attempt to resummon it.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6527; -- An Ash'ari Crystal has been toppled! Restore the ziggurat before the Necropolis is vulnerable!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6554; -- The deeds are mine, brother! Soon you shall be out of my way for good!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6555; -- The fortune is mine, Alexi! Your end comes soon!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6883; -- What is this?!  How dare you!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=7203; -- Who dares to challenge me in my domain?!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7294; -- I'm here!  Come and get me you alliance pansies!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7295; -- Vanndar is here.  Come on, hordelings!  Show me what you got!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7296; -- The Frostwolf General is dead!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7297; -- The Stormpike General is dead!
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=7330; -- Eeck! Demons appear hungry for the kodos!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7561; -- Impossible! Stay your attack, mortals... I submit! I submit!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7566; -- The runes of warding have been destroyed! Hunt down the infidels, my brethren!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7567; -- Brashly, you have come to wrest the secrets of the Living Flame! You will soon regret the recklessness of your quest.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7568; -- I go now to summon the lord whose house this is. Should you seek an audience with him, your paltry lives will surely be forfeit! Nevertheless, seek out his lair, if you dare!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7612; -- Reckless mortals! None may challenge the Sons of the Living flame!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7626; -- DIE, INSECT!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7636; -- TOO SOON! YOU HAVE AWAKENED ME TOO SOON, EXECUTUS! WHAT IS THE MEANING OF THIS INTRUSION???
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7655; -- Impudent whelps! You've rushed headlong to your own deaths! See now, the master stirs!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7657; -- Behold Ragnaros - the Firelord! He who was ancient when this world was young! Bow before him, mortals! Bow before your ending!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7661; -- These mortal infidels, my lord! They have invaded your sanctum and seek to steal your secrets!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7662; -- FOOL! YOU ALLOWED THESE INSECTS TO RUN RAMPANT THROUGH THE HALLOWED CORE? AND NOW YOU LEAD THEM TO MY VERY LAIR? YOU HAVE FAILED ME, EXECUTUS! JUSTICE SHALL BE MET, INDEED!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7685; -- NOW FOR YOU, INSECTS! BOLDLY, YOU SOUGHT THE POWER OF RAGNAROS. NOW YOU SHALL SEE IT FIRSTHAND!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=7979; -- HELP! ASSASSINS HAVE COME TO KILL ME!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7980; -- I'm free!  That device shall never torment me again!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=8237; -- Dragon filth! Guards! Guards! Seize this monster!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8545; -- You think you've won already? Perhaps you'll need another lesson in pain!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8572; -- COME FORTH, MY SERVANTS! DEFEND YOUR MASTER!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8594; -- The Alliance has taken the Coldtooth Mine!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8595; -- The Alliance has taken the Irondeep Mine!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8596; -- The Horde has taken the Coldtooth Mine!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8597; -- The Horde has taken the Irondeep Mine!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8610; -- I come for you, puny Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8613; -- Soldiers of Frostwolf, come to my aid! The time has come to unleash the fury of the elements upon them!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8672; -- Yeee hawww! Mulverick's fleet is ready to rock. All able bodied Horde soldiers need request a beacon and try their damndest to plant it so that my War Riders can home in for the aerial assault.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8673; -- War Riders are now ready! Soldiers of the Horde, I need your assistance.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8674; -- Jeztor's Riders are ready! Soldiers of the Horde, report for duty!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8732; -- Stormpike soldiers, aid and protect us! The Forest Lord has granted us his protection. The gateway must now be opened!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8744; -- Seasoned units are entering the battle!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8745; -- Veteran units are entering the battle!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8746; -- Champion units are entering the battle!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8754; -- Seasoned units are taking to the field!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8755; -- Our veterans are entering the field!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8756; -- Our champion units are equipped!  Beware, alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8773; -- You're going down, Mulv!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8791; -- Soldiers of Stormpike, come to my aid! The beacon must be planted.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8794; -- My flight is ready! Soldiers come to my aid!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8797; -- Their spirits are restored! The gryphons are ready to strike! Come, soldiers! Come to my side!
UPDATE `broadcast_text` SET `chat_type`=0 WHERE `entry`=8852; -- Mine! Mine! Mine!  Gizlock is the ruler of this domain!  You shall never reveal my presence!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=8888; -- RARRRRRR!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8900; -- The stable is empty! We must provide our cavalry with suitable mounts. Stormpike Stables requests your assistance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=8922; -- Free! Free from my bonds at last!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9057; -- The Stormpike Graveyard was taken by the Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9058; -- The Stormpike Graveyard is under attack!  If left unchecked, the Alliance will capture it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9059; -- The Stormpike Graveyard was taken by the Horde!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9060; -- The Stormpike Graveyard is under attack!  If left unchecked, the Horde will capture it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9061; -- The Snowfall Graveyard was taken by the Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9062; -- The Snowfall Graveyard is under attack!  If left unchecked, the Alliance will capture it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9063; -- The Snowfall Graveyard was taken by the Horde!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9064; -- The Snowfall Graveyard is under attack!  If left unchecked, the Horde will capture it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9065; -- The Frostwolf Graveyard was taken by the Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9066; -- The Frostwolf Graveyard is under attack!  If left unchecked, the Alliance will capture it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9067; -- The Frostwolf Graveyard was taken by the Horde!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9068; -- The Frostwolf Graveyard is under attack!  If left unchecked, the Horde will capture it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9104; -- At last... Freed from his cursed grasp!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9174; -- The Dun Baldar South Bunker is under attack!  If left unchecked, the Horde will destroy it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9175; -- The Dun Baldar South Bunker was destroyed by the Horde!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9177; -- The Dun Baldar South Bunker was taken by the Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9178; -- The Dun Baldar North Bunker is under attack!  If left unchecked, the Horde will destroy it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9179; -- The Dun Baldar North Bunker was destroyed by the Horde!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9181; -- The Dun Baldar North Bunker was taken by the Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9182; -- The Icewing Bunker is under attack!  If left unchecked, the Horde will destroy it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9183; -- The Icewing Bunker was destroyed by the Horde!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9185; -- The Icewing Bunker was taken by the Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9186; -- The Stonehearth Bunker is under attack!  If left unchecked, the Horde will destroy it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9187; -- The Stonehearth Bunker was destroyed by the Horde!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9189; -- The Stonehearth Bunker was taken by the Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9195; -- The East Frostwolf Tower was taken by the Horde!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9196; -- The East Frostwolf Tower is under attack!  If left unchecked, the Alliance will destroy it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9197; -- The East Frostwolf Tower was destroyed by the Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9199; -- Tower Point was taken by the Horde!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9200; -- Tower Point is under attack!  If left unchecked, the Alliance will destroy it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9201; -- Tower Point was destroyed by the Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9203; -- Iceblood Tower was taken by the Horde!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9204; -- Iceblood Tower is under attack!  If left unchecked, the Alliance will destroy it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9205; -- Iceblood Tower was destroyed by the Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9211; -- The Stormpike Aid Station was taken by the Horde!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9212; -- The Stormpike Aid Station is under attack!  If left unchecked, the Horde will capture it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9213; -- The Stormpike Aid Station was taken by the Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9214; -- The Stormpike Aid Station is under attack!  If left unchecked, the Alliance will capture it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9215; -- The Frostwolf Relief Hut was taken by the Horde!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9216; -- The Frostwolf Relief Hut is under attack!  If left unchecked, the Horde will capture it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9217; -- The Frostwolf Relief Hut was taken by the Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9218; -- The Frostwolf Relief Hut is under attack!  If left unchecked, the Alliance will capture it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9221; -- The Stonehearth Graveyard was taken by the Horde!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9222; -- The Stonehearth Graveyard is under attack!  If left unchecked, the Horde will capture it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9223; -- The Stonehearth Graveyard was taken by the Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9224; -- The Stonehearth Graveyard is under attack!  If left unchecked, the Alliance will capture it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9225; -- The Iceblood Graveyard was taken by the Horde!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9226; -- The Iceblood Graveyard is under attack!  If left unchecked, the Horde will capture it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9227; -- The Iceblood Graveyard was taken by the Alliance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9228; -- The Iceblood Graveyard is under attack!  If left unchecked, the Alliance will capture it!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9425; -- Ashes to ashes!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9426; -- BY FIRE BE PURGED!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9427; -- TASTE THE FLAMES OF SULFURON!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9478; -- Help me crush these punys!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=9504; -- Woohoo! They are into it now!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=9572; -- My power is discombobulatingly devastating! It is ludicrous that these mortals even attempt to enter my realm!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9591; -- If I fall into the abyss, I'll take all of you mortals with me!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9705; -- Ah, freedom!  Although brief, so sweet it is...
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9727; -- Who dares steal my precious mount?  You will pay for your insolence, mortal!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9784; -- ENOUGH - this ends now!  You fools will be added to my bone collection!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9794; -- Ah...the heroes. You are persistent, aren't you? Your ally here attempted to match his power against mine - and paid the price. Now he shall serve me...by slaughtering you. 
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9844; -- Get up, little red wyrm...and destroy them!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9867; -- NEFARIAN IS SLAIN! People of Orgrimmar, bow down before the might of $N and $g his:her; allies for they have laid a blow against the Black Dragonflight that is sure to stir the Aspects from their malaise! This defeat shall surely be felt by the father of the Black Flight: Deathwing reels in pain and anguish this day!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9868; -- Be lifted by $N's accomplishment! Revel in $g his:her; rallying cry!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9870; -- Citizens of the Alliance, the Lord of Blackrock is slain! Nefarian has been subdued by the combined might of $n and $g his:her; allies!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9872; -- Let your spirits rise! Rally around your champion, bask in $g his:her; glory! Revel in the rallying cry of the dragon slayer!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9886; -- Too late, friends! Nefarius' corruption has taken hold...I cannot...control myself.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9887; -- I beg you, mortals - FLEE! Flee before I lose all sense of control! The black fire rages within my heart! I MUST- release it! 
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9888; -- FLAME! DEATH! DESTRUCTION! Cower, mortals before the wrath of Lord...NO - I MUST fight this! Alexstrasza help me, I MUST fight it! 
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9961; -- You'll pay for forcing me to do this!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9962; -- Fools! These eggs are more precious than you know!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9963; -- No - not another one! I'll have your heads for this atrocity!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9964; -- Forgive me, $N! Your death only adds to my failure! 
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9965; -- Nefarius' hate has made me stronger than ever before! You should have fled while you could, mortals! The fury of Blackrock courses through my veins! 
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9967; -- None of your kind should be here!  You've doomed only yourselves!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10001; -- Reporting for duty!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10024; -- I am here!  And the Irondeep Mine is... MINE!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10026; -- Let the coils of hate unfurl!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10027; -- Lord Hir'eek, grant me wings of vengeance!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10356; -- I'm coming Frostwolf, and this time you're gonna feel the flames!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10369; -- I command you to rain fire down upon these invaders!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10443; -- Shadra, make of me your avatar!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10444; -- The brood shall not fall!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10446; -- I'll feed your souls to Hakkar himself!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10447; -- PRIDE HERALDS THE END OF YOUR WORLD.  COME, MORTALS!  FACE THE WRATH OF THE SOULFLAYER!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10448; -- Aid me my brood!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10450; -- At last, I am free of the Soulflayer!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10451; -- Hakkar binds me no more!  Peace at last!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10452; -- Finally...death!  Curse you, Hakkar!  Curse you!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10455; -- Shirvallah, fill me with your RAGE!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=10457; -- Blood and souls for Hakkar!  HAHAHAH!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10459; -- Bless you, mortals, for this release...Hakkar controls me no longer!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10460; -- Ssserenity...at lassst!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10461; -- Bethekk, your priestess calls upon your might!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10472; -- Feast on $N, my pretties!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10480; -- Do not be lured into the mortals' trap.  Bathe in my power!  Be renewed and destroy the heretics!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10505; -- DING!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10507; -- Your deaths feed my strength!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10546; -- Minions of Hakkar, hear your God. The sanctity of this temple has been compromised. Invaders encroach upon holy ground! The Altar of Blood must be protected. Kill them all!
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=10579; -- I am released through you! Avenge me!
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=10586; -- You will suffer eternally, $r.
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=10588; -- You will make a fitting sacrifice.
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=10589; -- Surrender your soul, mortal.
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=10590; -- The world will suffer immeasurable cruelties under my reign.
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=10591; -- Your gods can't save you now, $c.
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=10592; -- The Primal Gods serve Hakkar. Turn back now, you stand no chance.
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=10593; -- Pledge your allegiance to Hakkar and the pain you suffer shall be minimal.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10594; -- You dare set foot upon Hakkari holy ground? Minions of Hakkar, destroy the infidels!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10604; -- $n! I'm watching you!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10605; -- You've angered me for the last time $n!
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=10628; -- Don't make me angry! You wouldn't like me when I'm angry!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10635; -- Fleeing will do you no good, mortals!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=10805; -- Your treachery only speeds your doom.  This world will fall to darkness!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=10806; -- You dare!  Outrageous!  I curse you, $c.  I curse you with... death!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=10807; -- What?  Such a small, frail thing beckons me?  I shall add your bones to my throne, $r!!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=10810; -- Killing you and your cohorts, $c, will amuse me.  I shall make it quick.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=10881; -- Come forth, ye Dreamers - and claim your vengeance!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=10882; -- Your wicked souls shall feed my power!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=10883; -- I can sense the SHADOW on your hearts. There can be no rest for the wicked!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=10884; -- Taste your world's corruption!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=10885; -- Hope is a DISEASE of the soul! This land shall wither and die!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=10886; -- Peace is but a fleeting dream! Let the NIGHTMARE reign!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=10887; -- Children of Madness - I release you upon this world!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=10888; -- Come, puny mortals. Come and face your end. The secrets of Ahn'Qiraj will die with Roman'khan!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10901; -- Let them feel the wrath of the Blue Flight! May Malygos protect me!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10902; -- Alexstrasza grant me the resolve to drive our enemies back!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10903; -- Succumb to the endless dream, little ones. Let it consume you!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11009; -- Kill $N!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11356; -- Look alive, lads!  The enemy has been sighted!  Form ranks immediately!
UPDATE `broadcast_text` SET `chat_type`=7 WHERE `entry`=11424; -- %s hears the call to battle and rises to serve its master.
UPDATE `broadcast_text` SET `chat_type`=7 WHERE `entry`=11425; -- %s casts its massive shadow upon the whole of Silithus.
UPDATE `broadcast_text` SET `chat_type`=7 WHERE `entry`=11426; -- %s breaks free of its cocoon beneath Hive'Ashi.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11442; -- You will be judged for defiling these sacred grounds!  The laws of the Ancients will not be challenged!  Trespassers will be annihilated!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11443; -- I sentence you to death!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11444; -- I serve to the last!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11445; -- Are you so eager to die? I will be happy to accommodate you...
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11446; -- Let your death serve as an example!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11447; -- You only delay the inevitable!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11449; -- Sands of the desert, rise and block out the sun!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11450; -- You are terminated.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11451; -- I...have...failed. 
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11452; -- My brother, no!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11453; -- You will not escape death!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11454; -- Vek'lor, I feel your pain!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11455; -- Your fate is sealed!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11536; -- Colossals on the rise! At least 10 units strong! INCOMING FROM THE SOUTH!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11538; -- HOLD THE LINE! LET NOTHING THROUGH!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11611; -- Qiraji War Party spotted!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11612; -- Sandstorm coming from the south, take co...That's no sandstorm! INCOMING QIRAJI ARMY!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11613; -- Invaders approaching from the south!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11614; -- Crush them all!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11615; -- The Might of Kalimdor will halt their advances!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11616; -- Soldiers of Kalimdor, defend the base!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11646; -- ONWARD! TO AHN'QIRAJ!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11648; -- Face the Might of Kalimdor!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11651; -- The battle is won! Watch as they flee to the safety of their precious temple. Soon all will be razed... Their leaders destroyed!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11702; -- Only flesh and bone. Mortals are such easy prey...
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11706; -- Where are your manners, brother. Let us properly welcome our guests.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11707; -- There will be pain...
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11708; -- Oh so much pain...
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11709; -- Come, little ones.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11710; -- The feast of souls begins now...
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11727; -- You do not belong here!  Ancients, rise against these intruders!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11812; -- Intruders!  More pawns of the Argent Dawn, no doubt.  I already count one of their number among my prisoners.  Withdraw from my domain before she is executed!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11813; -- You're still here?  Your foolishness is amusing!  The Argent Dawn wench needn't suffer in vain.  Leave at once and she shall be spared!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11814; -- May this prisoner's death serve as a warning.  None shall defy the scourge and live!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11815; -- I shall take great pleasure in taking this poor wretch's life!  It's not too late, she needn't suffer in vain.  Turn back and her death shall be merciful!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11816; -- Don't worry about me!  Slay this dreadful beast and cleanse this world of his foul taint!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11817; -- My death means nothing.... light... will... prevail!
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=11929; -- Use your tonk action bar above your standard action bar to attack other tonks.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12310; -- To arms!  Scourge spotted in the Cathedral of Light!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12311; -- Scourge in the Trade District!  Have at them!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12325; -- We come destroy puny ones!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12326; -- Kel'Thuzad say to tell you... DIE!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12327; -- Raaarrrrggghhh!  We come for you!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12328; -- Hahaha, your guards no match for Scourge!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12329; -- What?  This not Naxxramas!  We not like this place... destroy!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12330; -- You spare parts!  We make more Scourge in necropolis.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12331; -- The Scourge attack against my court has been eliminated.  You may go about your business.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12332; -- My Royal Dreadguard, you will deal with this matter as befits your station.  That, or you will wish that you had.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12333; -- Dreadguard, hold your line.  Halt the advance of those Scourge!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12334; -- Scourge in sewers!  We need help!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12335; -- Scourge attack Magic Quarter!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12336; -- Rogues' Quarter attacked by Scourge!  Help!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12337; -- The Scourge are at the entrance to the Royal Quarter!  Kill them!!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12342; -- Why you run away? We make your corpse into Scourge.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12343; -- No worry, we find you.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12353; -- There Scourge outside Trade Quarter!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12354; -- Scourge inside Trade Quarter!  Destroy!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=12993; -- Come, heroes... By the will of the Lich King, you shall be destroyed.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=13030; -- Foolishly you have sought your own demise.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=13040; -- I'm gonna' enjoy killin' these slack-jawed daffodils!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=13097; -- Flee, before it's too late!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13121; -- Can you feel it, pathetic creatures? The pall over this land is but a precursor. Soon your precious holdings will be in our grasp! You will fall before the might of the Scourge!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13122; -- Despair, mortals! Your doom has come!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13123; -- Let this gloom serve to remind you: the shadow of the Scourge is all-encompassing! There is no escape!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13124; -- As you fall in battle, we continue to grow in strength. There is only one inevitable outcome. Prepare for your end!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13125; -- Forward, my minions! Forward! Let none stand in our way!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13126; -- Cower before our might! Flee! There will be no victory for the living!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13163; -- So, the frail members of the living have some teeth after all. Take this place, then, for the time being. We will return, twice as strong, and your paltry forces will fall!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13164; -- You dare disrupt our works here?! The master will not be pleased. Take this time to prepare yourselves... when we return, there will be nothing but death and destruction in our wake!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13165; -- You may think you have won, worms, but against the might of the Scourge there is no victory for the living! You have not seen the last of us!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13169; -- Do you truly believe you are doing well? Hah! Our numbers are limitless!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13170; -- You may succeed on the field of battle briefly... but you cannot hope to win against the Scourge!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13172; -- You've reclaimed a few paltry territories. Pathetic. In short order they will again be ours!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13173; -- Do you truly believe you're making progress? You can never defeat the Scourge! These small victories are nothing more than a ploy to make you overconfident!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13174; -- Think you the master is daunted by your games? We will never fall to you!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13175; -- You fools! Keep fighting, if that is your wish! With every battle, more of you fall, and the ranks of the undead swell!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13176; -- The toils of the living never cease to amaze. Your numbers are limited, and with every battle they dwindle further. You will not live to see the end!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13177; -- Do you truly believe you can win against the armies of Kel'Thuzad? No army of the living, no power you could possibly bring to bear can destroy our ranks!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13178; -- This constant, annoying resistance is futile, you maggots! There will be nothing in the end but death!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13469; -- Victory for the Horde!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13470; -- We've done it!  Victory to the Alliance!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13476; -- We have one quarter of our needed silithyst! Keep it up!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=13481; -- We have almost all the silithyst we need!  Don't stop now!
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=13492; -- Your petty magics are no challenge to the might of the Scourge!

-- Remove no longer needed duplicated texts in custom table.
DELETE FROM `script_texts` WHERE `entry` IN (-1000009, -1000016, -1000017);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
