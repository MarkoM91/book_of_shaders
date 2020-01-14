#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy/u_resolution.xy;
  vec3 color1 = vec3(0.886, 0.576, 0.898);
  vec3 color2 = vec3(0.537, 0.741, 0.408);

  float widthOfStrip = 100.0;
  vec3 pixel;
  if(gl_FragCoord.x > widthOfStrip)  {
    pixel = color2;
  } else {
    pixel = color1;
  }

  gl_FragColor = vec4(pixel, 1.0);
}


//gl_FragCoord = It tells us at which pixel we are on the screen
