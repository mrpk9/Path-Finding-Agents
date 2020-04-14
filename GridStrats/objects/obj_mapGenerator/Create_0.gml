global.gamePause = false;
selectable = false;
enum tileType {
	dirt,
	stone,
	grass,
	gold,
}
global.DEPTH_TILE = 0;
global.TILE_SIZE = 64; // Pixels

if(room_height mod global.TILE_SIZE != 0 || room_width mod global.TILE_SIZE != 0)
{
	show_message("Error: Map size must be divisable by 64 evenly.");
	instance_destroy(id);
}

traverseRight = 0;
traverseLeft = 1;
traverseDown = 2;
traverseUp = 3;

TILE_COLUMNS = room_width/global.TILE_SIZE;
TILE_ROWS = room_height/global.TILE_SIZE;

global.tileGrid = ds_grid_create(TILE_COLUMNS, TILE_ROWS);

show_debug_message("Map Generator Initialized.");
show_debug_message("Map will be a " + string(TILE_COLUMNS) + " by " + string(TILE_ROWS) + " grid.");
show_debug_message( "Seed: " + string(random_get_seed()) );


#region World Generation

show_debug_message("Generating Path Grid");
#region Path Finding Grid Generator
global.grid = mp_grid_create(0, 0, TILE_COLUMNS, TILE_ROWS, global.TILE_SIZE, global.TILE_SIZE);
#endregion
show_debug_message("Generating Paths Complete");

show_debug_message("Generating Tiles");
	#region Creating Tiles
	
for(var row = 0; row < TILE_ROWS; row++)
{
	
	for(var col = 0; col < TILE_COLUMNS; col++)
	{
		
		var xPos = col * global.TILE_SIZE;
		var yPos = row * global.TILE_SIZE;
		var currentTile = instance_create_depth(xPos, yPos, global.DEPTH_TILE, obj_tile);
		
		ds_grid_set(global.tileGrid, col, row, currentTile);
		
		#region Choosing Tile To Create
		var rand = random_range(0,1);
		if(rand >= 0.99)
		{
			currentTile.type = tileType.gold;
			currentTile.sprite_index = scr_tileGold;
		}
		else if(rand >= 0.6)
		{
			currentTile.type = tileType.stone;
			currentTile.sprite_index = scr_tileStone;
		}
		else if(rand >= 0.3)
		{
			currentTile.type = tileType.dirt;
			currentTile.sprite_index = scr_tileDirt;
		}
		else if(rand >= 0.0)
		{
			currentTile.type = tileType.grass;
			currentTile.sprite_index = scr_tileGrass;
		}
		#endregion
		
		show_debug_message("Generating " + string(col) + ", " + string(row));
		
	}
}


#endregion
show_debug_message("Generation Completed");



show_debug_message("Now Linking Tiles");
	#region Linking Tiles	
for(var row = 0; row < TILE_ROWS; row++)
{
	
	for(var col = 0; col < TILE_COLUMNS; col++)
	{
		var currentTile = ds_grid_get(global.tileGrid, col, row);
		if(col != 0)
		{
			var leftTile = ds_grid_get(global.tileGrid, col-1, row);
			currentTile.tileLeft = leftTile;
		}
		
		if(col != TILE_COLUMNS -1)
		{
			var rightTile = ds_grid_get(global.tileGrid, col+1, row);
			currentTile.tileRight = rightTile;
		}
		
		if(row != 0)
		{
			var topTile = ds_grid_get(global.tileGrid, col, row-1);
			currentTile.tileTop = topTile;
		}
		
		if(row != TILE_ROWS -1)
		{
			var bottomTile = ds_grid_get(global.tileGrid, col, row+1);
			currentTile.tileBottom = bottomTile;
		}
		
	}
	
}
	#endregion

	#region Testing Linked Tiles
	
	
	error = false;
	errorDirection = "";
	for(var traverseDirection = 0; traverseDirection < 4 && error == false; traverseDirection++)
	{
		//Testing will be done by traversing the grid in all four directions
		
		switch(traverseDirection)
		{
			case traverseRight:
								
				for(var row = 0; row < TILE_ROWS; row++) //Traverse Rows Downward
				{
					currentTile = ds_grid_get(global.tileGrid, 0, row);
					for(var col = 0; col < TILE_COLUMNS; col++) //Traverse Columns Rightward
					{
						// If Tile does not Match Tile in the Tile Grid
						if(currentTile != ds_grid_get(global.tileGrid, col, row))
						{
							error = true;
							errorDirection = "Traversing Right";
							show_debug_message("On Column " + string(col) + " and Row " + string(row) + ", there was an error.");
							show_debug_message("Expected " + string(ds_grid_get(global.tileGrid, col, row)) + " but got " + string(currentTile));
							break;
						}
						currentTile = currentTile.tileRight;
					}
					
				}
			
			break;
			
			case traverseLeft:
			
				for(var row = 0; row < TILE_ROWS; row++) //Traverse Rows Downward
				{
					currentTile = ds_grid_get(global.tileGrid, TILE_COLUMNS-1, row);
					for(var col = TILE_COLUMNS-1; col >= 0; col--) //Traverse Columns leftward
					{
						// If Tile does not Match Tile in the Tile Grid
						if(currentTile != ds_grid_get(global.tileGrid, col, row))
						{
							error = true;
							errorDirection = "Traversing Left";
							show_debug_message("On Column " + string(col) + " and Row " + string(row) + ", there was an error.");
							show_debug_message("Expected " + string(ds_grid_get(global.tileGrid, col, row)) + " but got " + string(currentTile));
							break;
						}
						currentTile = currentTile.tileLeft;
					}
					
				}			
			break;
			
			case traverseDown:
				for(var col = 0; col < TILE_COLUMNS; col++) //Traverse Columns Rightward
				{
					currentTile = ds_grid_get(global.tileGrid, col, 0);
					for(var row = 0; row < TILE_ROWS; row++) //Traverse Rows Downward
					{
						// If Tile does not Match Tile in the Tile Grid
						if(currentTile != ds_grid_get(global.tileGrid, col, row))
						{
							error = true;
							errorDirection = "Traversing Down";
							show_debug_message("On Column " + string(col) + " and Row " + string(row) + ", there was an error.");
							show_debug_message("Expected " + string(ds_grid_get(global.tileGrid, col, row)) + " but got " + string(currentTile));
							break;
						}
						currentTile = currentTile.tileBottom;
					}
					
				}		
			break;
			
			case traverseUp:
				for(var col = 0; col < TILE_COLUMNS; col++) //Traverse Columns Rightward
				{
					currentTile = ds_grid_get(global.tileGrid, col, TILE_ROWS-1);
					for(var row = TILE_ROWS-1; row >= 0; row--) //Traverse Rows Downward
					{
						// If Tile does not Match Tile in the Tile Grid
						if(currentTile != ds_grid_get(global.tileGrid, col, row))
						{
							error = true;
							errorDirection = "Traversing Up";
							show_debug_message("On Column " + string(col) + " and Row " + string(row) + ", there was an error.");
							show_debug_message("Expected " + string(ds_grid_get(global.tileGrid, col, row)) + " but got " + string(currentTile));
							break;
						}
						currentTile = currentTile.tileTop;
					}
					
				}	
			break;
		}
	}
	
	if(error == false)
	{
		show_debug_message("There were No Errors in Tile Linking.");
	}
	else
	{
		show_debug_message("There was an Error in " + errorDirection);
	}
	
	
	#endregion
show_debug_message("Linking Tiles Complete");	
#endregion


