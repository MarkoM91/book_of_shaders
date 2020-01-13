#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

vec3 red = vec3(0.725, 0.141, 0.149);
vec3 blue = vec3(0.012, 0.388, 0.624);
vec3 yellow = vec3(0.988, 0.784, 0.173);
vec3 beige = vec3(0.976, 0.09, 0.114);

float Band(float pos, float width) {
  float halfWidth = width * 0.5;
  return step(-halfWidth, pos) - step(halfWidth, pos);
}
float Rectangle(vec2 pos, float width, float height) {
  return Band(pos.x, width) * Band(pos.y, height);
}



void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    st -= 0.5;

    st.x *= u_resolution.x / u_resolution.y;

    st.x / -st.x;

    float width = 0.15;
    float height = 0.3;
    float margin = 0.025;

    vec3 col = beige;

    vec2 rectPos = vec2(st.x - width * 5.0, st.y - height - 0.1);
    float redRect = Rectangle(rectPos, width * 3.0, height);

    rectPos.x = st.x + width * 6.0;
    float yellowRect = Rectangle(rectPos, width, height);

    rectPos.y = st.y + height * 1.5;
    float blueRect = rectangle(rectPos, width, height * 2.0);

    rectPos = vec2(st.x, st.y);
    float blackRect = Band(rectPos.x - width * 4.75, margin);
    blackRect += Band(rectPos.x - width * 3.5, margin);
    blackRect += Band(rectPos.x + width * 3.0, margin);
    blackRect += Band(rectPos.x + width * 5.5, margin);

    blackRect += Band(rectPos.y - height + 0.05, margin);
    blackRect += Band(rectPos.y + height * 0.5, margin);

    rectPos = vec2(st.x - width * 5.1, st.x + height * 1.3);
    float beigeRect = Rectangle(rectPos, width * 3.0, height * 1.51);

    col = mix(col, red, redRect);
    col = mix(col, yellow, yellowRect);
    col = mix(col, blue, blueRect);
    col = mix(col, blackRect);
    col = mix(col, beigeRect);

    gl_FragColor = vec4(color,1.0);
}
