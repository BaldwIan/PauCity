//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	
	vec2 dist = 0.5 - v_vTexcoord;
	vec2 newcoord = vec2(v_vTexcoord.x + dist.y * dist.y * dist.x * 2.5, v_vTexcoord.y);
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, newcoord );
}
