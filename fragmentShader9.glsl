#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define PI 3.14159265359
#define HALF_PI 1.5707963267948966

vec3 colorA = vec3(0.149, 0.141, 0.912);
vec3 colorB = vec3(1.000, 0.833, 0.224);

//const vec3 lineColor = vec3(0.0, 1.0, 0.0);
//
//float plotLine(vec2 uv, float y){
//    return smoothstep(y - 0.02, y, uv.y) -
//           smoothstep(y, y + 0.02, uv.y);
//}


void main() {
  vec2 uv = gl_FragCoord.xy / u_resolution.xy;
  //vec3 red = vec3(1.0, 0.0, 0.0);
  //red.x = 1.0;
  //red.y = 0.0;
  //red.z = 0.0;

  //red.x = vector[0];
  //red.y = vector[1];
  //red.z = vector[2];
  //vec3 yellow, magenta, green;

  //yellow.rg = vec2(1.0); // Assigning 1. to red and green channels
  //yellow[2] = 0.0; // Assigning 0. to blue channel

  //magenta = yellow.rbg; // Assign the channels with green and blue swapped

  //green.rgb = yellow.bgb; // Assign the blue channel of Yellow (0) to red and blue channels
  // Mix uses pct (a value from 0-1) to
// mix the two colors
  vec3 color = vec3(0.0);
  float pct = abs(cos(u_time));
  color = mix(colorA, colorB, pct);

  gl_FragColor = vec4(color, 1.0);
}
