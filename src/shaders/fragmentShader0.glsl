uniform vec2 u_resolution;
uniform float u_time;

void main() {
   vec2 st = gl_FragCoord.xy/u_resolution.xy; //we made a function that takes a two dimensional vector (x and y), and returns a four dimensional vector (r, g, b and a)
   gl_FragColor=vec4(st.x,st.y,0.0,1.0); // we mapped the normalized position of x and y to the red and green channel;
}
