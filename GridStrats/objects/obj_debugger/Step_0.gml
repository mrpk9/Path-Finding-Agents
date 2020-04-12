#region Debug Handeling

#region Toggle Debug
global.pressR = keyboard_check_released(ord("R"));
if(global.pressR && global.debugMode == false)
{
	global.debugMode = true;	
}
else if(global.pressR && global.debugMode)
{
	global.debugMode = false;
}
#endregion

#region Debug Variables
/*
global.debug[0] = "Artificial Idiocy (" + string(fps) + " fps )";
global.debug[1] = "";
global.debug[2] = "obj_superKeeper Variables";
global.debug[3] = "Paused? : " + string(global.gamePause);
global.debug[6] = "Mouse: " + scr_displayCords(mouse_x,mouse_y);
global.debug[7] = "Number of NPC's: " + string(instance_number(obj_NPC));
*/

#endregion


#endregion