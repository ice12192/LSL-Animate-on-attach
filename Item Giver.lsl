default
{
    touch_start(integer number)
    {
    	// Make sure to only give item to owner
        if(llDetectedKey(0) == llGetOwner()){
        	string item_name = llGetInventoryName(INVENTORY_OBJECT, 0);
			llGiveInventory(llDetectedKey(0), item_name);
			if(llGetInventoryNumber(INVENTORY_OBJECT) == 0){
				llSay(0, "I am used up");
				llDie();				
			}        	
        }
    }
    on_rez(integer num)
    {
		if(llGetInventoryNumber(INVENTORY_OBJECT) == 0){
			llSay(0, "I am used up");
			llDie();				
		}    	
    }
}