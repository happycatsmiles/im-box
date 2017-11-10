#include "tools/im-box/lib/send-im-region.lsl"

default
{
    touch_start(integer total_number)
    {
        send_im("Test IM via Region", llDetectedKey(0), "Hello, world.");
    }
}
