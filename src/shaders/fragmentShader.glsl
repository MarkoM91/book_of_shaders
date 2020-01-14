#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 r = vec2( gl_FragCoord.xy - 0.5 * u_resolution.xy );
  r = 2.0 * r.xy / u_resolution.y;

  vec3 backgroundColor = vec3(1.0);
  vec3 axesColor = vec3(0.0, 0.0, 1.0);
  vec3 gridColor = vec3(0.5);

  vec3 pixel = backgroundColor;
  const float tickWidth = 0.1;
  for(float i = -2.0; i < 2.0; i += tickWidth)  {
    if(abs(r.x - i) < 0.004) pixel = gridColor;
    if(abs(r.y - i) < 0.004) pixel = gridColor;
  }

  if(abs(r.x) < 0.006) pixel = axesColor;
  if(abs(r.y) < 0.007) pixel = axesColor;

  gl_FragColor = vec4(pixel, 1.0);
}
