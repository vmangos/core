ALTER TABLE character_inventory ADD looting_date BIGINT NOT NULL DEFAULT 0;
ALTER TABLE character_inventory ADD raid_group LONGTEXT;