#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define PI 3.14159265359
#define HALF_PI 1.5707963267948966

float linear(float t) {
  return t;
}

void main() {
  vec3 colorA = vec3(0.149, 0.141, 0.912);
  vec3 colorB = vec3(1.000, 0.833, 0.224);
  float t = u_time * 0.5;
  float pct = cubicInOut(t);

  vec2 uv = gl_FragCoord.xy / u_resolution.xy;

  gl_FragColor = vec4(vec3(mix(colorA, colorB, pct)), 1.0);
}
