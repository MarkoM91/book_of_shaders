#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;
#define PI 3.14159265359


const vec3 lineColor = vec3(0.0, 1.0, 0.0);

float plotLine(vec2 uv, float y){
    return smoothstep(y - 0.02, y, uv.y) -
           smoothstep(y, y + 0.02, uv.y);
}


void main() {
  vec2 uv = gl_FragCoord.xy / u_resolution.xy;
  vec3 color = vec3(0.0);

  vec2 pos = vec2(0.5) - uv;

  float r = length(pos) * 2.0;
  float a = atan(pos.y, pos.x);

  float f = cos(a * 3.0);

  color = vec3(1.0 - smoothstep(f, f + 0.02, r));

  gl_FragColor = vec4(color, 1.0);
}
