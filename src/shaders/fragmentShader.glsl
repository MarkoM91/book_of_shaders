#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

const vec3 lineColor = vec3(0.0, 1.0, 0.0);

float plotLine(vec2 uv, float y) {
  return smoothstep(y - 0.02, y, uv.y) - smoothstep(y, y + 0.02, uv.y);
}

float cosineApprox(float x) {

  float x2 = x * x;
  float x4 = x2 * x2;
  float x6 = x4 * x4;

  float fa = 4.0 / 9.0;
  float fb = 17.0 / 9.0;
  float fc = 22.0 / 9.0;

  return fa * x6 - fb * x4 + fc * x2;
}

void main() {
	vec2 uv = gl_FragCoord.xy/u_resolution;

  //float y = doubleCubicSeatLinear(uv.x, 0.640, 0.827);
  float y = cosineApprox(uv.x);

  vec3 gradient = vec3(y);

  float line = plotLine(uv, y);

  vec3 color = (1.0 - line) * gradient + line * lineColor;

  gl_FragColor = vec4(vec3(color, 1.0);
}
