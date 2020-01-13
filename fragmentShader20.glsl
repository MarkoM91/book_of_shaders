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

    vec3 influenced_color = vec3(0.745, 0.696, 0.529);
		vec3 influencing_color_A = vec3(0.418,0.735,0.780);
	  vec3 influencing_color_B = vec3(0.065,0.066,0.290);

		vec3 color = vec3(0.0);

		color = mix(influencing_color_A, influencing_color_B, st.y);

		color = mix(color, influenced_color, rect(st, vec2(0.030, 0.370)));

    // Output.
    gl_FragColor = vec4(color,1.0);
}
