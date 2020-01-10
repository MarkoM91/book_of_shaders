#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

const vec3 lineColor = vec3(0.0, 1.0, 0.0);

float plotLine(vec2 uv, float y) {
  return smoothstep(y - 0.02, y, uv.y) - smoothstep(y, y + 0.02, uv.y);
}

float circularEaseIn (float x) {
  float y = 1.0 - sqrt(1.0 - x*x);
  return y;
}

float circularEaseOut (float x) {
  float y = sqrt(1.0 - sq(1.0 - x));
  return y;
}

float doubleCircleSeat(float x, float a) {
  float min_param_a = 0.0;
  float max_param_a = 1.0;
  a = max(min_param_a, min(max_param_a, a));

  float y = 0.0;
  if (x<=a){
    y = sqrt(sq(a) - sq(x-a));
  } else {
    y = 1.0 - sqrt(sq(1.0-a) - sq(x-a));
  }
  return y;
}

void main() {
	vec2 uv = gl_FragCoord.xy / u_resolution;

    float y = doubleCircleSeat(uv.x, 0.500);

    vec3 gradient = vec3(y);

    float line = plotLine(uv, y);

    vec3 color = (1.0 - line) * gradient + line * lineColor;

    gl_FragColor = vec4(color, 1.0);
}
