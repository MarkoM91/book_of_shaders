uniform vec2 u_resolution;
uniform float u_time;
uniform float border; // 0.01
uniform float circle_radius; // 0.5
uniform vec4 circle_color; // vec4(1.0, 1.0, 1.0, 1.0)
uniform vec2 circle_center; // vec2(0.5, 0.5)
void main (void)
{
  vec2 uv = gl_FragCoord.xy/u_resolution.xy;

   float border = 0.01;
   float circle_radius  = 0.5;
   vec2 circle_center = vec2(0.5, 0.5);

  vec4 circle_color = vec4(1.0, 1.0, 1.0, 1.0);


  vec4 bkg_color = vec4(0.0, 1.0, 0.0, 1.0);

  // Offset uv with the center of the circle.
  uv -= circle_center;

  float dist =  sqrt(dot(uv, uv));
  if ( (dist > (circle_radius+border)) || (dist < (circle_radius-border)) )
    gl_FragColor = bkg_color;
  else
    gl_FragColor = circle_color;
}
