/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef _SPELLMODIFIER_H
#define _SPELLMODIFIER_H

#include "Common.h"
#include "SpellDefines.h"
#include "DBCEnums.h"

class Aura;
class SpellEntry;

 // Spell modifier (used to modify other spells)
struct SpellModifier
{
    SpellModifier() : op(MAX_SPELLMOD), type(SPELLMOD_TYPE_NONE), charges(0), value(0), mask(0), spellId(0), ownerAura(nullptr) {}

    SpellModifier(SpellModOp _op, SpellModType _type, int32 _value, uint32 _spellId, uint64 _mask, int16 _charges = 0)
        : op(_op), type(_type), charges(_charges), value(_value), mask(_mask), spellId(_spellId), ownerAura(nullptr)
    {}

    SpellModifier(SpellModOp _op, SpellModType _type, int32 _value, SpellEntry const* spellEntry, SpellEffectIndex eff, int16 _charges = 0);

    SpellModifier(SpellModOp _op, SpellModType _type, int32 _value, Aura* aura, int16 _charges = 0);

    bool IsAffectedOnSpell(SpellEntry const* spell) const;

    SpellModOp   op : 8;
    SpellModType type : 8;
    int16 charges : 16; // 0 = infinite
    int32 value;
    uint64 mask;
    uint32 spellId;
    Aura* ownerAura;
};

#endif
