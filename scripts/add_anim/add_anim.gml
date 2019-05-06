/// @arg cutscene
/// @arg actor_object
/// @arg action_type
/// @arg [data]

// Args
var cts_   = argument[0];
var actor_ = argument[1];
var atype_ = argument[2];
var data_ = argument[3];

// Array size
var size = array_length_2d(global.ctsAnims, cts_);

// Add
global.ctsAnims[cts_, size] = [actor_, atype_, data_];
