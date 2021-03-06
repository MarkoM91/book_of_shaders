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
		st.y = 1.0 - st.y;

    vec3 influenced_color = vec3(0.745, 0.696, 0.529);

		vec3 influencing_color_A = vec3(0.418,0.735,0.780);
	  vec3 influencing_color_a = vec3(0.065,0.066,0.290);
	  vec3 influencing_color_b = vec3(0.865,0.842,0.162);
	  vec3 influencing_color_B = vec3(0.980,0.603,0.086);

    vec3 color = mix(mix(influencing_color_A, influencing_color_a, step(0.3, st.y)), mix(influencing_color_b, influencing_color_B, step(0.7, st.y)), step(0.5, st.y));

    color = mix(color, influenced_color, rect(abs((st - vec2(1.0, 0.5)) * vec2(1.0, 1.75)), vec2(0.025, 0.09)));

    // Output.
    gl_FragColor = vec4(color,1.0);
}
