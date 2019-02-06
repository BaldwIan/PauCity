// Shader
upixelH = shader_get_uniform(shOutline, "pixelH");
upixelW = shader_get_uniform(shOutline, "pixelW");
texelW = 2*texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = 2*texture_get_texel_height(sprite_get_texture(sprite_index, 0));

// Journal Info
title = "Test Pickup";
content = "";
date = "";
author = "Test Author";
