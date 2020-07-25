#include "MarketerManager.h"
#include "AuctionHouseMgr.h"

MarketerManager::MarketerManager()
{
	buyerCheckDelay = 2 * TimeConstants::MINUTE * TimeConstants::IN_MILLISECONDS;
	sellerCheckDelay = 3 * TimeConstants::MINUTE * TimeConstants::IN_MILLISECONDS;

	auctionHouseIDSet.clear();
	auctionHouseIDSet.insert(1);
	auctionHouseIDSet.insert(6);
	auctionHouseIDSet.insert(7);

	vendorUnlimitItemSet.clear();
	QueryResult* vendorItemQR = WorldDatabase.Query("SELECT distinct item FROM npc_vendor where maxcount = 0");
	if (vendorItemQR)
	{
		do
		{
			Field* fields = vendorItemQR->Fetch();
			uint32 eachItemEntry = fields[0].GetUInt32();
			vendorUnlimitItemSet.insert(eachItemEntry);
		} while (vendorItemQR->NextRow());
		delete vendorItemQR;
	}

	sellingItemIDMap.clear();
	for (uint32 id = 0; id < sItemStorage.GetMaxEntry(); id++)
	{
		ItemPrototype const* proto = sItemStorage.LookupEntry<ItemPrototype>(id);
		if (!proto)
		{
			continue;
		}
		if (proto->ItemLevel < 1)
		{
			continue;
		}
		if (proto->Quality < 1)
		{
			continue;
		}
		if (proto->Quality > 4)
		{
			continue;
		}
		if (proto->Bonding != ItemBondingType::NO_BIND && proto->Bonding != ItemBondingType::BIND_WHEN_EQUIPPED && proto->Bonding != ItemBondingType::BIND_WHEN_USE)
		{
			continue;
		}
		if (proto->SellPrice == 0 && proto->BuyPrice == 0)
		{
			continue;
		}
		if (vendorUnlimitItemSet.find(proto->ItemId) != vendorUnlimitItemSet.end())
		{
			continue;
		}
		bool sellThis = false;
		switch (proto->Class)
		{
		case ItemClass::ITEM_CLASS_CONSUMABLE:
		{
			sellThis = true;
			break;
		}
		case ItemClass::ITEM_CLASS_CONTAINER:
		{
			if (proto->Quality >= 2)
			{
				sellThis = true;
			}
			break;
		}
		case ItemClass::ITEM_CLASS_WEAPON:
		{
			if (proto->Quality >= 2)
			{
				sellThis = true;
			}
			break;
		}
		case ItemClass::ITEM_CLASS_GEM:
		{
			sellThis = true;
			break;
		}
		case ItemClass::ITEM_CLASS_ARMOR:
		{
			if (proto->Quality >= 2)
			{
				sellThis = true;
			}
			break;
		}
		case ItemClass::ITEM_CLASS_REAGENT:
		{
			sellThis = true;
			break;
		}
		case ItemClass::ITEM_CLASS_PROJECTILE:
		{
			break;
		}
		case ItemClass::ITEM_CLASS_TRADE_GOODS:
		{
			sellThis = true;
			break;
		}
		case ItemClass::ITEM_CLASS_GENERIC:
		{
			break;
		}
		case ItemClass::ITEM_CLASS_RECIPE:
		{
			sellThis = true;
			break;
		}
		case ItemClass::ITEM_CLASS_MONEY:
		{
			break;
		}
		case ItemClass::ITEM_CLASS_QUIVER:
		{
			if (proto->Quality >= 2)
			{
				sellThis = true;
			}
			break;
		}
		case ItemClass::ITEM_CLASS_QUEST:
		{
			sellThis = true;
			break;
		}
		case ItemClass::ITEM_CLASS_KEY:
		{
			break;
		}
		case ItemClass::ITEM_CLASS_PERMANENT:
		{
			break;
		}
		case ItemClass::ITEM_CLASS_JUNK:
		{
			if (proto->Quality > 0)
			{
				sellThis = true;
			}
			break;
		}
		default:
		{
			break;
		}
		}
		if (sellThis)
		{
			sellingItemIDMap[sellingItemIDMap.size()] = proto->ItemId;
		}
	}
	sellingIndex = 0;
	selling = false;
}

MarketerManager* MarketerManager::instance()
{
	static MarketerManager instance;
	return &instance;
}

void MarketerManager::ResetMarketer()
{
	if (!sMarketerConfig.Reset)
	{
		return;
	}
	sLog.outBasic("Ready to reset marketer seller");

	for (std::set<uint32>::iterator ahIDIT = auctionHouseIDSet.begin(); ahIDIT != auctionHouseIDSet.end(); ahIDIT++)
	{
		uint32 ahID = *ahIDIT;
		AuctionHouseEntry const* ahEntry = sAuctionHouseStore.LookupEntry(*ahIDIT);
		AuctionHouseObject* aho = sAuctionMgr.GetAuctionsMap(ahEntry);
		if (!aho)
		{
			sLog.outError("AuctionHouseObject is null");
			return;
		}
		std::set<uint32> auctionIDSet;
		auctionIDSet.clear();
		std::map<uint32, AuctionEntry*>* aem = aho->GetAuctions();
		for (std::map<uint32, AuctionEntry*>::iterator aeIT = aem->begin(); aeIT != aem->end(); aeIT++)
		{
			auctionIDSet.insert(aeIT->first);
		}
		for (std::set<uint32>::iterator auctionIDIT = auctionIDSet.begin(); auctionIDIT != auctionIDSet.end(); auctionIDIT++)
		{
			AuctionEntry* eachAE = aho->GetAuction(*auctionIDIT);
			if (eachAE)
			{
				if (eachAE->owner == 0)
				{
					eachAE->DeleteFromDB();
					sAuctionMgr.RemoveAItem(eachAE->itemGuidLow);
					aho->RemoveAuction(eachAE);
					delete eachAE;
					eachAE = nullptr;
					sLog.outBasic("Auction %d removed for auctionhouse %d", eachAE->itemTemplate, ahID);
				}
			}
		}
	}

	sLog.outBasic("Marketer seller reset");
}

bool MarketerManager::UpdateMarketer(uint32 pmDiff)
{
	if (!sMarketerConfig.Enable)
	{
		return false;
	}
	sellerCheckDelay -= pmDiff;
	if (sellerCheckDelay < 0)
	{
		UpdateSeller();
	}
	if (sMarketerConfig.Buying)
	{
		buyerCheckDelay -= pmDiff;
		if (buyerCheckDelay < 0)
		{
			UpdateBuyer();
		}
	}

	return true;
}

bool MarketerManager::UpdateSeller()
{
	if (selling)
	{
		int checkTotalSellCount = 0;
		int maxSellCount = 100;
		while (checkTotalSellCount < maxSellCount)
		{
			if (sellingIndex < sellingItemIDMap.size())
			{
				int itemEntry = sellingItemIDMap[sellingIndex];
				const ItemPrototype* proto = sObjectMgr.GetItemPrototype(itemEntry);
				if (!proto)
				{
					sellingIndex++;
					continue;
				}

				bool sellThis = false;
				uint32 stackCount = 1;
				uint32 baseMultiple = urand(10, 15);
				switch (proto->Class)
				{
				case ItemClass::ITEM_CLASS_CONSUMABLE:
				{
					break;
				}
				case ItemClass::ITEM_CLASS_CONTAINER:
				{
					break;
				}
				case ItemClass::ITEM_CLASS_WEAPON:
				{
					if (proto->Quality > 1)
					{
						sellThis = true;
						stackCount = proto->Stackable;
					}
					break;
				}
				case ItemClass::ITEM_CLASS_GEM:
				{
					sellThis = true;
					stackCount = proto->Stackable;
					break;
				}
				case ItemClass::ITEM_CLASS_ARMOR:
				{
					if (proto->Quality > 1)
					{
						sellThis = true;
						stackCount = proto->Stackable;
					}
					break;
				}
				case ItemClass::ITEM_CLASS_REAGENT:
				{
					sellThis = true;
					stackCount = proto->Stackable;
					break;
				}
				case ItemClass::ITEM_CLASS_PROJECTILE:
				{
					break;
				}
				case ItemClass::ITEM_CLASS_TRADE_GOODS:
				{
					sellThis = true;
					stackCount = proto->Stackable;
					baseMultiple = urand(15, 20);
					break;
				}
				case ItemClass::ITEM_CLASS_GENERIC:
				{
					break;
				}
				case ItemClass::ITEM_CLASS_RECIPE:
				{
					break;
				}
				case ItemClass::ITEM_CLASS_MONEY:
				{
					break;
				}
				case ItemClass::ITEM_CLASS_QUIVER:
				{
					break;
				}
				case ItemClass::ITEM_CLASS_QUEST:
				{
					sellThis = true;
					stackCount = 1;
					if (proto->Stackable > 20)
					{
						stackCount = proto->Stackable;
					}
					break;
				}
				case ItemClass::ITEM_CLASS_KEY:
				{
					break;
				}
				case ItemClass::ITEM_CLASS_PERMANENT:
				{
					break;
				}
				case ItemClass::ITEM_CLASS_JUNK:
				{
					if (proto->Quality > 0)
					{
						sellThis = true;
						stackCount = proto->Stackable;
					}
					break;
				}
				default:
				{
					break;
				}
				}
				if (!sellThis)
				{
					sellingIndex++;
					continue;
				}
				for (std::set<uint32>::iterator ahIDIT = auctionHouseIDSet.begin(); ahIDIT != auctionHouseIDSet.end(); ahIDIT++)
				{
					uint32 ahID = *ahIDIT;
					AuctionHouseEntry const* ahEntry = sAuctionHouseStore.LookupEntry(*ahIDIT);
					AuctionHouseObject* aho = sAuctionMgr.GetAuctionsMap(ahEntry);
					if (!aho)
					{
						sLog.outError("AuctionHouseObject is null");
						return false;
					}

					Item* item = Item::CreateItem(proto->ItemId, stackCount, NULL);
					if (item)
					{
						if (int32 randomPropertyId = item->GetItemRandomPropertyId())
						{
							item->SetItemRandomProperties(randomPropertyId);
						}
						uint32 finalPrice = 0;
						uint8 qualityMuliplier = 1;
						if (proto->Quality > 3)
						{
							qualityMuliplier = 2;
						}
						finalPrice = proto->SellPrice * stackCount * baseMultiple;
						if (finalPrice == 0)
						{
							finalPrice = proto->BuyPrice * stackCount * baseMultiple / 4;
						}
						if (finalPrice == 0)
						{
							break;
						}
						finalPrice = finalPrice * qualityMuliplier;
						if (finalPrice > 100)
						{
							uint32 dep = sAuctionMgr.GetAuctionDeposit(ahEntry, 86400, item);

							AuctionEntry* auctionEntry = new AuctionEntry;
							auctionEntry->Id = sObjectMgr.GenerateAuctionID();
							auctionEntry->auctionHouseEntry = ahEntry;
							auctionEntry->itemGuidLow = item->GetGUIDLow();
							auctionEntry->itemTemplate = item->GetEntry();
							auctionEntry->owner = 0;
							auctionEntry->startbid = finalPrice / 2;
							auctionEntry->buyout = finalPrice;
							auctionEntry->bidder = 0;
							auctionEntry->bid = 0;
							auctionEntry->deposit = dep;
							auctionEntry->depositTime = time(nullptr);
							auctionEntry->expireTime = (time_t)172800 + time(nullptr);
							item->SaveToDB();
							sAuctionMgr.AddAItem(item);
							aho->AddAuction(auctionEntry);
							auctionEntry->SaveToDB();

							sLog.outBasic("Auction %s added for auctionhouse %d", proto->Name1, ahID);
						}
					}
				}

				sellingIndex++;
			}
			else
			{
				sellingIndex = 0;
				selling = false;
				sLog.outBasic("Marketer selling finished");
				break;
			}
			checkTotalSellCount++;
		}
		sellerCheckDelay = IN_MILLISECONDS;
	}
	else if (MarketEmpty())
	{
		sellingIndex = 0;
		selling = true;
		sLog.outBasic("Marketer start selling");
	}
	else
	{
		sLog.outBasic("Marketer is not empty");
		sellerCheckDelay = 2 * HOUR * IN_MILLISECONDS;
	}

	return true;
}

bool MarketerManager::MarketEmpty()
{
	for (std::set<uint32>::iterator ahIDIT = auctionHouseIDSet.begin(); ahIDIT != auctionHouseIDSet.end(); ahIDIT++)
	{
		uint32 ahID = *ahIDIT;
		AuctionHouseEntry const* ahEntry = sAuctionHouseStore.LookupEntry(*ahIDIT);
		AuctionHouseObject* aho = sAuctionMgr.GetAuctionsMap(ahEntry);
		if (!aho)
		{
			sLog.outError("AuctionHouseObject is null");
			return false;
		}
		std::map<uint32, AuctionEntry*>* aem = aho->GetAuctions();
		for (std::map<uint32, AuctionEntry*>::iterator aeIT = aem->begin(); aeIT != aem->end(); aeIT++)
		{
			Item* checkItem = sAuctionMgr.GetAItem(aeIT->second->itemGuidLow);
			if (!checkItem)
			{
				continue;
			}
			if (aeIT->second->owner == 0)
			{
				return false;
			}
		}
	}
	return true;
}

bool MarketerManager::UpdateBuyer()
{
	buyerCheckDelay = HOUR * IN_MILLISECONDS;
	// EJ debug 
	//buyerCheckDelay = 60000;

	sLog.outBasic("Ready to update marketer buyer");

	std::set<uint32> toBuyAuctionIDSet;
	for (std::set<uint32>::iterator ahIDIT = auctionHouseIDSet.begin(); ahIDIT != auctionHouseIDSet.end(); ahIDIT++)
	{
		uint32 ahID = *ahIDIT;
		AuctionHouseEntry const* ahEntry = sAuctionHouseStore.LookupEntry(*ahIDIT);
		AuctionHouseObject* aho = sAuctionMgr.GetAuctionsMap(ahEntry);
		if (!aho)
		{
			sLog.outError("AuctionHouseObject is null");
			return false;
		}
		toBuyAuctionIDSet.clear();
		std::map<uint32, AuctionEntry*>* aem = aho->GetAuctions();
		for (std::map<uint32, AuctionEntry*>::iterator aeIT = aem->begin(); aeIT != aem->end(); aeIT++)
		{
			Item* checkItem = sAuctionMgr.GetAItem(aeIT->second->itemGuidLow);
			if (!checkItem)
			{
				continue;
			}
			if (aeIT->second->owner == 0)
			{
				continue;
			}
			const ItemPrototype* destIT = sObjectMgr.GetItemPrototype(aeIT->second->itemTemplate);
			if (destIT->SellPrice == 0 && destIT->BuyPrice == 0)
			{
				continue;
			}
			if (destIT->Quality < 1)
			{
				continue;
			}
			if (destIT->Quality > 4)
			{
				continue;
			}
			if (vendorUnlimitItemSet.find(aeIT->second->itemTemplate) != vendorUnlimitItemSet.end())
			{
				continue;
			}
			uint8 buyThis = 1;
			uint32 baseMultiple = 5;
			if (!destIT)
			{
				continue;
			}
			switch (destIT->Class)
			{
			case ItemClass::ITEM_CLASS_CONSUMABLE:
			{
				buyThis = urand(0, 5);
				break;
			}
			case ItemClass::ITEM_CLASS_CONTAINER:
			{
				if (destIT->Quality > 2)
				{
					buyThis = 0;
				}
				else if (destIT->Quality == 2)
				{
					buyThis = urand(0, 5);
				}
				break;
			}
			case ItemClass::ITEM_CLASS_WEAPON:
			{
				if (destIT->Quality > 2)
				{
					buyThis = 0;
				}
				else if (destIT->Quality == 2)
				{
					buyThis = urand(0, 5);
				}
				break;
			}
			case ItemClass::ITEM_CLASS_GEM:
			{
				buyThis = 0;
				break;
			}
			case ItemClass::ITEM_CLASS_ARMOR:
			{
				if (destIT->Quality > 2)
				{
					buyThis = 0;
				}
				else if (destIT->Quality == 2)
				{
					buyThis = urand(0, 5);
				}
				break;
			}
			case ItemClass::ITEM_CLASS_REAGENT:
			{
				buyThis = urand(0, 5);
				break;
			}
			case ItemClass::ITEM_CLASS_PROJECTILE:
			{
				buyThis = urand(0, 10);
				break;
			}
			case ItemClass::ITEM_CLASS_TRADE_GOODS:
			{
				buyThis = 0;
				baseMultiple = 10;
				break;
			}
			case ItemClass::ITEM_CLASS_GENERIC:
			{
				break;
			}
			case ItemClass::ITEM_CLASS_RECIPE:
			{
				buyThis = 0;
				break;
			}
			case ItemClass::ITEM_CLASS_MONEY:
			{
				break;
			}
			case ItemClass::ITEM_CLASS_QUIVER:
			{
				if (destIT->Quality > 2)
				{
					buyThis = 0;
				}
				else if (destIT->Quality == 2)
				{
					buyThis = urand(0, 5);
				}
				break;
			}
			case ItemClass::ITEM_CLASS_QUEST:
			{
				buyThis = urand(0, 5);
				break;
			}
			case ItemClass::ITEM_CLASS_KEY:
			{
				break;
			}
			case ItemClass::ITEM_CLASS_PERMANENT:
			{
				break;
			}
			default:
			{
				break;
			}
			}
			if (buyThis != 0)
			{
				continue;
			}
			uint32 basePrice = 0;
			uint32 maxAcceptPrice = 0;
			uint8 qualityMuliplier = 1;
			if (destIT->Quality > 3)
			{
				qualityMuliplier = 2;
			}
			uint32 finalPrice = 0;
			if (destIT->SellPrice > 0)
			{
				finalPrice = destIT->SellPrice * checkItem->GetCount();
			}
			else
			{
				finalPrice = destIT->BuyPrice * checkItem->GetCount();

			}
			finalPrice = finalPrice * qualityMuliplier * baseMultiple;
			uint32 buyRate = aeIT->second->buyout * 10 / finalPrice;
			if (aeIT->second->buyout > finalPrice)
			{
				buyRate = buyRate * buyRate;
			}
			if (urand(0, buyRate) == 0)
			{
				toBuyAuctionIDSet.insert(aeIT->first);
			}
		}

		for (std::set<uint32>::iterator toBuyIT = toBuyAuctionIDSet.begin(); toBuyIT != toBuyAuctionIDSet.end(); toBuyIT++)
		{
			AuctionEntry* destAE = aho->GetAuction(*toBuyIT);
			if (destAE)
			{
				destAE->bid = destAE->buyout;

				sAuctionMgr.SendAuctionSuccessfulMail(destAE);
				sAuctionMgr.SendAuctionWonMail(destAE);
				sAuctionMgr.RemoveAItem(destAE->itemGuidLow);
				aho->RemoveAuction(destAE);
				destAE->DeleteFromDB();
				delete destAE;
				sLog.outBasic("Auction %d was bought by marketer buyer", *toBuyIT);
			}
		}
	}

	sLog.outBasic("Marketer buyer updated");
	return true;
}
