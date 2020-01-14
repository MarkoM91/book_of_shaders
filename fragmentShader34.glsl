#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy/u_resolution.xy;
  vec3 color1 = vec3(0.741, 0.635, 0.471);
  vec3 color2 = vec3(0.192, 0.329, 0.439);
  vec3 pixel;
  // sugar syntax for "if" conditional. It says
	// "if the x coordinate of a pixel is greater than the half of
	// the width of the screen, then use color1, otherwise use
	// color2."
  pixel = (gl_FragCoord.x > u_resolution.x / 2.0) ? color1 : color2;

  gl_FragColor = vec4(pixel, 1.0);
}


//gl_FragCoord = It tells us at which pixel we are on the screen
