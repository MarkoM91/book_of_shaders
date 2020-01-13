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

    vec3 influenced_color = vec3(0.563, 0.580, 0.556);
		vec3 influencing_color_A = vec3(0.040, 0.040, 0.040);
	  vec3 influencing_color_B = vec3(0.937,0.981,1.000);

		vec3 color = vec3(0.0);

		// Background Gradient
		color = mix(influencing_color_A, influencing_color_B, st.y);
		vec2 size = vec2(0.020, 0.460);
		vec2 offset = vec2(0.3, 0.0);

		// Foreground rectangle

		color = mix(color, influenced_color, rect(st, size));

		color = mix(color, influenced_color, rect(st + offset, size));

		color = mix(color, influenced_color, rect(st - offset, size));

    // Output.
    gl_FragColor = vec4(color,1.0);
}
