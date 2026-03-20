#include "ListSkillsAction.h"

#include "Event.h"
#include "PlayerbotAI.h"
#include "SharedDefines.h"

bool ListSkillsAction::Execute(Event event)
{
    struct SkillEntry
    {
        uint16 id;
        char const* name;
    };

    static const SkillEntry weaponSkills[] =
    {
        { SKILL_SWORDS,        "Swords" },
        { SKILL_2H_SWORDS,     "2H Swords" },
        { SKILL_AXES,          "Axes" },
        { SKILL_2H_AXES,       "2H Axes" },
        { SKILL_MACES,         "Maces" },
        { SKILL_2H_MACES,      "2H Maces" },
        { SKILL_DAGGERS,       "Daggers" },
        { SKILL_STAVES,        "Staves" },
        { SKILL_POLEARMS,      "Polearms" },
        { SKILL_FIST_WEAPONS,  "Fist Weapons" },
        { SKILL_BOWS,          "Bows" },
        { SKILL_GUNS,          "Guns" },
        { SKILL_CROSSBOWS,     "Crossbows" },
        { SKILL_THROWN,         "Thrown" },
        { SKILL_WANDS,         "Wands" },
    };

    static const SkillEntry otherSkills[] =
    {
        { SKILL_DEFENSE,       "Defense" },
        { SKILL_UNARMED,       "Unarmed" },
    };

    uint32 maxForLevel = bot->GetLevel() * 5;

    std::ostringstream out;
    out << "Skills (max for level " << bot->GetLevel() << " = " << maxForLevel << "):";

    // Weapon skills — only show ones the bot actually has
    bool anyWeapon = false;
    for (auto const& s : weaponSkills)
    {
        if (!bot->HasSkill(s.id))
            continue;

        uint16 cur = bot->GetSkillValuePure(s.id);
        uint16 max = bot->GetSkillMaxPure(s.id);
        bool capped = (cur >= max);

        out << "\n  " << s.name << ": " << cur << "/" << max;
        if (!capped)
            out << " [LOW]";

        anyWeapon = true;
    }

    if (!anyWeapon)
        out << "\n  (no weapon skills)";

    // Defense / Unarmed
    for (auto const& s : otherSkills)
    {
        if (!bot->HasSkill(s.id))
            continue;

        uint16 cur = bot->GetSkillValuePure(s.id);
        uint16 max = bot->GetSkillMaxPure(s.id);

        out << "\n  " << s.name << ": " << cur << "/" << max;
        if (cur < max)
            out << " [LOW]";
    }

    botAI->TellMaster(out);
    return true;
}
