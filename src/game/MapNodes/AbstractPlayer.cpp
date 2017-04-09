#include "AbstractPlayer.h"
#include "Player.h"
#include "MasterPlayer.h"

template <typename T>
ObjectGuid PlayerWrapper<T>::GetObjectGuid() const { return player.GetObjectGuid(); }
template <typename T>
Team PlayerWrapper<T>::GetTeam() const { return player.GetTeam(); }
template <typename T>
const char* PlayerWrapper<T>::GetName() const { return player.GetName(); }
template <typename T>
uint32 PlayerWrapper<T>::GetZoneId() const { return player.GetZoneId(); }
template <typename T>
uint32 PlayerWrapper<T>::GetAreaId() const { return player.GetAreaId(); }
template <typename T>
uint32 PlayerWrapper<T>::GetCachedZoneId() const { return player.GetCachedZoneId(); }
template <typename T>
uint8 PlayerWrapper<T>::getClass() const { return player.getClass(); }
template <typename T>
uint8 PlayerWrapper<T>::getRace() const { return player.getRace(); }
template <typename T>
uint32 PlayerWrapper<T>::getLevel() const { return player.getLevel(); }
template <typename T>
bool PlayerWrapper<T>::isAFK() const { return player.isAFK(); }
template <typename T>
bool PlayerWrapper<T>::isDND() const { return player.isDND(); }
template <typename T>
bool PlayerWrapper<T>::isGameMaster() const { return player.isGameMaster(); }
template <typename T>
uint8 PlayerWrapper<T>::chatTag() const { return player.chatTag(); }
template <typename T>
uint32 PlayerWrapper<T>::GetGuildId() const { return player.GetGuildId(); }
template <typename T>
WorldSession* PlayerWrapper<T>::GetSession() const { return player.GetSession(); }
template <typename T>
PlayerSocial* PlayerWrapper<T>::GetSocial() const { return player.GetSocial(); }
template <typename T>
void PlayerWrapper<T>::JoinedChannel(Channel* c) { player.JoinedChannel(c); }
template <typename T>
void PlayerWrapper<T>::LeftChannel(Channel* c) { player.LeftChannel(c); }

template <typename T>
bool PlayerWrapper<T>::ok() const { return (&player) != NULL; }

// Specializations
template <>
Player* PlayerWrapper<Player>::ToPlayer() const { return &player; }
template <>
MasterPlayer* PlayerWrapper<Player>::ToMasterPlayer() const { return NULL; }

template <>
Player* PlayerWrapper<MasterPlayer>::ToPlayer() const { return NULL; }
template <>
MasterPlayer* PlayerWrapper<MasterPlayer>::ToMasterPlayer() const { return &player; }

// Instanciate classes
template class PlayerWrapper<Player>;
template class PlayerWrapper<MasterPlayer>;
