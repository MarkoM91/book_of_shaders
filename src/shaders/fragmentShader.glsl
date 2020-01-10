#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define PI 3.14159265359


const vec3 lineColor = vec3(0.0, 1.0, 0.0);

float plotLine(vec2 uv, float y){
    return smoothstep(y - 0.02, y, uv.y) -
           smoothstep(y, y + 0.02, uv.y);
}


void main() {
  vec2 uv = gl_FragCoord.xy / u_resolution.xy;

    //float y = cosineApprox(uv.x);

    //float y = doubleCubicSeat(uv.x, 0.407, 0.720);
    //float y = doubleCubicSeat(uv.x, 0.607, 0.247);

    //float y = doubleCubicSeatLinear(uv.x, 0.347, 0.887);

    //float y = doublePolynomialSigmoid(uv.x, 0.347, 0.887, 2.0);

    //float y = quadraticPoint(uv.x, 0.233, 0.340);
    //float y = 1.0 - pow(abs(uv.x), 0.5);
    //float y = 1.0 - pow(abs(uv.x), 1.0);
    //float y = 1.0 - pow(abs(uv.x), 1.5);
    //float y = 1.0 - pow(abs(uv.x), 5.5);
    //float y = pow(cos(PI * uv.x / 2.0), 3.0);
    //float y = 1.0 - pow(abs(sin(PI * uv.x / 2.0)), 3.0);
    //float y = pow(min(cos(PI * uv.x / 2.0), 1.0 - abs(uv.x)), 2.5);
    //float y = 1.0 - pow(max(0.0, abs(uv.x) * 2.0 - 1.0), 0.5);
    float y = 1.0 - pow(max(0.0, abs(uv.x) * 2.0 - 1.0), 0.5);

    vec3 gradient = vec3(y);

    float line = plotLine(uv, y);

    vec3 color = (1.0 - line) + line * lineColor;

    gl_FragColor = vec4(color, 1.0);
}
