#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

float circle(in vec2 _st, in float _radius) {
  vec2 dist = _st - vec2(0.5);
  return 1.0 - smoothstep(_radius - (_radius * 0.01),
                          _radius + (_radius * 0.01),
                          dot(dist, dist)* 4.0
  );
}

void main(){
    vec2 uv = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(circle(uv, 0.9));

    gl_FragColor = vec4( color, 1.0 );
}
