#include "tools/im-box/lib/channel.lsl"
#include "tools/im-box/lib/separator.lsl"

send_im(string object_name, key agent, string message)
{
    string packet = llDumpList2String([
        object_name,
        (string)agent,
        message
    ], IM_BOX_SEP);

    llRegionSay(IM_BOX_CHANNEL, packet);
}
