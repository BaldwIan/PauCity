if (os_browser == browser_not_a_browser)
{
	shader_set(shXWave);
	shader_set_uniform_f(shTranslate, translateAmount);
	draw_surface_ext(application_surface, 0, 0, 2, 2, 0, c_white, 0.2);
	shader_reset();
}
