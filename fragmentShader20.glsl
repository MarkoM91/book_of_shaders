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
		vec3 color = vec3(0.0);

		float left = step(0.1, st.x);
		float bottom = step(0.1, st.y);

		color = vec3(left * bottom);

    // Output.
    gl_FragColor = vec4(color,1.0);
}
