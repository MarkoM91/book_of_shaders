#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy/u_resolution.xy;
  //vec3 color = vec3(0.0, 1.0, 1.0);

  //float alpha = 1.0;
  //vec4 pixel = vec4(color, alpha);

  gl_FragColor = vec4(vec3(0.0, 1.0, 1.0), 1.0);
}
