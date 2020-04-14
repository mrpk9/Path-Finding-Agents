global.pressP = keyboard_check_released(ord("P"));
if(global.pressP && global.gamePause == false)
{
	global.gamePause = true;	
}
else if(global.pressP && global.gamePause)
{
	global.gamePause = false;
}

global.pressM1 = mouse_check_button(mb_left);
global.pressM2 = mouse_check_button(mb_right);