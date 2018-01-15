
#include "CinematicStuff.h"
#include "Player.h"
#include "ObjectMgr.h"
#include "MoveMapSharedDefines.h"


void CinematicStuff::AddStuff(Player* player, uint32 itemID)
{
    ItemPrototype const* prototype = sObjectMgr.GetItemPrototype(itemID);
    if (!prototype)
        return;

    uint8 slot = player->FindEquipSlot(prototype, NULL_SLOT, true);
    if (slot == NULL_SLOT)
        return;

    if (player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
        player->DestroyItem(INVENTORY_SLOT_BAG_0, slot, true);

    //if (player->CanUseItem(prototype))
    player->EquipNewItem(slot, itemID, true);
}

void CinematicStuff::AddSpells(Player* player)
{
    uint32 familyName = 0;
    switch (player->getClass())
    {
        case CLASS_MAGE:
            familyName = SPELLFAMILY_MAGE;
            break;
        case CLASS_WARRIOR:
            familyName = SPELLFAMILY_WARRIOR;
            break;
        case CLASS_WARLOCK:
            familyName = SPELLFAMILY_WARLOCK;
            break;
        case CLASS_PRIEST:
            familyName = SPELLFAMILY_PRIEST;
            break;
        case CLASS_DRUID:
            familyName = SPELLFAMILY_DRUID;
            break;
        case CLASS_ROGUE:
            familyName = SPELLFAMILY_ROGUE;
            break;
        case CLASS_HUNTER:
            familyName = SPELLFAMILY_HUNTER;
            break;
        case CLASS_PALADIN:
            familyName = SPELLFAMILY_PALADIN;
            break;
        case CLASS_SHAMAN:
            familyName = SPELLFAMILY_SHAMAN;
            break;
    }
    for (uint32 id = 0; id < sSpellMgr.GetMaxSpellId(); id++)
    {
        SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(id);
        if (spellInfo && spellInfo->SpellFamilyName == familyName && spellInfo->spellLevel <= player->getLevel())
            player->learnSpell(id, false);
    }
}

void CinematicStuff::Mount(Player* p, uint32 mountItem)
{
    if (Item* item = p->AddItem(mountItem, 1))
    {
        // search spell for spell error
        uint32 spellid = 0;
        for (int i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
        {
            if (item->GetProto()->Spells[i].SpellTrigger == ITEM_SPELLTRIGGER_ON_USE || item->GetProto()->Spells[i].SpellTrigger == ITEM_SPELLTRIGGER_ON_NO_DELAY_USE)
            {
                spellid = item->GetProto()->Spells[i].SpellId;
                break;
            }
        }
        p->AddAura(spellid);
    }
}

void CinematicStuff::StuffLevel60(Player* player)
{
    switch (player->getClass())
    {
        case CLASS_WARLOCK:
            AddStuff(player, 16931);
            AddStuff(player, 16932);
            AddStuff(player, 16929);
            AddStuff(player, 19356);
            break;
        case CLASS_MAGE:
            AddStuff(player, 16916);
            AddStuff(player, 16917);
            AddStuff(player, 19356);
            break;
        case CLASS_WARRIOR:
            AddStuff(player, 16961);
            AddStuff(player, 16966);
            AddStuff(player, 16962);
            AddStuff(player, 19349);
            AddStuff(player, 18348);
            break;
        case CLASS_HUNTER:
            AddStuff(player, 16940);
            AddStuff(player, 16942);
            AddStuff(player, 16938);
            AddStuff(player, 16937);
            AddStuff(player, 16941);
            AddStuff(player, 18715);
            break;
        case CLASS_DRUID:
            AddStuff(player, 16902);
            AddStuff(player, 16900);
            AddStuff(player, 16897);
            AddStuff(player, 18803);
            break;
        case CLASS_ROGUE:
            AddStuff(player, 16832);
            AddStuff(player, 16905);
            AddStuff(player, 16908);
            AddStuff(player, 16906);
            AddStuff(player, 16907);
            AddStuff(player, 17075);
            AddStuff(player, 19867);
        case CLASS_SHAMAN:
            AddStuff(player, 16841);
            AddStuff(player, 16844);
            AddStuff(player, 16843);
            AddStuff(player, 22809);
        case CLASS_PRIEST:
            AddStuff(player, 18486);
            AddStuff(player, 7721);
            AddStuff(player, 4729);
            AddStuff(player, 2576);
        case CLASS_PALADIN:
            //#TODO Make different! Currently as warrior
            AddStuff(player, 16961);
            AddStuff(player, 16966);
            AddStuff(player, 16962);
            AddStuff(player, 19349);
            AddStuff(player, 18348);
            break;
    }
}

void CinematicStuff::AutoMountPlayer(Player* player, bool mount60 /*= false*/)
{
    uint32 mount = 0;
    switch (player->getRace())
    {
        case RACE_HUMAN:
            mount = 18776;
            if (mount60)
                mount = urand(0, 1) ? 2414 : 5655;
            break;
        case RACE_GNOME:
            mount = 18772;
            if (mount60)
                mount = urand(0, 1) ? 13321 : 8563;
            break;
        case RACE_DWARF:
            mount = 18785;
            if (mount60)
                mount = urand(0, 1) ? 5872 : 5864;
            break;
        case RACE_NIGHTELF:
            mount = 18242;
            if (mount60)
                mount = 8632;
            break;
        case RACE_ORC:
            mount = 18796;
            if (mount60)
                mount = 12330;
            break;
        case RACE_TAUREN:
            mount = 15293;
            if (mount60)
                mount = 15277;
            break;
        case RACE_TROLL:
            mount = 18788;
            if (mount60)
                mount = 8288;
            break;
    }
    if (!mount60 && (!mount || !urand(0, 4)))
    {
        if (urand(0, 1))
            mount = 19902; // ZG
        else
            mount = 19029; // Alterac
    }
    Mount(player, mount);
}

void CinematicStuff::JumpPlayer(Player* player)
{
    MovementInfo mi;
    mi.moveFlags = MOVEFLAG_JUMPING;
    WorldPacket data(MSG_MOVE_JUMP, 50);
    data << player->GetPackGUID();             // write guid
    mi.Write(data);                               // write data
    player->SendObjectMessageToSet(&data, true, player);
}

void CinematicStuff::SearchAndDestroy(Player* player)
{
    if (!player->isAlive()) return;

    Unit* target = player->getVictim();
    if (target == nullptr)
    {
        if (!player->isInCombat())
            target = player->SelectRandomUnfriendlyTarget(nullptr, DEFAULT_VISIBILITY_DISTANCE);
        else
        {
            target = player->getVictim();
            if (target == nullptr)
            {
                const std::set<Unit*> attackers = player->getAttackers();
                if (attackers.size() > 0)
                    target = *attackers.begin();
            }
        }
    }

    if (target != nullptr && target->isAlive())
    {
        player->GetMotionMaster()->MoveChase(target);
        player->SetFacingToObject(target);
        player->SetInFront(target);
        player->Attack(target, player->IsInRange(target, 0, MELEE_RANGE) ? true : false);
    }
    else
    {
        player->HandleEmoteCommand(EMOTE_ONESHOT_CHEER);
        float x = player->GetPositionX();
        float y = player->GetPositionY();
        float z = player->GetPositionZ();
        uint16 limit = 0;
        while (!player->GetMap()->GetWalkRandomPosition(nullptr, x, y, z, DEFAULT_VISIBILITY_DISTANCE, NAV_GROUND))
        {
            ++limit;
            if (limit > 10) return;
        }
        player->GetMotionMaster()->MovePoint(0, x, y, z, MOVE_PATHFINDING);
    }
}

