
offset = 32;
rowLimit = round(room_height/global.TILE_SIZE);
columnLimit = round(room_width/global.TILE_SIZE);

for(r = 0; r < rowLimit; r++)
{
	for(c = 0; c < columnLimit; c++)
	{
		spawnX = offset + (global.TILE_SIZE*c); 
		spawnY = offset + (global.TILE_SIZE*r);
		instance_create_depth(spawnX, spawnY, -1, obj_gridCell);
	}
}
selectable = false;

#region Debug Variables

debugOffset = 0;
debugTextSpace = 15;
debugTextX = 0;
debugTextY = 0;

#endregion