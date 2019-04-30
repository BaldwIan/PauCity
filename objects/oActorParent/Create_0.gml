// Get tile map id
var layer_id = layer_get_id("Collision");
collision_tile_map_id = layer_tilemap_get_id(layer_id);

// Movement vars
velocity_ = [0, 0];
gravity_ = 1.8;
jumpSpd = 32;
maxVelocity = [5, 32];
acceleration = 2;
onGround = tile_collide_at_points(collision_tile_map_id, [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom]);
initWalkAnimSpeed = image_speed;
xInput = 0;

// Sprites
sprIdle = sCPlayerIdle;
sprWalk = sCPlayerIdle;
sprJump = sCPlayerJump;
sprFall = sCPlayerFall;
