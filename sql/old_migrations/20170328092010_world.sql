INSERT INTO `migrations` VALUES ('20170328092010');

-- Teldrassil: Fandral Staghelm should be referred as Arch Druid, not Arch $C
UPDATE `quest_template` SET `RequestItemsText` = "Hmm... You come with the spirit of the forest strongly within you, $C. What business do you have with the Arch Druid of the Kaldorei?" WHERE `entry` = 940;

-- Grove of the Ancients: Fandral Staghelm should be referred as Arch Druid, not Arch $C
UPDATE `quest_template` SET `OfferRewardText` = "Ah. Thank you, $N. It is strange, though. The Arch Druid always seems in such a hurry. The forest knows that all shall come to pass in the appointed time. Shan'do Stormrage understood that." where `entry` = 952;

-- Morrowgrain Research: Fandral Staghelm should be referred as Arch Druid, not Arch $C
UPDATE `quest_template` SET 
`OfferRewardText` = "Well done $N, I will be sure to give these to the Arch Druid himself when he has need of them. Meanwhile, please accept this as a token of the Cenarion Circle's appreciation.$b$bOur need for morrowgrain, for now, is constant; if you wish to continue aiding us, then please return when you have cultivated more of it.",
`RequestItemsText` = "Yes $N, have you grown some morrowgrain for the Arch Druid's important research? The mysterious properties of Un'Goro Crater become clearer with each passing day, thanks to the help you are giving us."
WHERE `entry` = 3785;

-- Crown of the Earth: Fandral Staghelm should be referred as Arch Druid, not Arch $C
UPDATE `quest_template` SET `OfferRewardText`="Shan'do Stormrage never returned, and the druids were in disarray, and to this day we still do not know what became of him. With Malfurion missing, Arch Druid Fandral Staghelm took over the leadership of the druids, convincing the Circle of Ancients in Darkshore that it was time for our people to rebuild, and that it was time for our people to regain their immortality.$B$BWith the approval of the Circle, Staghelm and the most powerful druids grew Teldrassil, the new World Tree." WHERE `entry`=933;
UPDATE `quest_template` SET 
`OfferRewardText`="To be in the presence of the Oracle Tree... it is almost to feel wisdom take form. Let me continue the telling...$B$BWith Teldrassil grown, the Arch Druid approached the dragons for their blessings, as the dragons had placed upon Nordrassil in ancient times. But Nozdormu, Lord of Time, refused to give his blessing, chiding the druid for his arrogance. In agreement with Nozdormu, Alexstrasza also refused Staghelm, and without her blessing, Teldrassil's growth has been flawed and unpredictable...",
`RequestItemsText`="Along with the druids, the Oracle Tree and the Arch Druid have been carefully monitoring the growth of Teldrassil. But though we have a new home, our immortal lives have not been restored." WHERE `entry`=934;