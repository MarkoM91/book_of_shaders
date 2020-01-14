#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

// So, in GLSL we don't give a command of "draw this disk here with that
// color". Instead we use an indirect command such as "if the pixel
// coordinate is inside this disk, put that color for the pixel"
// The indirect commands are a bit counter intuitive until you
// get used to that way of thinking.

void main() {
  //vec2 r = vec2( gl_FragCoord.xy - 0.5 * u_resolution.xy );
  //r = 2.0 * r.xy / u_resolution.y;
  //if the pixel coordinate;
  vec2 r =  2.0*vec2(gl_FragCoord.xy  - 0.5 * u_resolution.xy) / u_resolution.y;

	vec3 bgCol = vec3(0.3);
	vec3 col1 = vec3(0.216, 0.471, 0.698); // blue
	vec3 col2 = vec3(1.00, 0.329, 0.298); // yellow
	vec3 col3 = vec3(0.867, 0.910, 0.247); // red

	vec3 pixel = bgCol;

	// To draw a shape we should know the analytic geometrical
	// expression of that shape.
	// A circle is the set of points that has the same distance from
	// it its center. The distance is called radius.
	// The distance from the coordinate center is sqrt(x*x + y*y)
	// Fix the distance as the radius will give the formula for
	// a circle at the coordinate center
	// sqrt(x*x + y*y) = radius
	// The points inside the circle, the disk, is given as
	// sqrt(x*x + y*y) < radius
	// Squaring both sides will give
	// x*x + y*y < radius*radius
	float radius = 0.8;
	if( r.x*r.x + r.y*r.y < radius*radius ) {
		pixel = col1;
	}

	// There is a shorthand expression for sqrt(v.x*v.x + v.y*v.y)
	// of a given vector "v", which is "length(v)"
	if( length(r) < 0.3) {
		pixel = col3;
	}

	// draw a disk of which center is not at (0,0).
	// Say the center is at c: (c.x, c.y).
	// The distance of any point r: (r.x, r.y) to c is
	// sqrt((r.x-c.x)^2+(r.y-c.y)^2)
	// define a distance vector d: (r.x - c.x, r.y - c.y)
	// in GLSL d can be calculated "d = r - c".
	// Just as in division, substraction of two vectors is done
	// component by component.
	// Then, length(d) means sqrt(d.x^2+d.y^2)
	// which is the distance formula we are looking for.
	vec2 center = vec2(0.9, 0.05);
	vec2 d = r - center;
	if( length(d) < 0.6) {
		pixel = col2;
	}
	// This shifting of the center of the shape works for any
	// kind of shape. If you have a formula in terms of r
	// f(r) = 0, then f(r-c)=0 expresses the same geometric shape
	// but its coordinate is shifted by c.

  gl_FragColor = vec4(pixel, 1.0);
}
// Note how the latest disk is shown and previous ones are left
// behind it. It is because the last if condition changes the pixel
// value at the end.
// If the coordinates of pixel fits multiple if conditions, the last
// manipulation will remain and fragColor is set to that one.
