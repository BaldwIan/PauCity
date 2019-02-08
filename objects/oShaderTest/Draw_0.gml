shader_set(shXWave);
shader_set_uniform_f(sRPlace, 15.0 / distance_to_object(oPlayer));
shader_set_uniform_f(sGPlace, distance_to_object(oPlayer));
shader_set_uniform_f(sBPlace, 40.0 / distance_to_object(oPlayer));
shader_set_uniform_f(sAPlace, 90.0 / distance_to_object(oPlayer));
draw_self();
shader_reset();
