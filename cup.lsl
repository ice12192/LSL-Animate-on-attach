string MESSAGE = "Your consume message";


integer used = FALSE;

default
{
    attach(key id)
    {
        if (id)     // is a valid key and not NULL_KEY
        {
            if(used){
                llWhisper(0,"Sorry im empty.");
            } else {
                used = TRUE;
                llSay(0, MESSAGE);
                llRequestPermissions(llGetOwner(), PERMISSION_TRIGGER_ANIMATION);
            }
        }
    }
    run_time_permissions(integer perm)
    {
        if (perm & PERMISSION_TRIGGER_ANIMATION)
        {
            llStartAnimation(llGetInventoryName(INVENTORY_ANIMATION, 0));
            llSleep(5);
            llDetachFromAvatar();
        }
    }

    on_rez(integer num)
    {
        if(llGetAttached() == 0){
            llSay(0, "Please attach me to use");
        }
    }
}