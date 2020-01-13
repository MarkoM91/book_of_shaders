#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main(){
    vec2 uv = gl_FragCoord.xy/u_resolution.xy;
  //  vec3 color = vec3(0.0);
    float pct = 0.0;

    // a. The DISTANCE from the pixel to the center
    pct = distance(uv,vec2(0.5));

     //b. The LENGTH of the vector
    //    from the pixel to the center
     vec2 toCenter = vec2(0.5)-uv;
     pct = length(toCenter);

    // c. The SQUARE ROOT of the vector
    //    from the pixel to the center
     //vec2 tC = vec2(0.5)-uv;
     //pct = sqrt(tC.x*tC.x+tC.y*tC.y);

    vec3 color = vec3(pct);

    gl_FragColor = vec4( color, 1.0 );
}
