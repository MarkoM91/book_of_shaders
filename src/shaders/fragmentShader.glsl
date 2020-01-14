#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 r = vec2( gl_FragCoord.xy - 0.5 * u_resolution.xy );

  gl_FragColor = vec4(pixel, 1.0);
}
