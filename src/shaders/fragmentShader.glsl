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

float cubicBezier (float x, float a, float b, float c, float d){

  float y0a = 0.00; // initial y
  float x0a = 0.00; // initial x
  float y1a = b;    // 1st influence y
  float x1a = a;    // 1st influence x
  float y2a = d;    // 2nd influence y
  float x2a = c;    // 2nd influence x
  float y3a = 1.00; // final y
  float x3a = 1.00; // final x

  float A =   x3a - 3.0*x2a + 3.0*x1a - x0a;
  float B = 3.0*x2a - 6.0*x1a + 3.0*x0a;
  float C = 3.0*x1a - 3.0*x0a;
  float D =   x0a;

  float E =   y3a - 3.0*y2a + 3.0*y1a - y0a;
  float F = 3.0*y2a - 6.0*y1a + 3.0*y0a;
  float G = 3.0*y1a - 3.0*y0a;
  float H =   y0a;

  // Solve for t given x (using Newton-Raphelson), then solve for y given t.
  // Assume for the first guess that t = x.
  float currentt = x;
  int nRefinementIterations = 5;
  for (int i=0; i < nRefinementIterations; i++){
    float currentx = xFromT (currentt, A,B,C,D);
    float currentslope = slopeFromT (currentt, A,B,C);
    currentt -= (currentx - x)*(currentslope);
    currentt = constrain(currentt, 0,1);
  }

  float y = yFromT (currentt,  E,F,G,H);
  return y;
}

// Helper functions:
float slopeFromT (float t, float A, float B, float C){
  float dtdx = 1.0/(3.0*A*t*t + 2.0*B*t + C);
  return dtdx;
}

float xFromT (float t, float A, float B, float C, float D){
  float x = A*(t*t*t) + B*(t*t) + C*t + D;
  return x;
}

float yFromT (float t, float E, float F, float G, float H){
  float y = E*(t*t*t) + F*(t*t) + G*t + H;
  return y;
}

void main() {
	vec2 uv = gl_FragCoord.xy / u_resolution;

  float y = circularEaseIn(uv.x);

    vec3 gradient = vec3(y);

    float line = plotLine(uv, y);

    vec3 color = (1.0 - line) * gradient + line * lineColor;

    gl_FragColor = vec4(color, 1.0);
}
