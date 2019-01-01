///@param tile_map_id
///@param point_arrays
var tile_map_id = argument[0];

var found = false;

// for point arrays
var vector2X = 0;
var vector2Y = 1;

// Loop through the ponits and check for a tile
for (var i = 1; i < argument_count; i++)
{
	var point = argument[i];
	found = found || tilemap_get_at_pixel(tile_map_id, point[vector2X], point[vector2Y]);
}

return found;
