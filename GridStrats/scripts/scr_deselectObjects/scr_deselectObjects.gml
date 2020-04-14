///scr_deselectObjects(ds_list)

if(ds_exists(argument0, ds_type_list) && !(ds_list_empty(argument0)))
{
	for(var i = 0; i < ds_list_size(argument0); i++)
	{
		var currentEntity = ds_list_find_value(argument0,i);
		currentEntity.selected = false;
	}
	ds_list_clear(selectedObjects); //Clear List
}
