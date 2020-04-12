///scr_printDebugVariables(debug array)
/*
	This script prints out all debug variables in an object, on top.

*/
if(is_array(argument0))
{
	#region Debug Variables
	var debugOffset = sprite_height/2 + 20;
	var debugTextSpace = 15;
	var debugTextX = 0;
	var debugTextY = 0;

	#endregion

	for(var i = 0; i < array_length_1d(argument0); i++)
	{
		debugTextX = x - (sprite_width/2);
		debugTextY = y -  debugOffset - (debugTextSpace * i);
		draw_text(debugTextX, debugTextY, string(argument0[i]));
	}
}