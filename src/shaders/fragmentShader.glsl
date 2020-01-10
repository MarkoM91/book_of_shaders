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

float cosineApprox(float x){

	float x2 = x * x;
    float x4 = x2 * x2;
    float x6 = x4 * x4;

    float fa = 4.0 / 9.0;
    float fb = 17.0 / 9.0;
    float fc = 22.0 / 9.0;

    return fa * x6 - fb * x4 + fc * x2;
}

float doubleCubicSeat(float x, float a, float b) {
  float epsilon = 0.00001;
  float min_param_a = 0.0 + epsilon;
  float max_param_a = 1.0 - epsilon;
  float min_param_b = 0.0;
  float max_param_b = 1.0;

  a = min(max_param_a, max(min_param_a, a));
  b = min(max_param_b, max(min_param_b, b));

  float y = 0.0;
  if(x <= a)  {
    y = b - b * pow(1.0 - x / a, 3.0);
  } else {
    y = b + (1.0 - b) * pow((x - a) / (1.0 -  a), 3.0);
  }
  return y;
}


void main() {
	vec2 uv = gl_FragCoord.xy / u_resolution.xy;

    //float y = cosineApprox(uv.x);

    float y = doubleCubicSeat(uv.x, 0.407, 0.720);
    //float y = doubleCubicSeat(uv.x, 0.607, 0.247);

    //float y = cosineApprox(uv.x);
    //float y = doubleCubicSeatLinear(uv.x, 0.347, 0.887);

    //float y = doublePolynomialSigmoid(uv.x, 0.347, 0.887, 2.0);

    //float y = quadraticPoint(uv.x, 0.233, 0.340);
    //float y = quadraticPoint(uv.x, 0.500, 0.307);

    vec3 gradient = vec3(y);

    float line = plotLine(uv, y);

    vec3 color = (1.0 - line) * gradient + line * lineColor;

    gl_FragColor = vec4(color, 1.0);
}
