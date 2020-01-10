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
  vec3 red = vec3(1.0, 0.0, 0.0);

    gl_FragColor = vec4(red, 1.0);
    red.x = 1.0;
    red.y = 0.0;
    red.z = 0.0;
}
