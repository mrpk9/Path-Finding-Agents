///scr_printGridRow(ds_grid ID, row number)
/*
	This script prints out an entire row of a grid. Thats it really

*/
var result = "";
if(ds_exists(argument0, ds_type_grid))
{
	for(var col = 0; col < ds_grid_width(argument0); col++)
	{
		result += string(ds_grid_get(argument0,col,argument1));
	
		if(col != ds_grid_width(argument0) - 1)
		{
			result += ", ";
		}
	
	}
}
return result;