#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy/u_resolution.xy;
  float redAmount = 0.6;
  float greenAmount = 0.2;
  float blueAmount = 0.9;

  vec3 color = vec3(0.0);
  // Here we only input a single argument. It is a third way of
// contructing vectors.
// "vec3(x)" is equivalent to vec3(x, x, x);
// This vector is initialized as
// color.x = 0.0, color.y = 0.0; color.z = 0.0;

  color.r = redAmount;
  color.g = greenAmount;
  color.b = blueAmount;

  gl_FragColor = vec4(color, 1.0);
}
