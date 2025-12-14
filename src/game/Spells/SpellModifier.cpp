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

#include "SpellModifier.h"
#include "SpellAuras.h"
#include "SpellEntry.h"
#include "SpellMgr.h"

SpellModifier::SpellModifier(SpellModOp _op, SpellModType _type, int32 _value, SpellEntry const* spellEntry, SpellEffectIndex eff, int16 _charges /*= 0*/) :
    op(_op), type(_type), charges(_charges), value(_value), spellId(spellEntry->Id), ownerAura(nullptr)
{
    mask = sSpellMgr.GetSpellAffectMask(spellEntry->Id, eff);
}

SpellModifier::SpellModifier(SpellModOp _op, SpellModType _type, int32 _value, Aura* aura, int16 _charges /*= 0*/) :
    op(_op), type(_type), charges(_charges), value(_value), spellId(aura->GetId()), ownerAura(aura)
{
    mask = sSpellMgr.GetSpellAffectMask(aura->GetId(), aura->GetEffIndex());
}

bool SpellModifier::IsAffectedOnSpell(SpellEntry const* spell) const
{
    SpellEntry const* affect_spell = sSpellMgr.GetSpellEntry(spellId);
    // False if affect_spell == nullptr or spellFamily not equal
    if (!affect_spell || affect_spell->SpellFamilyName != spell->SpellFamilyName)
        return false;
    return spell->IsFitToFamilyMask(mask);
}
