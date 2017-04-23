INSERT INTO migrations VALUES ('20170402093309');

# Update pinfo strings
UPDATE `mangos_string` SET `content_default`='%s %s%s %s (guid: %u) Account: %s (id: %u%s) GMLevel: %u Last IP: %s%s Last login: %s Latency: %ums Client: %s 2FA: %s' WHERE `entry`='616';
UPDATE `mangos_string` SET `content_default`='Played time: %s Level: %u Money: %ug%us%uc Money inbox: %ug%us%uc Money outbox: %ug%us%uc', `content_loc2`='Temps de jeu: %s Niveau: %u Argent: %ug%us%uc Money inbox: %ug%us%uc Money outbox: %ug%us%uc' WHERE `entry`='549';
