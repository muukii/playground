#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

void main() {

  float a = step(u_resolution.y * 0.5, gl_FragCoord.xy.y);

  vec3 color = vec3(a, 0.5, 0.5);

  gl_FragColor = vec4(color, 1.0);
}