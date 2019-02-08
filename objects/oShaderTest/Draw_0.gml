shader_set(shRainbow);
shader_set_uniform_f(sRPlace, 15.0 / distance_to_object(oPlayer));
shader_set_uniform_f(sGPlace, 45.0 / distance_to_object(oPlayer));
shader_set_uniform_f(sBPlace, 2.0 / distance_to_object(oPlayer));
shader_set_uniform_f(sAPlace, 90.0 / distance_to_object(oPlayer));
draw_self();
shader_reset();
