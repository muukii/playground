#ifdef GL_ES
precision highp float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {

  float y = smoothstep(0.0, u_resolution.y, gl_FragCoord.xy.y);
  float x = smoothstep(0.0, u_resolution.x, gl_FragCoord.xy.x);

  vec3 color = vec3(y * abs(sin(u_time) * 0.2), x * abs(cos(u_time)), y * abs(sin(u_time)));

  gl_FragColor = vec4(color, 1.0);
}