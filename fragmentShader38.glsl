#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

// Instead of mapping [0, iResolution.x]x[0, iResolution.y] region to
// [0,1]x[0,1], lets map it to [-1,1]x[-1,1]. This way the coordinate
// (0,0) will not be at the lower left corner of the screen, but in the
// middle of the screen.

void main() {
  //vec2 st = gl_FragCoord.xy/u_resolution.xy;
  vec2 r = vec2(gl_FragCoord.xy - 0.5 * u_resolution.xy);
  r = 2.0 * r.xy / u_resolution.xy;

  vec3 backgroundColor = vec3(1.0);
  vec3 axesColor = vec3(0.0, 0.0, 1.0);
  vec3 gridColor = vec3(0.5);

  vec3 pixel = backgroundColor;
  // This time instead of going over a loop for every pixel
  // we'll use mod operation to achieve the same result
  // with a single calculation (thanks to mikatalk)
  const float tickWidth = 0.1;
  if( mod(r.x, tickWidth) < 0.008 ) pixel = gridColor;
  if( mod(r.y, tickWidth) < 0.008 ) pixel = gridColor;

  if( abs(r.x) < 0.008) pixel = axesColor;
  if( abs(r.y) < 0.007) pixel = axesColor;

  gl_FragColor = vec4(pixel, 1.0);
}


//gl_FragCoord = It tells us at which pixel we are on the screen
