INSERT INTO `migrations` VALUES ('20170707202843'); 

INSERT INTO `script_texts` (`entry`, `type`, `content_default`, `comment`) 
    VALUES  (-1900048, 0, 'Ah, here we are! Well let\'s get to work, shall we...?', 'J\'eevee Scholomance 1'),
            (-1900049, 0, 'Oh, right! Over here now...', 'J\'eevee Scholomance 2'),
            (-1900050, 0, 'And now... the final step!', 'J\'eevee Scholomance 3'),
            (-1900051, 0, 'I\'m finished. The parchment is made. Now, return to Gorzeeki...', 'J\'eevee Scholomance 4');

UPDATE `quest_template` 
    SET     `QuestFlags` = 6, `SpecialFlags` = 2,
            `EndText` = 'Parchment Created', `ObjectiveText1` = '',
            `ReqCreatureOrGOId1` = 0, `ReqCreatureOrGOCount1` = 0 WHERE `entry` = 7629;
