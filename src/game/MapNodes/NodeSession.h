#ifndef NODESESSION_H
#define NODESESSION_H

#include <string>
#include <list>
#include <unordered_map>

#include "MapSocket.h"
#include "NodesOpcodes.h"
#include "ObjectGuid.h"

class MapSocket;
class WorldSocket;
class WorldSession;
class Player;

class NodeSession
{
public:
    NodeSession(MapSocket* sock);
    ~NodeSession() {}

    /**
     * @brief Process Node update. The server is doing nothing else in parallel, so it is safe to do anything.
     *  NodeSession should not make slow computations inside this function.
     * @param diff
     * @return false if the session must be deleted
     */
    bool SafeUpdate(uint32 diff);
    /**
     * @brief Process Node update. The server may be updating maps or other things when this function is called.
     *  This function is called more often than NodeSession::SafeUpdate.
     * @param diff
     * @return false if the session must be deleted
     */
    void UnsafeUpdate(uint32 diff);

    void SendPacket(NodesOpcodesList opcode);
    void SendPacket(NodesOpcodesList opcode, uint32 data1);
    void SendPacket(WorldPacket const* packet);
    void QueuePacket(WorldPacket* packet);

    void SetName(std::string const& s) { m_name = s; }
    const char* GetName() const { return m_name.c_str(); }
    bool IsConnectedToMaster() const { return m_isConnectedToMaster; }
    bool IsReady() const { return m_isReady; }

    /**
     * @brief Closes the connection, disconnect players.
     */
    void Close();

    // Game functions
    // TODO: Lock this
    uint32 GenerateItemLowGuid() { return itemGuidsGenerator.Generate(); }
    uint32 GeneratePetNumber() { return petGuidsGenerator.Generate(); }

    /**
     * @brief Transmits the session to the Node server, allowing us to load players afterwards.
     * @param wsess
     */
    void LoadSession(WorldSession* wsess);
    /**
     * @brief Logins given player guid to the node. The session should be already loaded on the Node.
     * @param wsess
     * @param playerGuid
     */
    void LoginPlayer(WorldSession* wsess, ObjectGuid playerGuid);
    /**
     * @brief Transfers the given player to the Node (after a serialization).
     * The Node will not need to reload everything from DB.
     * @param wsess
     * @param player
     */
    void SendPlayer(WorldSession* wsess, Player* player);

    /**
     * @brief Sends given $packet to $accountId player.
     *  Only call if connected to a master.
     * @param accountId
     * @param packet
     */
    void SendPacketToGameClient(uint32 accountId, WorldPacket const* packet);

    /**
     * @brief Sends client $packet to $accountId session on the node/master
     * @param accountId
     * @param packet
     */
    void ForwardClientPacket(uint32 accountId, WorldPacket const* packet);

    /**
     * @brief When the client is disconnected from the Master, call this function
     *  to inform the Node to schedule logout of the player.
     * @param accountId
     */
    void SendDisconnectedFromMaster(uint32 accountId);

    // Handlers
    void HandleNull(WorldPacket& ) {}
    void HandleMasterHello(WorldPacket& pkt);
    void HandleNodeHello(WorldPacket& pkt);
    void HandleRequestFreeGuidsItems(WorldPacket& pkt);
    void HandleRequestFreeGuidsPets(WorldPacket& pkt);
    void HandleAddFreeGuidsItems(WorldPacket& pkt);
    void HandleAddFreeGuidsPets(WorldPacket& pkt);
    void HandleSendPacketToSession(WorldPacket& pkt);
    void HandleForwardClientPacket(WorldPacket& pkt);
    void HandleLoadSession(WorldPacket& pkt);
    void HandleLoadPlayerFromDB(WorldPacket& pkt);
    void HandleLoadPlayerSerialized(WorldPacket& pkt);
    void HandleSessionSocketClosed(WorldPacket& pkt);
    void HandleSessionLogoutComplete(WorldPacket& pkt);
protected:
    void ReadPacketForward(WorldPacket& rcvPacket, WorldPacket& forwardedPacket, uint32& session);
    void WritePacketForward(WorldPacket& sendPacket, WorldPacket const& forwardedPacket, uint32 const& session);

    void ProcessPacketsByType(uint32 type);
    void ProcessPacket(WorldPacket* packet);

    MapSocket*      m_socket;
    ACE_Based::LockedQueue<WorldPacket*, ACE_Thread_Mutex> m_recvQueue[NODE_MAX_PROCESS_TYPE];
    uint32          m_lastReceivedPacketTime;
    std::string     m_name;
    bool            m_isConnectedToMaster;
    bool            m_isReady;

    ACE_RW_Mutex    m_socketsLock;
    typedef std::unordered_map<uint32, WorldSocket*> SocketsMap;
    SocketsMap      m_accountSockets;

    struct GuidsGenerator
    {
        GuidsGenerator(uint32 minFreeGuids) : m_newGuidsRequestSent(false), m_minFreeGuids(minFreeGuids), m_freeGuidsCount(0) {}

        void ReadFreeGuids(WorldPacket& pkt);
        uint32 Generate();
        bool ShouldRequestNewGuids()
        {
            if (m_newGuidsRequestSent || m_freeGuidsCount > m_minFreeGuids)
                return false;
            m_newGuidsRequestSent = true;
            return true;
        }

        typedef std::pair<uint32, uint32> GuidsRange;
        std::list<GuidsRange> m_freeGuids;
        bool m_newGuidsRequestSent;
        uint32 m_freeGuidsCount;
        uint32 m_minFreeGuids;
    };
    GuidsGenerator itemGuidsGenerator;
    GuidsGenerator petGuidsGenerator;
};

#endif // NODESESSION_H
