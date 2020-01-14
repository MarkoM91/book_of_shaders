#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void disk(vec2 r, vec2 center, float radius, vec3 color,  inout vec3 pixel) {
  if(length(r - center) < radius)  {
    pixel = color;
  }
}

void main() {
  vec2 r =  2.0*vec2(gl_FragCoord.xy  - 0.5 * u_resolution.xy) / u_resolution.y;
  vec3 bgCol = vec3(0.3);

  vec3 col1 = vec3(0.216, 0.471, 0.698);
  vec3 col2 = vec3(1.00, 0.329, 0.298);
  vec3 col3 = vec3(0.867, 0.910, 0.247);

  vec3 pixel = bgCol;
  disk(r, vec2(0.1, 0.3), 0.5, col3, pixel);
  disk(r, vec2(-0.8, -0.6), 1.5, col1, pixel);
  disk(r, vec2(0.8, 0.0), 0.15, col2, pixel);

  gl_FragColor = vec4(pixel, 1.0);
}
