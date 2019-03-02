
shader_set(shXWave);
shader_set_uniform_f(shTranslate, translateAmount);
draw_surface_ext(application_surface, 0, 0, 2, 2, 0, c_white, 0.4);
shader_reset();
