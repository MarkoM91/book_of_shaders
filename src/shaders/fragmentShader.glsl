#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    st.x *= u_resolution.x/u_resolution.y;

    vec3 color = vec3(0.0);
    float d = 0.0;

    //We start by moving the coordinate system to the center and shrinking it in half in order to remap the position values between -1 and 1
    st = st * 2.0 - 1.0;

    //Let’s take a look at the distance field formula on line 19.
    //There we are calculating the distance to the position on (.3,.3) or vec3(.3) in all four quadrants (that’s what abs() is doing there).
    //d = length(abs(st) - 0.3);
  //  d = length( min(abs(st)-.3,0.) );
     d = length( max(abs(st)-.3,0.) );

    //vec3 color = vec3(circle(uv, 0.9));

    //Also on line 24 we are visualizing the distance field values using a fract() function making it easy to see the pattern they create.
    // The distance field pattern repeats over and over like rings in a Zen garden.
   //gl_FragColor = vec4(vec3( step(.3,d) ),1.0);
   //gl_FragColor = vec4(vec3( step(.3,d) * step(d,.4)),1.0);
   //gl_FragColor = vec4(vec3( smoothstep(.3,.4,d)* smoothstep(.6,.5,d)) ,1.0);
    gl_FragColor = vec4( vec3(fract(d * 10.0)), 1.0);
}
