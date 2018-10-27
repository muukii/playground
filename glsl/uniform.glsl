#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;

vec4 red() {
    return vec4(abs(sin(u_time) * 0.1),0.1,0.2,1.0);
	// return vec4(
    //     abs(sin(u_time)),
    //     abs(tan(u_time)),
    //     abs(cos(u_time)),
    //     1.0
    //     );
}

void main() {
	gl_FragColor = red();
}
