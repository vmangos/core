#ifndef NODESMGR_H
#define NODESMGR_H

#include <vector>
#include <string>
#include <unordered_map>

#include "Common.h"

class NodeSession;
class ChatHandler;

class NodesMgr
{
public:
    bool OnServerStartup();
    void OnServerShutdown();
    void OnWorldUpdate(uint32 diff);

    void RegisterNode(NodeSession* s) { m_nodes[m_nodeIdx++] = s; }

    std::string const& GetServerName() const { return m_serverName; }

    static NodesMgr* instance()
    {
        static NodesMgr m;
        return &m;
    }
    // GM commands
    NodeSession* GetNodeById(uint32 id);
    void ListServers(ChatHandler& handler);
    bool TryConnectToMaster();

protected:
    typedef std::unordered_map<uint32, NodeSession*> NodesMap;
    NodesMap                    m_nodes;
    std::string                 m_serverName;
    uint32                      m_nodeIdx;
    uint32                      m_masterListenPort;
    std::string                 m_masterListenAddress;
};

#define sNodesMgr (NodesMgr::instance())

#endif // NODESMGR_H
