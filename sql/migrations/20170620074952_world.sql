INSERT INTO `migrations` VALUES ('20170620074952'); 

-- Undertaker Mordo should do talk emote when offering quest Rude Awakening
-- https://youtu.be/kyhxG73DG5g?t=3m44s
-- https://youtu.be/HnzCVFXPYl4?t=33s
-- Shadow Priest Sarvis should do talk emote when turning in quest Rude Awakening
-- https://youtu.be/kyhxG73DG5g?t=4m22s
-- https://youtu.be/HnzCVFXPYl4?t=1m20s
-- https://youtu.be/Tyc3S-Bl8oU?t=59s
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=363;

-- Shadow Priest Sarvis should do talk emote when offering quest Rattling the Rattlecages
-- https://youtu.be/6RReH-yCSlI?t=6m15s
-- https://youtu.be/HnzCVFXPYl4?t=4m23s
-- https://youtu.be/lqON1WXX7b8?t=1m17s
-- Shadow Priest Sarvis should do talk emote when turning in quest Rattling the Rattlecages
-- https://youtu.be/daRPncc5lmw?t=39s
-- https://youtu.be/HnzCVFXPYl4?t=12m5s
-- https://youtu.be/lqON1WXX7b8?t=2m48s
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=3901;

-- Shadow Priest Sarvis should do talk emote when offering quest Glyphic Scroll
-- https://youtu.be/lqON1WXX7b8?t=1m15s
-- Isabella should do talk emote when turning in quest Glyphic Scroll
-- https://youtu.be/lqON1WXX7b8?t=1m21s
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=3098;

-- Shadow Priest Sarvis should do talk emote when offering quest Tainted Scroll
-- https://youtu.be/6RReH-yCSlI?t=6m10s
-- https://youtu.be/HnzCVFXPYl4?t=4m21s
-- Maximillion should do bow emote on completed quest Tainted Scroll
-- https://youtu.be/6RReH-yCSlI?t=6m21s
-- https://youtu.be/HnzCVFXPYl4?t=4m33s
-- Maximillion should do talk emote when turning in quest Tainted Scroll
-- https://youtu.be/6RReH-yCSlI?t=6m22s
-- https://youtu.be/HnzCVFXPYl4?t=4m34s
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1, `CompleteEmote`=2 WHERE `entry`=3099;

-- Novice Elreth should not do an emote on completed quest The Damned
-- https://youtu.be/daRPncc5lmw?t=32s
-- https://youtu.be/HnzCVFXPYl4?t=12m10s
-- https://youtu.be/lqON1WXX7b8?t=2m44s
-- Novice Elreth should do talk emote when turning in quest The Damned
-- https://youtu.be/daRPncc5lmw?t=33s
-- https://youtu.be/HnzCVFXPYl4?t=12m12s
-- https://youtu.be/lqON1WXX7b8?t=2m44s
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=376;

-- Novice Elreth should do talk emote when offering quest Marla's Last Wish
-- https://youtu.be/daRPncc5lmw?t=42s
-- https://youtu.be/HnzCVFXPYl4?t=12m16s
-- https://youtu.be/lqON1WXX7b8?t=2m54s
-- Novice Elreth should do talk emote on incomplete quest Marla's Last Wish
-- https://youtu.be/HnzCVFXPYl4?t=12m44s
UPDATE `quest_template` SET `DetailsEmote1`=1, `IncompleteEmote`=1 WHERE `entry`=6395;

-- Executor Arrem should do talk emote when offering quest Night Web's Hollow
-- https://youtu.be/daRPncc5lmw?t=1m4s
-- https://youtu.be/HnzCVFXPYl4?t=13m17s
-- https://youtu.be/lqON1WXX7b8?t=3m6s
-- Executor Arrem should do talk emote when turning in quest Night Web's Hollow
-- https://youtu.be/-tmQbAhtUKk?t=3s
-- https://youtu.be/szkQnIWpTVE?t=8m21s
-- https://youtu.be/lqON1WXX7b8?t=5m46s
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=380;

-- Deathguard Saltain should do shout emote when offering quest Scavenging Deathknell
-- https://youtu.be/daRPncc5lmw?t=1m47s
-- https://youtu.be/lqON1WXX7b8?t=3m7s
-- Deathguard Saltain should not do an emote on completed quest Scavenging Deathknell
-- https://youtu.be/daRPncc5lmw?t=4m35s
-- https://youtu.be/lqON1WXX7b8?t=5m44s
UPDATE `quest_template` SET `DetailsEmote1`=5, `CompleteEmote`=0 WHERE `entry`=3902;

-- Executor Arrem should do talk emote when offering quest The Scarlet Crusade
-- https://youtu.be/-tmQbAhtUKk?t=8s
-- https://youtu.be/szkQnIWpTVE?t=8m24s
-- https://youtu.be/lqON1WXX7b8?t=5m47s
-- Executor Arrem should do laugh emote when turning in quest The Scarlet Crusade
-- https://youtu.be/-tmQbAhtUKk?t=6m13s
-- https://youtu.be/TE3lvcL4ZhQ?t=2m8s
-- https://youtu.be/lqON1WXX7b8?t=7m9s
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=11 WHERE `entry`=381;

-- Executor Arrem should do talk emote when offering quest The Red Messenger
-- https://youtu.be/-tmQbAhtUKk?t=6m15s
-- https://youtu.be/TE3lvcL4ZhQ?t=2m14s
-- https://youtu.be/lqON1WXX7b8?t=7m11s
-- Executor Arrem should do shrug emote on completed quest The Red Messenger
-- https://youtu.be/-tmQbAhtUKk?t=7m48s
-- https://youtu.be/TE3lvcL4ZhQ?t=4m39s
-- https://youtu.be/lqON1WXX7b8?t=7m29s
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6 WHERE `entry`=382;

-- Deathguard Simmer should do shrug emote followed by a talk emote when offering quest Fields of Grief
-- https://youtu.be/-tmQbAhtUKk?t=9m34s
-- https://youtu.be/TE3lvcL4ZhQ?t=6m42s
-- https://youtu.be/lqON1WXX7b8?t=9m11s
-- Apothecary Johaan should do shrug emote on completed quest Fields of Grief
-- https://youtu.be/DhTYPNsiKk4?t=6m5s
-- https://youtu.be/TE3lvcL4ZhQ?t=13m11s
-- https://youtu.be/yvAjZ-wChsE?t=1m22s
-- Apothecary Johaan should do shrug emote on incomplete quest Fields of Grief
-- https://youtu.be/nndHLdcV414?t=5m41s
-- Apothecary Johaan should do talk emote when turning in quest Fields of Grief
-- https://youtu.be/DhTYPNsiKk4?t=6m7s
-- https://youtu.be/TE3lvcL4ZhQ?t=13m14s
-- https://youtu.be/yvAjZ-wChsE?t=1m22s
UPDATE `quest_template` SET `DetailsEmote1`=6, `DetailsEmote2`=1, `IncompleteEmote`=6, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=365;

-- Executor Zygand should not do an emote on completed quest Vital Intelligence
-- https://youtu.be/nndHLdcV414?t=3m16s
-- https://youtu.be/TE3lvcL4ZhQ?t=13m30s
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=383;

-- Executor Zygand should do talk emote when offering quest At War With The Scarlet Crusade 1
-- https://youtu.be/nndHLdcV414?t=3m30s
-- https://youtu.be/TE3lvcL4ZhQ?t=13m33s
-- Executor Zygand should do talk emote when turning in quest At War With The Scarlet Crusade 1
-- https://youtu.be/DhTYPNsiKk4?t=6m21s
-- https://youtu.be/CVeijybDMN0?t=7m39s
-- https://youtu.be/yvAjZ-wChsE?t=54s
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=427;

-- Apothecary Johaan should do two talk emotes when offering quest A New Plague
-- https://youtu.be/nndHLdcV414?t=5m35s
-- https://youtu.be/TE3lvcL4ZhQ?t=13m19s
-- Apothecary Johaan should do shout emote on completed quest A New Plague
-- https://youtu.be/DhTYPNsiKk4?t=5m53s
-- https://youtu.be/CVeijybDMN0?t=7m21s
-- https://youtu.be/yvAjZ-wChsE?t=1m17s
-- Apothecary Johaan should do talk emote when turning in quest A New Plague
-- https://youtu.be/DhTYPNsiKk4?t=5m55s
-- https://youtu.be/CVeijybDMN0?t=7m23s
-- https://youtu.be/yvAjZ-wChsE?t=1m18s
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `CompleteEmote`=5, `OfferRewardEmote1`=1 WHERE `entry`=367;

-- Apothecary Johaan should do talk emote when offering quest A New Plague 2
-- https://youtu.be/DhTYPNsiKk4?t=5m57s
-- https://youtu.be/CVeijybDMN0?t=7m24s
-- https://youtu.be/yvAjZ-wChsE?t=1m19s
-- Apothecary Johaan should do shrug emote on completed quest A New Plague 2
-- https://youtu.be/QbvS_IUmc0k?t=4m7s (no emote here?)
-- https://youtu.be/2RVY-5mnsvc?t=4m49s
-- Apothecary Johaan should do clap emote when turning in quest A New Plague 2
-- https://youtu.be/QbvS_IUmc0k?t=4m8s
-- https://youtu.be/2RVY-5mnsvc?t=4m56s
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=21 WHERE `entry`=368;

-- Apothecary Johaan should do two talk emotes when offering quest A New Plague 3
-- https://youtu.be/QbvS_IUmc0k?t=4m9s
-- https://youtu.be/2RVY-5mnsvc?t=4m57s
-- Apothecary Johaan should do shrug emote on completed quest A New Plague 3
-- https://youtu.be/Bc1AyT9ATY8?t=4s
-- https://youtu.be/xnGt1ZzZhO0?t=3m49s
-- Apothecary Johaan should do clap emote when turning in quest A New Plague 3
-- https://youtu.be/Bc1AyT9ATY8?t=6s
-- https://youtu.be/xnGt1ZzZhO0?t=3m51s
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `CompleteEmote`=6, `OfferRewardEmote1`=21 WHERE `entry`=369;

-- Junior Apothecary Holland should not do an emote on completed quest Gordo's Task
-- https://youtu.be/nndHLdcV414?t=6m8s
-- https://youtu.be/CVeijybDMN0?t=10m21s
-- https://youtu.be/lqON1WXX7b8?t=9m48s
-- Junior Apothecary Holland should do shrug emote when turning in quest Gordo's Task
-- https://youtu.be/nndHLdcV414?t=6m10s
-- https://youtu.be/CVeijybDMN0?t=10m23s
-- https://youtu.be/lqON1WXX7b8?t=9m49s
UPDATE `quest_template` SET `OfferRewardEmote1`=6, `CompleteEmote`=0 WHERE `entry`=5481;

-- Junior Apothecary Holland should do talk emote when offering quest Doom Weed
-- https://youtu.be/nndHLdcV414?t=6m12s
-- https://youtu.be/CVeijybDMN0?t=10m24s
-- https://youtu.be/lqON1WXX7b8?t=9m49s
-- Junior Apothecary Holland should do shrug emote on completed quest Doom Weed
-- https://youtu.be/lirB-0kLG4A?t=1m42s
-- https://youtu.be/2RVY-5mnsvc?t=5m30s
-- Junior Apothecary Holland should do talk emote when turning in quest Doom Weed
-- https://youtu.be/2RVY-5mnsvc?t=5m31s
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=5482;

-- Calvin Montague should do shrug, talk and rude emote when offering quest A Rogue's Deal 2
-- https://youtu.be/5CjYDkAUPy0?t=2m53s
-- https://youtu.be/lqON1WXX7b8?t=8m9s
-- Calvin Montague should do roar emote when turning in quest A Rogue's Deal 2
-- https://youtu.be/5CjYDkAUPy0?t=3m44s
-- https://youtu.be/lqON1WXX7b8?t=8m51s (no emote?)
UPDATE `quest_template` SET `DetailsEmote1`=6, `DetailsEmote2`=1, `DetailsEmote3`=14, `OfferRewardEmote1`=15 WHERE `entry`=590;

-- Coleman Farthing should not do an emote on completed quest Deaths in the Family
-- https://youtu.be/z_e5jkcrf7w?t=54s
-- https://youtu.be/O9l3KDibCiM?t=3m40s
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=354;

-- Coleman Farthing should not do an emote on completed quest The Haunted Mills
-- https://youtu.be/z_e5jkcrf7w?t=57s
-- https://youtu.be/O9l3KDibCiM?t=3m43s
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=362;

-- Cain Firesong should do a talk emote when offering quest Speak with Anastasia
-- https://youtu.be/O9l3KDibCiM?t=3m54s
-- Anastasia Hartwell should do talk emote when turning in quest Speak with Anastasia
-- https://youtu.be/xnGt1ZzZhO0?t=9m1s
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=1881;

-- Executor Zygand should do talk emote when offering quest At War With The Scarlet Crusade 2
-- https://youtu.be/DhTYPNsiKk4?t=6m25s
-- https://youtu.be/CVeijybDMN0?t=7m41s
-- https://youtu.be/yvAjZ-wChsE?t=56s
-- Executor Zygand should do talk emote when turning in quest At War With The Scarlet Crusade 2
-- https://youtu.be/6_fOYjfh5eI?t=5m41s
-- https://youtu.be/39mYbNh0E9g?t=26s
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=370;

-- Executor Zygand should do shout emote when offering quest At War With The Scarlet Crusade 3
-- https://youtu.be/6_fOYjfh5eI?t=5m45s
-- Executor Zygand should do talk emote when turning in quest At War With The Scarlet Crusade 3
-- https://youtu.be/uylVam8EdFw?t=4m36s
-- https://youtu.be/xnGt1ZzZhO0?t=3m37s
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmoteDelay1`=3000, `OfferRewardEmote1`=1 WHERE `entry`=371;

-- Executor Zygand should do talk emote when turning in quest At War With The Scarlet Crusade 4
-- https://youtu.be/Bc1AyT9ATY8?t=27s
-- https://youtu.be/mBNLMELmCOY?t=6m42s
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=372;

-- Gretchen Dedmar should not do an emote on completed quest The Chill of Death
-- https://youtu.be/6_fOYjfh5eI?t=6m11s
-- https://youtu.be/2RVY-5mnsvc?t=3m44s
-- Gretchen Dedmar should do a talk emote when turning in quest The Chill of Death
-- https://youtu.be/6_fOYjfh5eI?t=6m13s
-- https://youtu.be/2RVY-5mnsvc?t=3m45s
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=375;

-- Deathguard Dillinger should not do an emote on completed quest The Mills Overrun
-- https://youtu.be/z_e5jkcrf7w?t=5s
-- https://youtu.be/O9l3KDibCiM?t=6m25s
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=426;

-- Deathguard Burgess should do two talk emotes when offering quest Proof of Demise
-- https://youtu.be/DhTYPNsiKk4?t=6m34s
-- https://youtu.be/CVeijybDMN0?t=7m49s
-- https://youtu.be/yvAjZ-wChsE?t=1m4s
-- Deathguard Burgess should do shrug emote on completed quest Proof of Demise
-- https://youtu.be/QbvS_IUmc0k?t=4m25s
-- https://youtu.be/39mYbNh0E9g?t=31s
-- Deathguard Burgess should do salute emote when turning in quest Proof of Demise
-- https://youtu.be/QbvS_IUmc0k?t=4m26s
-- https://youtu.be/39mYbNh0E9g?t=32s
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `CompleteEmote`=6, `OfferRewardEmote1`=66 WHERE `entry`=374;

-- Executor Zygand should do shrug emote on completed quest Wanted: Maggot Eye
-- https://youtu.be/lirB-0kLG4A?t=5s
-- https://youtu.be/2RVY-5mnsvc?t=2m45s
-- Executor Zygand should do salute emote when turning in quest Wanted: Maggot Eye
-- https://youtu.be/lirB-0kLG4A?t=7s
-- https://youtu.be/2RVY-5mnsvc?t=2m46s
UPDATE `quest_template` SET  `CompleteEmote`=6, `OfferRewardEmote1`=66 WHERE `entry`=398;

-- Magistrate Sevren should not do an emote on completed quest Graverobbers
-- https://youtu.be/lirB-0kLG4A?t=26s
-- https://youtu.be/2RVY-5mnsvc?t=4m19s
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=358;

-- Magistrate Sevren should do talk emote when offering quest The Prodigal Lich
-- https://youtu.be/lirB-0kLG4A?t=45s
-- https://youtu.be/2RVY-5mnsvc?t=4m26s
-- Bethor Iceshard should not do an emote on completed quest The Prodigal Lich
-- https://youtu.be/kLrXkGXqN-c?t=17s
-- https://youtu.be/xnGt1ZzZhO0?t=9m11s
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0 WHERE `entry`=405;

-- Deathguard Linnea should do talk emote when turning in quest Forsaken Duties
-- https://youtu.be/z_e5jkcrf7w?t=2m58s
-- https://youtu.be/O9l3KDibCiM?t=7m36s
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=359;

-- Magistrate Sevren should not do an emote on completed quest The Family Crypt
-- https://youtu.be/QbvS_IUmc0k?t=4m45s
-- https://youtu.be/mBNLMELmCOY?t=6m59s
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=408;

-- Bethor Iceshard should not do an emote on completed quest The Lich's Identity
-- https://youtu.be/Bc1AyT9ATY8?t=4m27s
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=357;

-- Ageron Kargal should do talk emote when offering quest Halgar's Summons
-- https://youtu.be/uylVam8EdFw?t=5m4s
-- Carendin Halgar should do talk emote when turning in quest Halgar's Summons
-- https://youtu.be/kLrXkGXqN-c?t=40s
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=1478;

-- Carendin Halgar should do talk emote when offering quest Creature of the Void
-- https://youtu.be/kLrXkGXqN-c?t=41s
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1473;

-- Carendin Halgar should do talk emote when offering quest The Binding
-- https://youtu.be/kLrXkGXqN-c?t=8m13s
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1471;

-- Gunther Arcanus should do talk emote when turning in quest Proving Allegiance
-- https://youtu.be/Bc1AyT9ATY8?t=7m23s
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=409;

-- Bethor Iceshard should not do an emote on completed quest The Prodigal Lich Returns
-- https://youtu.be/Bc1AyT9ATY8?t=7m42s
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=411;
