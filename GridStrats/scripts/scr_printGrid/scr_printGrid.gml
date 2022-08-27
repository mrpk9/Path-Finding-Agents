///scr_printGrid(ds_grid ID)
function scr_printGrid(argument0) {
	/*
		This script prints out an entire grid. 

	*/

	var result = "";
	if(ds_exists(argument0, ds_type_grid))
	{
		for(var row = 0; row < ds_grid_height(argument0); row++)
		{
			result += string(scr_printGridRow(argument0, row));
			result += "#";
		}
	}
	return result;


}
