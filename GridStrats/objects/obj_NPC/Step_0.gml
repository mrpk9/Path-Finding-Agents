#region If Game Unpaused
if(global.gamePause == false)
{
	path_speed = lastPathSpeed;
	
	
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
	/*
	if(global.pressM1 && point_in_circle(mouse_x, mouse_y, x, y, 16))
	{
		selected = true;
	}
	*/
}
#endregion

#region If Game is Paused 
else 
{
	
	lastPathSpeed = path_speed;
	path_speed = 0;
	
}
#endregion

#region Persistant
//Outdated System
//image_angle = direction; //Align Sprite with Direction

#endregion

#region Notes
/*

Where I learned Inheritance: https://www.youtube.com/watch?v=7hVLf_0GtHI



*/
#endregion
