#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;


void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(0.0);
    vec2 size = vec2(0.3, 0.7);

    // bottom-left
    vec2 bl = step(vec2(0.1),st * 0.25);
    float pct = bl.x * bl.y;

    // top-right
    vec2 tr = step(vec2(0.1) - size,(1.0-st) * 0.25);
    pct *= tr.x * tr.y;

    color = vec3(pct);

    gl_FragColor = vec4(color,1.0);
}
