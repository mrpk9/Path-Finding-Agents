if(global.debugMode = true)
{
	draw_set_alpha(1); // After All Rendering Done, reset alpha.
	draw_set_colour(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_debug);
	
	
	
	with(obj_NPC)
	{
		scr_printDebugVariables(obj_NPC.debug);	
	}
	
	
}
