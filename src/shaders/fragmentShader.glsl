#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

float rect(in vec2 st, in vec2 size){
	size = 0.25-size*0.25;
    vec2 uv = smoothstep(size,size+size*vec2(0.002),st*(1.0-st));
	return uv.x*uv.y;
}

void main(){
    // Screen dimensions and set the base color.
    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    vec3 influenced_color = vec3(0.515, 0.435, 0.415);

		vec3 influencing_color_A = vec3(0.325, 0.278, 0.209);
	  vec3 influencing_color_B = vec3(0.487,0.364,0.565);

    vec3 color = mix(influencing_color_A, influencing_color_B, step(0.5, st.y));

		color = mix(color, influenced_color, rect(abs(( st -vec2( 0.0, 0.5)) * vec2(1.0, 2.0)), vec2(0.01, 0.04) ));

    // Output.
    gl_FragColor = vec4(color,1.0);
}
