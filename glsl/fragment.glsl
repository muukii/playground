#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution; // screen size

// gl_FragCoord -> location for current proccessing
// この gl_FragCoordはスレッドごとに異なる値を持っているためuniform変数とは呼ばず、代わりにvarying変数と呼びます。

void main() {
        
    vec2 location = gl_FragCoord.xy;

    if (location.x < 5.0 && location.y < 5.0) {
        gl_FragColor = vec4(1,1,1,1);
        return;
    }

    if (location.x > (u_resolution.x * 0.5)) {
        gl_FragColor = vec4(0.1,0.3,0.4,1);
    } else {
        gl_FragColor = vec4(0.2,0.3,0.4,1);
    }
}