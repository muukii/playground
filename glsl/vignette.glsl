#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_texture_0;

uniform vec2 u_resolution;

void main() {


  // vec2 vignetteCenter = u_resolution / 2.0;

  lowp vec2 vignetteCenter = vec2(400.0, 400.0);

  vec3 vignetteColor = vec3(.3,.2,.2);

  vec2 uv = gl_FragCoord.xy / u_resolution;  
  vec4 sourceImageColor = texture2D(u_texture_0, uv);
  float d = distance(uv, vignetteCenter);
  float percent = smoothstep(0.0, 1070.0, d);
  // gl_FragColor = vec4(vec3(percent, 1, 1), 1);
  gl_FragColor = vec4(mix(sourceImageColor.rgb, vignetteColor, percent), sourceImageColor.a);
}