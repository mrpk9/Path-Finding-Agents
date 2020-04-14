if(global.debugMode == true)
{
	image_alpha = 255;	
}
else
{
	image_alpha = 0;	
}


if mp_grid_get_cell(global.grid, x div global.TILE_SIZE, y div global.TILE_SIZE) == -1
{
   image_blend = c_red;
}
else
{
   image_blend = c_lime;
}