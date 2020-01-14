#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy/u_resolution.xy;
  vec3 backgroundColor = vec3(1.0);

  vec3 color1 = vec3(0.216, 0.471, 0.698);
  vec3 color2 = vec3(1.0, 0.329, 0.298);
  vec3 color3 = vec3(0.867, 0.910, 0.247);

  // start by setting the background color. If pixel's value
  // is not overwritten later, this color will be displayed.
  vec3 pixel = backgroundColor;

  // if the current pixel's x coordinate is between these values,
	// then put color 1.
	// The difference between 0.55 and 0.54 determines
	// the with of the line.
  float leftCoord = 0.54;
  float rightCoord = 0.55;

  // if the current pixel's x coordinate is between these values,
	// then put color 1.
	// The difference between 0.55 and 0.54 determines
	// the with of the line.
  if(st.x < rightCoord && st.x > leftCoord) pixel = color1;

  // a different way of expressing a vertical line
  // in terms of its x-coordinate and its thickness:
  float lineCoordinate = 0.4;
  float lineThickness = 0.003;

  if(abs(st.x - lineCoordinate) < lineThickness) pixel = color2;

  if(abs(st.y - 0.6) < 0.01) pixel = color3;

  // see how the third line goes over the first two lines.
// because it is the last one that sets the value of the "pixel".
  gl_FragColor = vec4(pixel, 1.0);
}


//gl_FragCoord = It tells us at which pixel we are on the screen
