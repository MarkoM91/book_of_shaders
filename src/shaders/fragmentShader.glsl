#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

float circle(coord, center, radius, blur) {
  vec2 dist = coord - center;
  return 1.0 - smoothstep(pow(radius - blur, 2.0), pow(radius + blur, 2.0), dot(dist, dist));
}

float star(coord, center, radius, points, blur, rot) {
  vec2 p = center - coord;

  float d = length(p) * 2.0;
  float a = atan(p.y, p.x);

  float f = (cos(a * points + rot) + 1.0) / 4.0 + 0.5;
  return 1.0 - smoothstep(f * radius - blur / 2.0, f * radius + blur / 2.0, d);
}

void main() {
  vec2 uv = gl_FragCoord.xy / u_resolution.xy;
  float radius = 200.0;
  float blur = 100.0;

  vec4 c1 = vec4(0.1, 0.6, 1.0, 1.0);
  vec4 c2 = vec4(0.0, 0.8, 1.0, 1.0);
  vec4 c3 = vec4(0.2, 1.0, 0.5, 1.0);
  vec4 c4 = vec4(0.3, 1.0, 1.0, 1.0);



  gl_FragColor = vec4(color, 1.0);
}
