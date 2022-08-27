function scr_toggleSelect(argument0) {
	//scr_addToSelectList(ds_list)
	if(ds_exists(argument0, ds_type_list))
	{
	#region Validate Selected Object
		objectsAtPoint = ds_list_create();
		collision_point_list(mouse_x, mouse_y, obj_selectable, false, true, objectsAtPoint, true);

		//Go through list and delete anything that is not selectable
		for(var i = 0; i < ds_list_size(objectsAtPoint); i++)
		{
			var currentObject = ds_list_find_value(objectsAtPoint, i);
			//If object is not selectable
			if(currentObject.selectable == false)
			{
				ds_list_delete(objectsAtPoint,i);
			}
	
		}
	#endregion
	
		if(!ds_list_empty(objectsAtPoint) )
		{
			/*
			if(ds_exists(selectedObjects, ds_type_list) && ds_list_find_index(objectsAtPoint, 0) == -1)
			{
				ds_list_add(argument0, ds_list_find_value(objectsAtPoint, 0));
			}
			*/
			var object = ds_list_find_value(objectsAtPoint, 0); //Object we clicked on
		
			//If object already selected, deselect it and delete from select list.
			if(object.selected) 
			{
				if(ds_list_empty(argument0))
				{
					show_message("Error: Toggle Select, List of selected objects expected to not be empty, but was.");
				}
				else
				{
					//Delete Object from Select List
					ds_list_delete(argument0, ds_list_find_index(argument0, object)); 
					object.selected = false; //Unselect It
				}
			}
			else //If object not selected, select it and add to select list.
			{
			
				ds_list_add(argument0, object);
				object.selected = true;
			}
		
		}
	
	}


}
