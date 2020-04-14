/// @description Where the Magic Happens


#region Key Recognition

global.pressD = keyboard_check(ord("D"));
global.pressA = keyboard_check(ord("A"));
global.pressS = keyboard_check(ord("S"));
global.pressW = keyboard_check(ord("W"));

global.pressR = keyboard_check_released(ord("R")); 
global.pressF = keyboard_check_released(ord("F")); 

global.pressLArrow = keyboard_check(vk_left); 
global.pressRArrow = keyboard_check(vk_right);
global.pressUArrow = keyboard_check(vk_up);
global.pressDArrow = keyboard_check(vk_down);

global.pressEnter = keyboard_check_released(vk_enter);
global.pressSpace = keyboard_check_released(vk_space);
global.pressCTRL = keyboard_check(vk_lcontrol);
global.pressESC = keyboard_check_released(vk_escape);
global.pressM1 = mouse_check_button_released(mb_left);
global.pressM2 = mouse_check_button_released(mb_right);

#endregion



#region If Player Active
if(global.gamePause == false)
{
	
	#region Unit Select
	if(global.pressM1 && global.pressCTRL)
	{
		scr_toggleSelect(selectedObjects); //Debug
		show_debug_message("Currently Selected: "+scr_printList(selectedObjects));
	}
	else if(global.pressM1)
	{
		scr_deselectObjects(selectedObjects);		
		scr_toggleSelect(selectedObjects);
		show_debug_message("Currently Selected: "+scr_printList(selectedObjects)); //Debug
		
	}
	#endregion
	
	#region Grid Select
	
	if(global.pressM2)
	{
			
	}
	
	#endregion
	
}
#endregion

#region If Player Inactive
else
{

	
}
#endregion

#region Debug Variables

debug[0] = "ID: " + string(id);

#endregion


