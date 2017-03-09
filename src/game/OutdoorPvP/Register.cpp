#include "World.h"

void AddSC_outdoorpvp_ep();
void AddSC_outdoorpvp_si();

void RegisterZoneScripts()
{
    if (sWorld.getConfig(CONFIG_BOOL_OUTDOORPVP_EP_ENABLE))
        AddSC_outdoorpvp_ep();
    if (sWorld.getConfig(CONFIG_BOOL_OUTDOORPVP_SI_ENABLE))
        AddSC_outdoorpvp_si();
}
