#include "tools/im-box/lib/channel.lsl"
#include "tools/im-box/lib/separator.lsl"

string separator;

parse_and_send(string message)
{
    list parts = llParseStringKeepNulls(message, [separator], []);
    string object_name = llList2String(parts, 0);
    key agent = (key)llList2String(parts, 1);
    if(agent); else return; // Can't send to an agent if the key doesn't exist.
    message = llList2String(parts, 2);
    if(message == "") return; // Can't send an empty message.

    string original_name = llGetObjectName();
    llSetObjectName(object_name);
    llInstantMessage(agent, message);
    llSetObjectName(original_name);
}

default
{
    link_message(integer sender_num, integer num, string str, key id)
    {
        //llOwnerSay("received via link_message " + str);
        if(num == IM_BOX_CHANNEL)
            parse_and_send(str);
    }

    state_entry()
    {
        separator = IM_BOX_SEP;
    }
}
