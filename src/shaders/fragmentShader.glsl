#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;


void main(){
    // Screen dimensions and set the base color.
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
		vec3 color = vec3(0.0);

		//float left = step(0.1, st.x);
		//float bottom = step(0.1, st.y);

		//color = vec3(left * bottom);
		//
		vec2 borders = step(vec2(0.1), st);
		float pct = borders.x * borders.y;

		color = vec3(pct);
    // Output.
    gl_FragColor = vec4(color,1.0);
}
