#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy/u_resolution.xy;
  vec3 backgroundColor = vec3(1.0);
	vec3 axesColor = vec3(0.0, 0.0, 1.0);
	vec3 gridColor = vec3(0.5);

	// start by setting the background color. If pixel's value
	// is not overwritten later, this color will be displayed.
	vec3 pixel = backgroundColor;

	// Draw the grid lines
	// we used "const" because loop variables can only be manipulated
	// by constant expressions.
	const float tickWidth = 0.1; // una casella;
	for(float i=0.0; i<1.0; i+=tickWidth) {
		// "i" is the line coordinate.
		if(abs(st.x - i)<0.02) pixel = gridColor;
		if(abs(st.y - i)<0.02) pixel = gridColor;
	}
	// Draw the axes
	//if( abs(st.x)<0.005 ) pixel = axesColor;
	//if( abs(st.y)<0.006 ) pixel = axesColor;

  gl_FragColor = vec4(pixel, 1.0);
}


//gl_FragCoord = It tells us at which pixel we are on the screen
