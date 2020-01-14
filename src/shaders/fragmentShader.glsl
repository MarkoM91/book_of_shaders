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

  vec3 pixel = backgroundColor;

  float leftCoord = 0.54;
  float rightCoord = 0.55;
  if(st.x < rightCoord && st.x > leftCoord) pixel = color1;

  float lineCoordinate = 0.4;
  float lineThickness = 0.003;

  if(abs(st.x - lineCoordinate) < lineThickness) pixel = color2;

  if(abs(st.y - 0.6) < 0.01) pixel = color3;

  gl_FragColor = vec4(pixel, 1.0);
}


//gl_FragCoord = It tells us at which pixel we are on the screen
