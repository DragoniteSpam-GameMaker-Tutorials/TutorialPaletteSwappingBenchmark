//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D samp_targets;
uniform vec2 palette_size;
uniform float palette_index;

void main()
{
    vec4 sampled = texture2D(gm_BaseTexture, v_vTexcoord);
    
    for (float i = 0.0; i < palette_size.x; i += 1.0) {
        vec2 target_uvs = vec2(i / palette_size.x, 0.0);
        
        vec3 target = texture2D(samp_targets, target_uvs).rgb;
        if (distance(target, sampled.rgb) < 0.001) {
            vec2 replacement_uvs = vec2(i / palette_size.x, palette_index / palette_size.y);
            sampled.rgb = texture2D(samp_targets, replacement_uvs).rgb;
        }
    }
    
    gl_FragColor = sampled * v_vColour;
}