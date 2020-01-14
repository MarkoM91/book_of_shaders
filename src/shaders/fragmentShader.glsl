#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy/u_resolution.xy;
  vec2 r = vec2(gl_FragCoord.x / u_resolution.x, gl_FragCoord.y / u_resolution.y);

  vec3 color1 = vec3(0.841, 0.582, 0.594);
  vec3 color2 = vec3(0.884, 0.850, 0.648);
  vec3 color3 = vec3(0.348, 0.555, 0.641);
  vec3 pixel;

  if(r.x < 1.0 / 3.0)  {
    pixel = color1;
  } else if(r.x < 2.0/ 3.0) {
    pixel = color2;
  } else {
    pixel = color3;
  }

  gl_FragColor = vec4(pixel, 1.0);
}


//gl_FragCoord = It tells us at which pixel we are on the screen
