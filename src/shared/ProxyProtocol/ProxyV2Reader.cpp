#include "ProxyV2Reader.h"
#include "Log.h"

#include <cstring>

#if defined(__linux__) || defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
#include <arpa/inet.h> // for ntohs
#endif

// GCC have alternative #pragma pack(N) syntax and old gcc version not support pack(push,N), also any gcc version not support it at some platform
#if defined( __GNUC__ )
#pragma pack(1)
#else
#pragma pack(push,1)
#endif

struct proxy_hdr_v2 {
    uint8_t sig[12];  /* hex 0D 0A 0D 0A 00 0D 0A 51 55 49 54 0A */
    uint8_t ver_cmd;  /* protocol version and command */
    uint8_t fam;      /* protocol family and address */
    uint16_t len;     /* number of following bytes part of the header */
};

union proxy_addr {
    struct {        /* for TCP/UDP over IPv4, len = 12 */
        uint32_t src_addr;
        uint32_t dst_addr;
        uint16_t src_port;
        uint16_t dst_port;
    } ipv4_addr;
    struct {        /* for TCP/UDP over IPv6, len = 36 */
        uint8_t  src_addr[16];
        uint8_t  dst_addr[16];
        uint16_t src_port;
        uint16_t dst_port;
    } ipv6_addr;
    struct {        /* for AF_UNIX sockets, len = 216 */
        uint8_t src_addr[108];
        uint8_t dst_addr[108];
    } unix_addr;
};

// GCC have alternative #pragma pack() syntax and old gcc version not support pack(pop), also any gcc version not support it at some platform
#if defined( __GNUC__ )
#pragma pack()
#else
#pragma pack(pop)
#endif


// Read protocol doc at https://www.haproxy.org/download/1.8/doc/proxy-protocol.txt (2.2. Binary header format (version 2)).
void ProxyProtocol::ReadProxyV2Handshake(IO::Networking::AsyncSocket* socket, std::function<void(nonstd::expected<IO::Networking::IpAddress, IO::NetworkError> const&)> const& callback)
{
    std::shared_ptr<proxy_hdr_v2> proxyHeader(new proxy_hdr_v2());
    socket->Read((char*)(proxyHeader.get()), sizeof(proxyHeader), [socket, callback, proxyHeader](IO::NetworkError const& error, size_t)
    {
        if (error)
        {
            callback(nonstd::make_unexpected(error));
            return;
        }

        constexpr uint8_t expectedSignature[12] = { 0x0D, 0x0A, 0x0D, 0x0A, 0x00, 0x0D, 0x0A, 0x51, 0x55, 0x49, 0x54, 0x0A };
        // Check if we have a valid signature
        if (std::memcmp(proxyHeader->sig, expectedSignature, sizeof(expectedSignature)) != 0)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ProxyV2 invalid signature");
            callback(nonstd::make_unexpected(IO::NetworkError(IO::NetworkError::ErrorType::InvalidProtocolBehavior)));
            return;
        }

        // Check version
        if ((proxyHeader->ver_cmd >> 4) != 2) // we only support proxy v2
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ProxyV2 unexpected version");
            callback(nonstd::make_unexpected(IO::NetworkError(IO::NetworkError::ErrorType::InvalidProtocolBehavior)));
            return;
        }

        // Check command
        constexpr uint8_t PROXY_V2_CMD_PROXY = 1;
        if ((proxyHeader->ver_cmd & 0x0F) != PROXY_V2_CMD_PROXY)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ProxyV2 unexpected cmd");
            callback(nonstd::make_unexpected(IO::NetworkError(IO::NetworkError::ErrorType::InvalidProtocolBehavior)));
            return;
        }

        // Check if we have IPv4_TCP which is currently the only one supported by the vanilla client
        constexpr uint8_t PROXY_V2_TCP_OVER_IPV4 = 0x11;
        if (proxyHeader->fam != PROXY_V2_TCP_OVER_IPV4)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ProxyV2 unexpected familyAndProtocol");
            callback(nonstd::make_unexpected(IO::NetworkError(IO::NetworkError::ErrorType::InvalidProtocolBehavior)));
            return;
        }

        // Unexpected body size
        uint16_t headerLength = ntohs(proxyHeader->len);
        if (headerLength != sizeof(proxy_addr::ipv4_addr))
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ProxyV2 unexpected body size");
            callback(nonstd::make_unexpected(IO::NetworkError(IO::NetworkError::ErrorType::InvalidProtocolBehavior)));
            return;
        }

        // Now we can read the actual payload
        std::shared_ptr<proxy_addr> addressBody(new proxy_addr());
        socket->Read((char*)(addressBody.get()), headerLength, [callback, addressBody](IO::NetworkError const& error, size_t)
        {
            if (error)
            {
                callback(nonstd::make_unexpected(error));
                return;
            }
            IO::Networking::IpAddress ipAddress = IO::Networking::IpAddress::FromIpv4Uint32(ntohl(addressBody->ipv4_addr.src_addr));
            callback(ipAddress);
        });
    });
}
