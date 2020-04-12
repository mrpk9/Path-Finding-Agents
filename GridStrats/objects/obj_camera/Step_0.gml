//Code taken from -> https://www.youtube.com/watch?v=Gj6bTqKIsLk

cx = camera_get_view_x(view_camera[0]);
cy = camera_get_view_y(view_camera[0]);

view_w = camera_get_view_width(view_camera[0]);
view_h = camera_get_view_height(view_camera[0]);

switch(mode){
	case cammode.follow_object :
		if(followObject != noone && instance_exists(followObject))
		{
			cx = followObject.x - (view_w/2);
			cy = followObject.y - (view_h/2);
		}
		else
		{
			mode = cammode.follow_mouse_border;
		}
	
	break;
	
	case cammode.follow_mouse_drag:
	
	break;
	
	case cammode.follow_mouse_border:
	
		if(!point_in_rectangle(mouse_x, mouse_y, cx+(view_w*0.1), cy+(view_h*0.1), cx+(view_w*0.9), cy+(view_h*0.9)))
		{
			cx = lerp(cx, mouse_x-(view_w/2), 0.05);
			cy = lerp(cy, mouse_y-(view_h/2), 0.05);
		}
	
	break;
	
	case cammode.follow_mouse_peek:
	
	break;
	
	case cammode.move_to_target:
	
	break;
	
	case cammode.move_to_follow_object:
	
	break;
}

if(!boundless)
{
	cx = clamp(cx, 0, room_width-view_w);
	cy = clamp(cy, 0, room_height-view_h);
}

camera_set_view_pos(view_camera[0], cx, cy);