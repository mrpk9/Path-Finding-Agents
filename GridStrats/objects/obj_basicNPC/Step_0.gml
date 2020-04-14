


if(global.gamePause == false)
{
	//path_speed = lastPathSpeed;
	
	#region Old Stuff
	/*
	path_speed = lastPathSpeed;
	ticks++;
	if(ticks/room_speed >= thinkTime) //Main Internal Thinking Clock
	{
		ticks = 0;
		trackHP = hp;
		think++;
		ds_grid_sort(targetList, COLUMN_DISTANCE, false);
		
		
	
	#region Persistent Events
	
	#region Health Events
	if(hp < trackHP) //Trigger Thinking if damage taken
	{
		ticks = room_speed * thinkTime;	
	}
	else if(hp > trackHP) //If Heal, update trackHP
	{
		trackHP = hp;
	}	
	if(hp <= 0) //Kill Event
	{
		instance_destroy(id);	
	}
	#endregion
	
	#endregion
	}
	*/
	#endregion
	
	
	
}
else
{
	
	//lastPathSpeed = path_speed;
	//path_speed = 0;
	
}

#region Debug Variables
debug[0] = "ID: " + string(id);
debug[1] = "Selected: " + string(selected);


#endregion



