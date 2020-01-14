#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

float circle( vec2 coord, vec2 center, float radius, float blur ) {
    vec2 dist = coord - center;
	return 1.0 - smoothstep(pow(radius - blur, 2.0), pow(radius + blur, 2.0), dot(dist,dist));
}

float star( vec2 coord, vec2 center, float radius, float points, float blur, float rot) {
    vec2 p = center - coord;

    //Polar coordinates
    float d = length(p) * 2.0;
    float a = atan(p.y, p.x);

    float f = (cos(a * points + rot) + 1.0) / 4.0  + 0.5;
    return 1.0 - smoothstep(f * radius - blur / 2.0, f * radius + blur / 2.0, d);
}



void main()
{
    float radius = 200.0;
    float blur = 100.0;

    vec4 c1 = vec4( 0.1, 0.6, 1.0, 1.0 );
    vec4 c2 = vec4( 0.0, 0.8, 1.0, 1.0 );
    vec4 c3 = vec4( 0.2, 1.0, 0.5, 1.0 );
    vec4 c4 = vec4( 0.3, 1.0, 1.0, 1.0 );


      vec2 pos = u_resolution.xy / 2.0 - gl_FragCoord.xy;

      float size = min(u_resolution.x, u_resolution.y) * 0.85;

      float star1 = star(gl_FragCoord.xy, u_resolution.xy / 2.0, size * 0.7, 12.0, 300.0, u_time);
      float star2 = star(gl_FragCoord.xy, u_resolution.xy / 2.0, size * 18.0, 300.0, - u_time * 1.2;
      float star3 = star(gl_FragCoord.xy, u_resolution.xy / 2.0, size * 24.0, 300.0, u_time * 1.1);
      float star4 = star(gl_FragCoord.xy, u_resolution.xy / 2.0, size * 0.8, 9.0, 200.0, - u_time);

      gl_FragColor = c1 * star1 + c2 * star2 + c3 * star3 +c4 * star4;
}
