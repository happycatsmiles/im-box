#include "tools/im-box/lib/send-im-link.lsl"

default
{
    touch_start(integer total_number)
    {
        send_im("Test IM via Link", llDetectedKey(0), "Hello, world.");
    }
}
