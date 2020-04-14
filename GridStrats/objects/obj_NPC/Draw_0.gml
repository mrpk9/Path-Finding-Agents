draw_self();
if(path_exists(currentPath) && global.debugMode)
{
	draw_path(currentPath, x, y, false);
}

if(selected == true)
{
	draw_circle(x,y,20,true);	
}