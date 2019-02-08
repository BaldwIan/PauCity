//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float translate;

uniform float newR;
uniform float newG;
uniform float newB;
uniform float newA;

void main()
{
	vec2 dist = 0.5 - v_vTexcoord;
	vec2 newcoord = vec2(v_vTexcoord.x + dist.y * dist.y * dist.x * translate, v_vTexcoord.y);
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, newcoord );
}
