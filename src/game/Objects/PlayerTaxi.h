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

#ifndef _PLAYER_TAXI_H
#define _PLAYER_TAXI_H

#include "Common.h"
#include "DBCStructure.h"
#include "SharedDefines.h"

#include <deque>
#include <sstream>

class ByteBuffer;

class PlayerTaxi
{
public:
    PlayerTaxi();
    ~PlayerTaxi() {}
    // Nodes
    void InitTaxiNodes(uint32 race, uint32 level);
    void LoadTaxiMask(char const* data);

    bool IsTaximaskNodeKnown(uint32 nodeidx) const
    {
        uint8  field = uint8((nodeidx - 1) / 32);
        uint32 submask = 1 << ((nodeidx - 1) % 32);
        return (m_taximask[field] & submask) == submask;
    }
    bool SetTaximaskNode(uint32 nodeidx)
    {
        uint8  field = uint8((nodeidx - 1) / 32);
        uint32 submask = 1 << ((nodeidx - 1) % 32);
        if ((m_taximask[field] & submask) != submask)
        {
            m_taximask[field] |= submask;
            return true;
        }
        else
            return false;
    }
    void AppendTaximaskTo(ByteBuffer& data, bool all);

    // Destinations
    bool LoadTaxiDestinationsFromString(std::string const& values, Team team);
    std::string SaveTaxiDestinationsToString() const;

    void ClearTaxiDestinations()
    {
        m_TaxiDestinations.clear();
        m_taxiPath.clear();
        m_discount = 1.0f;
    }
    void AddTaxiDestination(uint32 dest) { m_TaxiDestinations.push_back(dest); }
    void SetDiscount(float discount) { m_discount = discount; }
    uint32 GetTaxiSource() const { return m_TaxiDestinations.empty() ? 0 : m_TaxiDestinations.front(); }
    uint32 GetTaxiDestination() const { return m_TaxiDestinations.size() < 2 ? 0 : m_TaxiDestinations[1]; }
    uint32 GetCurrentTaxiPath() const;
    uint32 GetCurrentTaxiCost() const;
    uint32 NextTaxiDestination()
    {
        m_TaxiDestinations.pop_front();
        return GetTaxiDestination();
    };
    TaxiPathNodeList const& GetTaxiPath() const { return m_taxiPath; };
    void AddTaxiPathNode(TaxiPathNodeEntry const& entry)
    {
        m_taxiPath.resize(m_taxiPath.size() + 1);
        m_taxiPath.set(m_taxiPath.size() - 1, &entry);
    }
    bool empty() const { return m_TaxiDestinations.empty(); }

    friend std::ostringstream& operator<< (std::ostringstream& ss, PlayerTaxi const& taxi);
private:
    float m_discount;
    TaxiMask m_taximask;
    std::deque<uint32> m_TaxiDestinations;
    TaxiPathNodeList m_taxiPath;
};

std::ostringstream& operator<< (std::ostringstream& ss, PlayerTaxi const& taxi);

#endif
