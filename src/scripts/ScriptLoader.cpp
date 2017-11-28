/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
* This program is free software licensed under GPL version 2
* Please see the included DOCS/LICENSE.TXT for more information */

#include "scriptPCH.h"

// AI system
void AddSC_generic_spell_ai();
void AddSC_npc_escort();

//battlegrounds
void AddSC_battleground();
void AddSC_bg_alterac();

//custom
void AddSC_zero_scripts();
void AddSC_ubrs_trash();
//void AddSC_gmisland();
//void AddSC_boss_arena_hardog(); // EVENT de TORKIN

// Event
//void AddSC_event_attack_city();
void AddSC_elemental_invasions();

// HT
void AddSC_instance_dire_maul();
void AddSC_boss_immol_thar();
void AddSC_boss_tendris_warpwood();
void AddSC_npc_pusillin();
void AddSC_boss_zevrim();
void AddSC_npc_ecorcefer();
void AddSC_dreadsteed_ritual();
void AddSC_npc_king_gordok();

//world
void AddSC_areatrigger_scripts();
void AddSC_dragons_of_nightmare();
void AddSC_boss_lord_kazzak();
void AddSC_generic_creature();
void AddSC_go_scripts();
void AddSC_guards();
void AddSC_npc_professions();
void AddSC_npcs_special();
void AddSC_Totems();
void AddSC_world_event_naxxramas();
void AddSC_event_scourge_invasion();
void AddSC_spell_scripts();

//eastern kingdoms
void AddSC_instance_blackrock_spire();
void AddSC_blackrock_depths();                       //blackrock_depths
void AddSC_blackrock_depths_arena_challenge();
void AddSC_boss_ambassador_flamelash();
void AddSC_boss_anubshiah();
void AddSC_boss_draganthaurissan();
void AddSC_boss_general_angerforge();
void AddSC_boss_gorosh_the_dervish();
void AddSC_boss_grizzle();
void AddSC_boss_high_interrogator_gerstahn();
void AddSC_boss_magmus();
void AddSC_boss_tomb_of_seven();
void AddSC_boss_urok();
void AddSC_instance_blackrock_depths();
void AddSC_boss_drakkisath();                        //blackrock_spire
void AddSC_boss_halycon();
void AddSC_boss_highlordomokk();
//void AddSC_boss_mothersmolderweb();
void AddSC_boss_overlordwyrmthalak();
void AddSC_boss_shadowvosh();
void AddSC_boss_thebeast();
void AddSC_boss_warmastervoone();
void AddSC_boss_quatermasterzigris();
void AddSC_boss_pyroguard_emberseer();
void AddSC_boss_gyth();
void AddSC_boss_rend_blackhand();
void AddSC_boss_razorgore();                         //blackwing_lair
void AddSC_boss_vael();
void AddSC_boss_broodlord();
void AddSC_boss_firemaw();
void AddSC_boss_ebonroc();
void AddSC_boss_flamegor();
void AddSC_boss_chromaggus();
void AddSC_boss_nefarian();
void AddSC_boss_victor_nefarius();
void AddSC_instance_blackwing_lair();

void AddSC_deadmines();                              //deadmines
void AddSC_instance_deadmines();
void AddSC_boss_mr_smite();
//void AddSC_boss_sneed_shredder();
//void AddSC_boss_sneed();

void AddSC_gnomeregan();                             //gnomeregan
void AddSC_boss_thermaplugg();
void AddSC_instance_gnomeregan();

void AddSC_boss_lucifron();                          //molten_core
void AddSC_boss_magmadar();
void AddSC_boss_gehennas();
void AddSC_boss_garr();
void AddSC_boss_baron_geddon();
void AddSC_boss_shazzrah();
void AddSC_boss_golemagg();
void AddSC_boss_sulfuron();
void AddSC_boss_majordomo();
void AddSC_boss_ragnaros();
void AddSC_instance_molten_core();
void AddSC_molten_core();
void AddSC_boss_anubrekhan();                        //naxxramas
void AddSC_boss_four_horsemen();
void AddSC_boss_faerlina();
void AddSC_boss_gluth();
void AddSC_boss_gothik();
void AddSC_boss_kelthuzad();
void AddSC_boss_loatheb();
void AddSC_boss_maexxna();
void AddSC_boss_noth();
void AddSC_boss_heigan();
void AddSC_boss_patchwerk();
void AddSC_boss_grobbulus();
void AddSC_boss_thaddius();
void AddSC_boss_razuvious();
void AddSC_boss_sapphiron();
void AddSC_instance_naxxramas();
void AddSC_boss_arcanist_doan();                     //scarlet_monastery
//void AddSC_boss_azshir_the_sleepless();
void AddSC_boss_bloodmage_thalnos();
void AddSC_boss_scorn();
void AddSC_boss_herod();
void AddSC_boss_high_inquisitor_fairbanks();
void AddSC_boss_houndmaster_loksey();
void AddSC_boss_interrogator_vishas();
void AddSC_boss_mograine_and_whitemane();
void AddSC_instance_scarlet_monastery();
void AddSC_boss_darkmaster_gandling();               //scholomance
void AddSC_boss_death_knight_darkreaver();
void AddSC_boss_theolenkrastinov();
void AddSC_boss_illuciabarov();
void AddSC_boss_instructormalicia();
void AddSC_boss_jandicebarov();
//void AddSC_boss_kormok();
void AddSC_boss_lordalexeibarov();
void AddSC_boss_lorekeeperpolkelt();
void AddSC_boss_rasfrost();
void AddSC_boss_theravenian();
void AddSC_boss_vectus();
//void AddSC_boss_lordblackwood();
void AddSC_scholo_trash();
void AddSC_instance_scholomance();
void AddSC_shadowfang_keep();                        //shadowfang_keep
void AddSC_instance_shadowfang_keep();
void AddSC_boss_magistrate_barthilas();              //stratholme
void AddSC_boss_maleki_the_pallid();
void AddSC_boss_nerubenkan();
void AddSC_boss_cannon_master_willey();
void AddSC_boss_baroness_anastari();
void AddSC_boss_ramstein_the_gorger();
void AddSC_boss_timmy_the_cruel();
void AddSC_boss_postmaster_malown();
void AddSC_boss_baron_rivendare();
void AddSC_boss_dathrohan_balnazzar();
void AddSC_boss_atiesh();
void AddSC_instance_stratholme();
void AddSC_stratholme();
void AddSC_instance_sunken_temple();                 //sunken_temple
void AddSC_sunken_temple();
void AddSC_boss_ironaya();                           //uldaman
void AddSC_instance_uldaman();                       //uldaman
void AddSC_uldaman();                                //uldaman
void AddSC_boss_archaedas();
void AddSC_boss_arlokk();                            //zulgurub
void AddSC_boss_gahzranka();
//void AddSC_boss_grilek();
void AddSC_boss_hakkar();
//void AddSC_boss_hazzarah();
void AddSC_boss_jeklik();
void AddSC_boss_jindo();
void AddSC_boss_mandokir();
void AddSC_boss_marli();
void AddSC_boss_ouro();
void AddSC_boss_renataki();
void AddSC_boss_thekal();
void AddSC_boss_venoxis();
//void AddSC_boss_wushoolay();
void AddSC_instance_zulgurub();
void AddSC_zg_trash();
void AddSC_boss_omen();

//void AddSC_alterac_mountains();
void AddSC_arathi_highlands();
void AddSC_blasted_lands();
void AddSC_burning_steppes();
void AddSC_dun_morogh();
void AddSC_eastern_plaguelands();
void AddSC_elwynn_forest();
void AddSC_hillsbrad_foothills();
void AddSC_hinterlands();
void AddSC_ironforge();
void AddSC_loch_modan();
void AddSC_redridge_mountains();
void AddSC_searing_gorge();
void AddSC_silverpine_forest();
void AddSC_stormwind_city();
void AddSC_quest_stormwind_rendezvous();
void AddSC_stranglethorn_vale();
void AddSC_swamp_of_sorrows();
void AddSC_tirisfal_glades();
void AddSC_undercity();
void AddSC_western_plaguelands();
void AddSC_quest_in_dreams();
void AddSC_westfall();
void AddSC_wetlands();

//kalimdor
//void AddSC_jcj_tanaris();									//eventjcj
void AddSC_instance_blackfathom_deeps();             //blackfathom_deeps
void AddSC_boss_celebras_the_cursed();               //maraudon
void AddSC_boss_landslide();
void AddSC_boss_noxxion();
void AddSC_boss_ptheradras();
void AddSC_maraudon();
void AddSC_instance_maraudon();
void AddSC_boss_onyxia();                            //onyxias_lair
void AddSC_boss_amnennar_the_coldbringer();          //razorfen_downs
void AddSC_razorfen_downs();
void AddSC_razorfen_kraul();                         //razorfen_kraul
void AddSC_instance_razorfen_kraul();
void AddSC_instance_razorfen_downs();
void AddSC_boss_ayamiss();                           //ruins_of_ahnqiraj
void AddSC_boss_buru();
void AddSC_boss_kurinnaxx();
void AddSC_boss_moam();
void AddSC_boss_ossirian();
void AddSC_boss_rajaxx();
//void AddSC_npc_sandstalker(); 						// trash
void AddSC_ruins_of_ahnqiraj();
void AddSC_instance_ruins_of_ahnqiraj();
void AddSC_boss_cthun();                             //temple_of_ahnqiraj
void AddSC_boss_viscidus();
void AddSC_boss_fankriss();
void AddSC_boss_huhuran();
void AddSC_bug_trio();
void AddSC_boss_sartura();
void AddSC_boss_skeram();
void AddSC_boss_twinemperors();
void AddSC_mob_anubisath_sentinel();
void AddSC_instance_temple_of_ahnqiraj();
void AddSC_instance_wailing_caverns();               //Wailing caverns
void AddSC_wailing_caverns();
void AddSC_zulfarrak();                              //zulfarrak
void AddSC_instance_zulfarrak();

void AddSC_ashenvale();
void AddSC_azshara();
void AddSC_boss_azuregos();
void AddSC_boss_anachronos();
void AddSC_darkshore();
void AddSC_desolace();
void AddSC_durotar();
void AddSC_dustwallow_marsh();
void AddSC_duskwood();
void AddSC_felwood();
void AddSC_feralas();
void AddSC_moonglade();
void AddSC_mulgore();
void AddSC_orgrimmar();
void AddSC_silithus();
void AddSC_stonetalon_mountains();
void AddSC_tanaris();
void AddSC_teldrassil();
void AddSC_the_barrens();
void AddSC_thousand_needles();
void AddSC_thunder_bluff();
void AddSC_ungoro_crater();
void AddSC_winterspring();
void AddSC_war_effort();

void AddSC_npc_j_eevee();                            // J'Eevee, the Imp in a Jar

void AddScripts()
{
    //Nostalrius
    AddSC_generic_spell_ai();
    AddSC_npc_escort();

    //battlegrounds
    AddSC_battleground();
    AddSC_bg_alterac();

    //custom
    AddSC_zero_scripts();
    AddSC_ubrs_trash();
    //AddSC_gmisland();

    // Event
    //AddSC_event_attack_city();
    AddSC_elemental_invasions();

    // HT
    AddSC_instance_dire_maul();
    AddSC_boss_immol_thar();
    AddSC_boss_tendris_warpwood();
    AddSC_npc_pusillin();
    AddSC_npc_ecorcefer();
    AddSC_boss_zevrim();
    AddSC_dreadsteed_ritual();
    AddSC_npc_king_gordok();

    //world
    AddSC_areatrigger_scripts();
    AddSC_dragons_of_nightmare();
    AddSC_boss_lord_kazzak();
    AddSC_generic_creature();
    AddSC_go_scripts();
    AddSC_guards();
    AddSC_npc_professions();
    AddSC_npcs_special();
    AddSC_Totems();
    AddSC_world_event_naxxramas();
    AddSC_event_scourge_invasion();
    AddSC_spell_scripts();

    AddSC_war_effort();

    //eastern kingdoms
    AddSC_blackrock_depths();                               //blackrock_depths
    AddSC_blackrock_depths_arena_challenge();
    AddSC_boss_ambassador_flamelash();
    AddSC_boss_anubshiah();
    AddSC_boss_draganthaurissan();
    AddSC_boss_general_angerforge();
    AddSC_boss_gorosh_the_dervish();
    AddSC_boss_grizzle();
    AddSC_boss_high_interrogator_gerstahn();
    AddSC_boss_magmus();
    AddSC_boss_tomb_of_seven();
    AddSC_boss_urok();
    AddSC_instance_blackrock_depths();
    AddSC_boss_drakkisath();                                //blackrock_spire
    AddSC_boss_halycon();
    AddSC_boss_highlordomokk();
    //AddSC_boss_mothersmolderweb();
    AddSC_boss_overlordwyrmthalak();
    AddSC_boss_shadowvosh();
    AddSC_boss_thebeast();
    AddSC_boss_warmastervoone();
    AddSC_boss_quatermasterzigris();

    AddSC_instance_blackrock_spire();
    AddSC_boss_pyroguard_emberseer();
    AddSC_boss_gyth();
    AddSC_boss_rend_blackhand();
    AddSC_boss_razorgore();                                 //blackwing_lair
    AddSC_boss_vael();
    AddSC_boss_broodlord();
    AddSC_boss_firemaw();
    AddSC_boss_ebonroc();
    AddSC_boss_flamegor();
    AddSC_boss_chromaggus();
    AddSC_boss_nefarian();
    AddSC_boss_victor_nefarius();
    AddSC_instance_blackwing_lair();
    AddSC_deadmines();                                      //deadmines
    AddSC_instance_deadmines();
    AddSC_boss_mr_smite();
    //AddSC_boss_sneed_shredder();
    //AddSC_boss_sneed();
    AddSC_gnomeregan();                                     //gnomeregan
    AddSC_boss_thermaplugg();
    AddSC_instance_gnomeregan();
    AddSC_boss_lucifron();                                  //molten_core
    AddSC_boss_magmadar();
    AddSC_boss_gehennas();
    AddSC_boss_garr();
    AddSC_boss_baron_geddon();
    AddSC_boss_shazzrah();
    AddSC_boss_golemagg();
    AddSC_boss_sulfuron();
    AddSC_boss_majordomo();
    AddSC_boss_ragnaros();
    AddSC_instance_molten_core();
    AddSC_molten_core();
    AddSC_boss_anubrekhan();                                //naxxramas
    AddSC_boss_four_horsemen();
    AddSC_boss_faerlina();
    AddSC_boss_gluth();
    AddSC_boss_gothik();
    AddSC_boss_kelthuzad();
    AddSC_boss_loatheb();
    AddSC_boss_maexxna();
    AddSC_boss_noth();
    AddSC_boss_heigan();
    AddSC_boss_patchwerk();
    AddSC_boss_grobbulus();
    AddSC_boss_thaddius();
    AddSC_boss_razuvious();
    AddSC_boss_sapphiron();
    AddSC_instance_naxxramas();
    AddSC_boss_arcanist_doan();                             //scarlet_monastery
    //AddSC_boss_azshir_the_sleepless();
    AddSC_boss_bloodmage_thalnos();
    AddSC_boss_scorn();
    AddSC_boss_herod();
    AddSC_boss_high_inquisitor_fairbanks();
    AddSC_boss_houndmaster_loksey();
    AddSC_boss_interrogator_vishas();
    AddSC_boss_mograine_and_whitemane();
    AddSC_instance_scarlet_monastery();
    AddSC_boss_darkmaster_gandling();                       //scholomance
    AddSC_boss_death_knight_darkreaver();
    AddSC_boss_theolenkrastinov();
    AddSC_boss_illuciabarov();
    AddSC_boss_instructormalicia();
    AddSC_boss_jandicebarov();
    //AddSC_boss_kormok();
    AddSC_boss_lordalexeibarov();
    AddSC_boss_lorekeeperpolkelt();
    AddSC_boss_rasfrost();
    AddSC_boss_theravenian();
    AddSC_boss_vectus();
    //AddSC_boss_lordblackwood();
    AddSC_scholo_trash();
    AddSC_instance_scholomance();
    AddSC_shadowfang_keep();                                //shadowfang_keep
    AddSC_instance_shadowfang_keep();
    AddSC_boss_magistrate_barthilas();                      //stratholme
    AddSC_boss_maleki_the_pallid();
    AddSC_boss_nerubenkan();
    AddSC_boss_cannon_master_willey();
    AddSC_boss_baroness_anastari();
    AddSC_boss_ramstein_the_gorger();
    AddSC_boss_timmy_the_cruel();
    AddSC_boss_postmaster_malown();
    AddSC_boss_baron_rivendare();
    AddSC_boss_dathrohan_balnazzar();
    AddSC_boss_atiesh();
    AddSC_instance_stratholme();
    AddSC_stratholme();
    AddSC_instance_sunken_temple();                         //sunken_temple
    AddSC_sunken_temple();
    AddSC_instance_uldaman();
    AddSC_boss_ironaya();                                   //uldaman
    AddSC_uldaman();
    AddSC_boss_archaedas();
    AddSC_boss_arlokk();                                    //zulgurub
    AddSC_boss_gahzranka();
    //AddSC_boss_grilek();
    AddSC_boss_hakkar();
    //AddSC_boss_hazzarah();
    AddSC_boss_jeklik();
    AddSC_boss_jindo();
    AddSC_boss_mandokir();
    AddSC_boss_marli();
    AddSC_boss_ouro();
    AddSC_boss_renataki();
    AddSC_boss_thekal();
    AddSC_boss_venoxis();
    //AddSC_boss_wushoolay();
    AddSC_instance_zulgurub();
    AddSC_zg_trash();
    AddSC_boss_omen();

    //AddSC_alterac_mountains();
    AddSC_arathi_highlands();
    AddSC_blasted_lands();
    AddSC_burning_steppes();
    AddSC_dun_morogh();
    AddSC_eastern_plaguelands();
    AddSC_elwynn_forest();
    AddSC_hillsbrad_foothills();
    AddSC_hinterlands();
    AddSC_ironforge();
    AddSC_loch_modan();
    AddSC_redridge_mountains();
    AddSC_searing_gorge();
    AddSC_silverpine_forest();
    AddSC_stormwind_city();
    AddSC_quest_stormwind_rendezvous();
    AddSC_stranglethorn_vale();
    AddSC_swamp_of_sorrows();
    AddSC_tirisfal_glades();
    AddSC_undercity();
    AddSC_western_plaguelands();
    AddSC_quest_in_dreams();
    AddSC_westfall();
    AddSC_wetlands();

    //kalimdor
	//AddSC_jcj_tanaris();									//eventjcj
    AddSC_instance_blackfathom_deeps();                     //blackfathom_deeps
    AddSC_boss_celebras_the_cursed();                       //maraudon
    AddSC_boss_landslide();
    AddSC_boss_noxxion();
    AddSC_boss_ptheradras();
    AddSC_maraudon();
    AddSC_instance_maraudon();
    AddSC_boss_onyxia();                                    //onyxias_lair
    AddSC_boss_amnennar_the_coldbringer();                  //razorfen_downs
    AddSC_razorfen_downs();
    AddSC_razorfen_kraul();                                 //razorfen_kraul
    AddSC_instance_razorfen_downs();
    AddSC_instance_razorfen_kraul();
	AddSC_boss_ayamiss();                                   //ruins_of_ahnqiraj
    AddSC_boss_buru();
    AddSC_boss_kurinnaxx();
    AddSC_boss_moam();
    AddSC_boss_ossirian();
    AddSC_boss_rajaxx();
    AddSC_ruins_of_ahnqiraj();
	//AddSC_npc_sandstalker();								//trash
    AddSC_instance_ruins_of_ahnqiraj();
    AddSC_boss_cthun();                                     //temple_of_ahnqiraj
	AddSC_boss_viscidus();
    AddSC_boss_fankriss();
    AddSC_boss_huhuran();
    AddSC_bug_trio();
    AddSC_boss_sartura();
    AddSC_boss_skeram();
    AddSC_boss_twinemperors();
    AddSC_mob_anubisath_sentinel();
    AddSC_instance_temple_of_ahnqiraj();
    AddSC_wailing_caverns();                               //Wailing caverns
    AddSC_instance_wailing_caverns();
    AddSC_zulfarrak();                                      //zulfarrak
    AddSC_instance_zulfarrak();

    AddSC_ashenvale();
    AddSC_azshara();
    AddSC_boss_azuregos();
    AddSC_boss_anachronos();
    AddSC_darkshore();
    AddSC_desolace();
    AddSC_durotar();
    AddSC_dustwallow_marsh();
    AddSC_duskwood();
    AddSC_felwood();
    AddSC_feralas();
    AddSC_moonglade();
    AddSC_mulgore();
    AddSC_orgrimmar();
    AddSC_silithus();
    AddSC_stonetalon_mountains();
    AddSC_tanaris();
    AddSC_teldrassil();
    AddSC_the_barrens();
    AddSC_thousand_needles();
    AddSC_thunder_bluff();
    AddSC_ungoro_crater();
    AddSC_winterspring();

    AddSC_npc_j_eevee();
}
