function scr_printList(argument0) {

	var output = "";
	if(ds_exists(argument0, ds_type_list))
	{
		for(var element = 0; element < ds_list_size(argument0); element++)
		{
			output += string(ds_list_find_value(argument0, element)) + ", ";
		}
	}
	return output;


}
