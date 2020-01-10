#ifdef GL_ES
precision mediump float;
#endif


uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

const vec3 lineColor = vec3(0.0, 1.0, 0.0);

float plotLine(vec2 uv, float y){
    return smoothstep(y - 0.02, y, uv.y) -
           smoothstep(y, y + 0.02, uv.y);
}

float getA(float a){

    float epsilon = 0.00001;
    float min_param_a = 0.0 + epsilon;
    float max_param_a = 1.0 - epsilon;

    return max(min_param_a, min(max_param_a, a));
}



// Exponential ease-in and ease-out.
float expEasing(float x, float a){

    a = getA(a);

    float y = 0.0;
    if(a < 0.5){
        // emphasis
    	a = 2.0 * a;
        y = pow(x, a);
    } else {
        // de-emphasis
        a = 2.0 * (a - 0.5);
        y = pow(x, 1.0 / (1.0 - a));
    }

    return y;
}


// Double-Exponential Seat
float doubleExpSeat(float x, float a){

    a = getA(a);

    float y = 0.0;

    if(x <= 0.5){
    	y = (pow(2.0 * x, 1.0 - a)) / 2.0;
    } else {
     	y = 1.0 - (pow(2.0 * (1.0 - x), 1.0 - a)) / 2.0;
    }

    return y;
}


// Double-Exponential Sigmoid
// Useful for adjustable contrast
// When a is approximately 0.426 this function approximates Raised Inverted Cosine to within 1%
float doubleExpSigmoid(float x, float a){

    a = getA(a);
    a = 1.0 - a;

    float y = 0.0;

    if(x <= 0.5){
    	y = pow(2.0 * x, 1.0 / a) / 2.0;
    } else {
        y = 1.0 - pow(2.0 * (1.0 - x), 1.0 / a) / 2.0;

    }

    return y;
}


// Logistic Sigmoid
// Growth of organic populations
// Signal response in neural nets
// Expensive to calculate
float logisticSigmoid(float x, float a){

    a = getA(a);
    a = 1.0 / (1.0 - a) - 1.0;

    float A = 1.0 / (1.0 + exp(0.0 - (x - 0.5) * a * 2.0));
    float B = 1.0 / (1.0 + exp(a));
    float C = 1.0 / (1.0 + exp(0.0 - a));

    return (A - B) / (C - B);
}


void main() {
		vec2 uv = gl_FragCoord.xy/u_resolution;

	//float y = expEasing(uv.x, 0.867);	//ease in
	//float y = expEasing(uv.x, 0.220); //ease out

    //float y = doubleExpSeat(uv.x, 0.147);
	//float y = doubleExpSeat(uv.x, 0.607);
    //float y = doubleExpSeat(uv.x, 0.907);

    //float y = doubleExpSigmoid(uv.x, 0.367);
    //float y = doubleExpSigmoid(uv.x, 0.727);
    //float y = doubleExpSigmoid(uv.x, 0.887);

    //float y = logisticSigmoid(uv.x, 0.0);
	//float y = logisticSigmoid(uv.x, 0.787);
    //float y = logisticSigmoid(uv.x, 0.920);
	//float y = logisticSigmoid(uv.x, 0.987);

    vec3 gradient = vec3(y);

    float line = plotLine(uv, y);

    vec3 color = (1.0 - line) * gradient + line * lineColor;

    gl_FragColor = vec4(color, 1.0);
}
