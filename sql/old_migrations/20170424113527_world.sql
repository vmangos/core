INSERT INTO `migrations` VALUES ('20170424113527'); 

UPDATE `script_texts` SET `content_default`='The rift will be opened there, above the Lake Elun\'ara. Prepare yourself, $N. Eranikus\'s entry into our world will be wrought with chaos and strife.' WHERE `entry`='-1000717';
UPDATE `script_texts` SET `content_default`='IT BURNS! THE PAIN... SEARING...' WHERE `entry`='-1000740';
UPDATE `script_texts` SET `content_default`='For so long, I was lost... The Nightmare\'s corruption had consumed me... And now, you... all of you... you have saved me. Released me from its grasp.' WHERE `entry`='-1000746';
UPDATE `script_texts` SET `content_default`='My lady, I am unworthy of your prayer. Truly, you are an angel of light. Please, assist me in returning to the barrow den so that I may return to the Dream. I, like Malfurion, also have a love awaiting me... I must return to her... to protect her...' WHERE `entry`='-1000748';
UPDATE `creature_template` SET `faction_A`='996', `faction_H`='996' WHERE `entry`='11832';
