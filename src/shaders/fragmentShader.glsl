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

  color.r = redAmount;
  color.g = greenAmount;
  color.b = blueAmount;

  gl_FragColor = vec4(color, 1.0);
}
