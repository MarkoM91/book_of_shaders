#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

vec3 red    = vec3(0.725, 0.141, 0.149);
   vec3 beige  = vec3(.976, .949, .878);

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

    vec3 col = beige;


    vec2 rectPos = vec2(uv.x - width * 5.0, uv.y - height - 0.1);
    float redRect = Rectangle(rectPos, width * 3.0, height);

    col = mix(col, red, redRect);

    gl_FragColor = vec4(col,1.0);
}
