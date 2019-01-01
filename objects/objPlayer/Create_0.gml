// Movement vars
velocity_ = [0, 0];
gravity_ = 1.5;
jumpSpd = 28;
maxVelocity = [8, 32];
acceleration = 2.1;


// Get tile map id
var layer_id = layer_get_id("Collision");
collision_tile_map_id = layer_tilemap_get_id(layer_id);
