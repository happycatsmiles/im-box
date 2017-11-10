# IM Box

Sending an IM causes scripts to sleep for two seconds.
For the cases where this is an unacceptable delay,
this script (which doesn't have to be in a box)
listens for message events and sends the IMs
on behalf of the sending script.

If messages are coming in too fast, they'll be dropped.

## The Protocol

The IM Box expects the following three pieces of data:

1.  Object Name - This is the name of the object to use when sending.
2.  Agent Name - This is the UUID of the avatar to send the IM to.
3.  Message - This is the message to send.

These should be concatenated together with IM_BOX_SEP as a separator.

e.g.
```
#include "tools/im-box/lib/separator.lsl"
string message = llDumpList2String([a, b, c], IM_BOX_SEP);
```

## The Pieces

The pieces come in a region and link version.
The region version is for a single listener for the entire region.
The link version listens for link messages.

### im-box-*

This is the script that listens for messages and sends the IMs.

It comes in the following flavors:

1.  `im-box-link.lsl` - This script listens for link messages only.
2.  `im-box-region.lsl` - This script listens for region messages only.
3.  `im-box-combined.lsl` - This script listens for both types of messages.

### send-im-*

This is a convenient function for sending messages.

`send_im(string object_name, key agent, string message)`

It comes in two flavors:

1.  `tools/lib/send-im-link.lsl` - This sends link messages.
2.  `tools/lib/send-im-region.lsl` - This sends region messages.
