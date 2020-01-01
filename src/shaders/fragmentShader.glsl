#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

// Plot a line on Y using a value between 0.0-1.0
float plot(vec2 st, float pct){
  return  smoothstep( pct-0.02, pct, st.y) -
          smoothstep( pct, pct+0.02, st.y); //The two first parameters are for the beginning and end of the transition, while the third is for the value to interpolate.
}

void main() {
	vec2 st = gl_FragCoord.xy/u_resolution;

    //float y = pow(st.x, 5.0); //For example we can raise x to the power of 5 to make a curved line.
    //float y = step(0.5, st.x); //The first one is the limit or threshold, while the second one is the value we want to check or pass. Any value under the limit will return 0.0 while everything above the limit will return 1.0.
  //  float y = smoothstep(0.1,0.9,st.x);

   float x = st.x * 2.0 * 3.141529;
   //float y = sin(x + u_time);
   //float y = sin(x * u_time) + 1.0;
   //float y = (sin(x * u_time) * 2.0);
   //float y = abs(sin(x * u_time) * 2.0);
   float y = floor(sin(x * u_time) * 2.0);
   //float y = fract(sin(x));

   gl_FragColor = vec4(vec3(y*0.5+0.5), 1.0);
     //The first one is the limit or threshold, while the second one is the value we want to check or pass. Any value under the limit will return 0.0 while everything above the limit will return 1.0.
//    vec3 color = vec3(y);
//
//    // Plot a line
//    float pct = plot(st,y);
//    color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);
//
//	gl_FragColor = vec4(color,1.0);
}


//When you want to use some math to animate, shape or blend values, there is nothing better than being friends with sine and cosine.
