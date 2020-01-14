#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  //vec2 r = vec2( gl_FragCoord.xy - 0.5 * u_resolution.xy );
  //r = 2.0 * r.xy / u_resolution.y;
  vec2 = 2.0 * vec2(gl_FragCoord.xy - 0.5 * u_resolution.xy) / u_resolution.y;
  vec3 bgCol = vec3(0.3);
  vec3 col1 = vec3(0.216, 0.471, 0.698);
  vec3 col2 = vec3(1.00, 0.329, 0.298);
  vec3 col3 = vec3(0.867, 0.910, 0.247);

  vec3 pixel = bgCol;

  float radius = 0.8;
  if(r.x * r.x + r.y*r.y < radius * radius)  {
    pixel = col1;
  }

  if(length(r) < 0.3)  {
    pixel = col3;
  }

  vec2 center = vec2(0.9, -0.4);
  vec2 d = r - center;
  if(length(d) < 0.6)  {
    pixel = col2;
  }


  gl_FragColor = vec4(pixel, 1.0);
}
