#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 r =  2.0*vec2(gl_FragCoord.xy  - 0.5 * u_resolution.xy) / u_resolution.y;
  float xMax = u_resolution.x / u_resolution.y;

  vec3 bgCol = vec3(0.0);
  vec3 col1 = vec3(0.216, 0.471, 0.698);
  vec3 col2 = vec3(1.00, 0.329, 0.298);
  vec3 col3 = vec3(0.867, 0.910, 0.247);

  vec3 pixel = bgCol;

  float edge, variable, ret;

  if(r.x < - 0.6 * xMax)  {
    variable = r.y;
    edge = 0.2;
    if(variable > edge) {
      ret = 1.0;
    } else {
      ret = 0.0;
    }
  }

  else if(r.x < -0.2*xMax) {
    variable = r.y;
    edge = - 0.2;
    ret = step(edge, variable);
  }
  else if(r.x < 0.2 * xMax) {
    ret = 1.0 -step(0.5, r.y);
  }

  else if(r.x < 0.6 * xMax) {
    ret = 0.3 + 0.5 * step(-0.4, r.y);
  }

  else {
    ret = step(-0.3, r.y) * (1.0 -step(0.2, r.y));
  }

  pixel = vec3(ret);
  gl_FragColor = vec4(pixel, 1.0);
}
