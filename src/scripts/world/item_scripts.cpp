   
//   If you don't want scripted items with dummy spells share
//   one cooldown, set up spellid_1, spellcharges_1, spellcooldown_1
//   directly for each item in item_template table.
  
#include "scriptPCH.h"

bool ItemUseSpell_item_character_rename(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
    if (!pPlayer) return false;
	
    ChatHandler(pPlayer).PSendSysMessage("Please logout and enter a new name for this character.");
    pPlayer->SetAtLoginFlag(AT_LOGIN_RENAME);
    return true;
}

bool ItemUseSpell_item_summon_mailbox(Player* pPlayer, Item* pItem, const SpellCastTargets&)
{
	if (!pPlayer) return false;
	
    float dis{ 2.0F };
    float x, y, z;
    pPlayer->GetSafePosition(x, y, z);
    x += dis * cos(pPlayer->GetOrientation());
    y += dis * sin(pPlayer->GetOrientation());
    
    pPlayer->HandleEmoteCommand(EMOTE_ONESHOT_CHEER);
    pPlayer->SummonGameObject(144112, x, y, z, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 180, true);
    return true;
}


void AddSC_item_scripts()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "item_character_rename";
    newscript->pItemUseSpell = &ItemUseSpell_item_character_rename;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "item_summon_mailbox";
    newscript->pItemUseSpell = &ItemUseSpell_item_summon_mailbox;
    newscript->RegisterSelf();
}
