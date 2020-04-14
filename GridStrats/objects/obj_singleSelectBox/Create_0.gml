selectedInstances = ds_list_create();
collision_point_list(mouse_x, mouse_y, obj_selectable, false, true, selectedInstances, true);

//Go through list and delete anything that is not selectable
for(var i = 0; i < ds_list_size(selectedInstances); i++)
{
	var currentObject = ds_list_find_value(selectedInstances, i);
	if(currentObject.selectable == false)
	{
		ds_list_delete(selectedInstances,i);
	}
	
}

if(ds_exists(obj_player.selectedObjects, ds_type_list))
{
	ds_list_add(obj_player.selectedObjects, ds_list_find_value(selectedInstances, 0));
}
