#ifdef GL_ES
precision mediump float;
#endif

#define TWO_PI 6.28318530718

uniform vec2 u_resolution;
uniform float u_time;

vec3 hsb2rgb( in vec3 c ){
    vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),
                             6.0)-3.0)-1.0,
                     0.0,
                     1.0 );
    rgb = rgb*rgb*(3.0-2.0*rgb);
    return c.z * mix(vec3(1.0), rgb, c.y);
}

float circle(vec2 s, float rad) {
  vec2 dist = s - vec2(0.5);
  return 1.0 - smoothstep(rad - (rad * 0.01), rad + (rad * 0.01), dot( dist, dist) *8.0);
}

void main(){
    // Screen dimensions and set the base color.
    vec2 st = gl_FragCoord.xy/u_resolution;
    vec3 color = vec3(0.0);

    // Calculate the color part of the wheel.
    vec2 toCenter = vec2(0.5) - st;
    float angle = atan(toCenter.y, toCenter.x);
    float radius = length(toCenter) * 4.0;

    // Adding the time variable to the angle calc makes the spinning happen.
    vec3 colors = hsb2rgb(vec3((angle / TWO_PI) + u_time, radius, 1.0));

    vec3 outerCircle = vec3(circle(st, 0.5));
    vec3 innerCircle = vec3(circle(st, 0.2));


    // Color the circle with the rgb colors, then subtract the inner circle.
    color = outerCircle * colors - innerCircle;

    // Output.
    gl_FragColor = vec4(color,1.0);
}
