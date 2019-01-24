#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_texture_0;
uniform sampler2D u_texture_1;
uniform sampler2D u_texture_2;
uniform sampler2D u_texture_3;
uniform vec2 u_resolution;
uniform float u_time;

void main() {

  vec2 uv = gl_FragCoord.xy / u_resolution;
  uv.x += abs(pow(sin(u_time), 100.0) * 0.13) * sin(u_time * sin(uv.y) * 0.003);
  uv.y += abs(pow(sin(u_time), 2.0) * 0.03) * sin(u_time * sin(uv.x) * 0.003);
  vec4 color = texture2D(u_texture_0, uv);
  color.r *= 1.2;
  gl_FragColor = color;  
}

