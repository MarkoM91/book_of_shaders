#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy/u_resolution.xy;
  // r is a vec2. Its first component is pixel x-coordinate divided by
	// the frame width. And second component is the pixel y-coordinate
	// divided by the frame height.
	// u_resolution.x(1440.0, 900.0);
	// / fragCoord.x will have values between 0 and 1439, and
	// fragCoord.y will have values between 0 and 899, whereas
  vec2 r = vec2(gl_FragCoord.x / u_resolution.x, gl_FragCoord.y / u_resolution.y);

  vec3 color1 = vec3(0.841, 0.582, 0.594);
  vec3 color2 = vec3(0.884, 0.850, 0.648);
  vec3 color3 = vec3(0.348, 0.555, 0.641);
  vec3 pixel;

  // r.x and r.y will have values between [0,1].

  if(r.x < 1.0 / 3.0)  {
    pixel = color1;
  } else if(r.x < 2.0/ 3.0) {
    pixel = color2;
  } else {
    pixel = color3;
  }

  // pixel = ( r.x < 1.0/3.0 ) ? color1 : (r.x<2.0/3.0) ? color2: color3;
	// same code, single line.

  gl_FragColor = vec4(pixel, 1.0);
}


//gl_FragCoord = It tells us at which pixel we are on the screen
