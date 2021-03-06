#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

vec3 red    = vec3(0.725, 0.141, 0.149);
   vec3 blue   = vec3(0.012, 0.388, 0.624);
   vec3 yellow = vec3(0.988, 0.784, 0.173);
   vec3 beige  = vec3(.976, .949, .878);
   vec3 black  = vec3(0.078, 0.09, 0.114);

float Band(float pos, float width)
{
   float halfWidth = width * 0.5;
   return step(-halfWidth, pos) - step(halfWidth, pos);
}

// uses 2 bands
float Rectangle(vec2 pos, float width, float height)
{
   return Band(pos.x, width) * Band(pos.y, height);
}



void main(){
    vec2 uv = gl_FragCoord.xy/u_resolution.xy;

    // center origin
    uv -= 0.5;

    // adjust for aspect ratio
    uv.x *= u_resolution.x / u_resolution.y;
    // flip x coords, not sure why their wrong...
    uv.x = -uv.x;

    float width = 0.15;
    float height = 0.3;
    float margin = 0.025;

    // set background to beige
    vec3 col = beige;

    // red areas
    vec2 rectPos = vec2(uv.x - width * 5.0, uv.y - height - 0.1);
    float redRect = Rectangle(rectPos, width * 3.0, height);

    // yellow areas
    rectPos.x = uv.x + width * 6.0;
    float yellowRect = Rectangle(rectPos, width, height);

    // blue areas
    rectPos.y = uv.y + height * 1.5;
    float blueRect = Rectangle(rectPos, width, height * 2.0);

    // black lines, 4 vertcal, 2 horizontal
    rectPos = vec2(uv.x, uv.y);
    float blackRect = Band(rectPos.x - width * 4.75, margin);
    blackRect += Band(rectPos.x - width * 3.5, margin);
    blackRect += Band(rectPos.x + width * 3.0, margin);
    blackRect += Band(rectPos.x + width * 5.5, margin);

    // horizontal
    blackRect += Band(rectPos.y - height + 0.05, margin);
    blackRect += Band(rectPos.y + height * 0.5, margin);

    // beige rect for touchup
    rectPos = vec2(uv.x - width * 5.1, uv.x + height * 1.3);
    float beigeRect = Rectangle(rectPos, width * 3.0, height * 1.51);

    col = mix(col, red, redRect);
    col = mix(col, yellow, yellowRect);
    col = mix(col, blue, blueRect);
    col = mix(col, black, blackRect);
    col = mix(col, beige, beigeRect);

    gl_FragColor = vec4(col, 1.0);
}
