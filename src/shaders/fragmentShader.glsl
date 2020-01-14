#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy/u_resolution.xy;
  vec2 backgroundColor = vec3(1.0);
  vec3 axesColor = vec3(0.0, 0.0, 1.0);
  vec3 gridColor = vec3(0.5);

  vec3 pixel = backgroundColor;

  const float tickWidth = 0.1;
  for(float i = 0.0; i < 1.0; i += tickWidth)  {
    if(abs(st.x - i) < 0.002) pixel = gridColor;
    if(abs(st.y - i) < 0.002) pixel = gridColor;
  }

  if(abs(st.x) < 0.005) pixel = axesColor;
  if(abs(st.y) < 0.006) pixel = axesColor;  

  gl_FragColor = vec4(pixel, 1.0);
}


//gl_FragCoord = It tells us at which pixel we are on the screen
