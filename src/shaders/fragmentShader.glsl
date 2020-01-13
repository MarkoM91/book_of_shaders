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
    vec2 st = gl_FragCoord.xy/u_resolution;

    vec3 influenced_color = vec3(0.745, 0.678, 0.539);

    vec3 influencing_color_A = vec3(0.653, 0.918, 0.985);
    vec3 influencing_color_B = vec3(0.980, 0.576, 0.113);

    vec3 color = mix(influencing_color_A, influencing_color_B, step(0.5, st.x));

    color = mix(color, influenced_color, rect(abs((st - vec2(0.5, 0.0)) * vec2(2.0, 1.0)), vec2(0.05, 0.125)));

    // Output.
    gl_FragColor = vec4(color,1.0);
}
