///scr_selectGridCell(int ID)
/*
	This Script figures out what grid cell you right click on and stores it in a variable.
*/
var tempList = ds_list_create();
collision_point_list(mouse_x, mouse_y, obj_tile, false, true, tempList, true);
var object = ds_list_find_value(tempList, 0);
ds_list_destroy(tempList);

