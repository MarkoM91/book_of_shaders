#ifdef GL_ES
precision mediump float;
#endif

#define TWOPI 6.28318530718


uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 r =  2.0*vec2(gl_FragCoord.xy  - 0.5 * u_resolution.xy) / u_resolution.y;
  //float xMax = u_resolution.x / u_resolution.y;
  vec2 p = vec2(gl_FragCoord.xy / u_resolution.xy);

  vec3 bgCol = vec3(0.0);
  vec3 col1 = vec3(0.216, 0.471, 0.698);
  vec3 col2 = vec3(1.0, 0.329, 0.298);
  vec3 col3 = vec3(0.867, 0.910, 0.247);

  vec3 pixel = bgCol;
  float edge, variable, ret;

  if(p.x < 0.25)  {
    ret = p.y;
  }

  else if(p.x < 0.5) {
    float minVal = 0.3;
    float maxVal = 0.6;
    float variable = p.y;

    if( variable < minVal) {
      ret = minVal;
    }
    if(variable > maxVal) {
      ret = maxVal;
    }
  }

  else if(p.x < 0.75)  {
    float minVal = 0.6;
    float maxVal = 0.8;
    float variable = p.y;
    ret = clamp(variable, minVal, maxVal);
  }
  else {
    float y = cos(5.0 * TWOPI* p.y);

    y = (y + 1.0) * 0.5;
    ret = clamp(y, 0.2, 0.8);
  }
  pixel = vec3(ret);
  gl_FragColor = vec4(pixel, 1.0);
}
