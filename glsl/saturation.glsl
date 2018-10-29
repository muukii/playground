#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_texture_0;
uniform vec2 u_resolution;

 // Values from "Graphics Shaders: Theory and Practice" by Bailey and Cunningham
const mediump vec3 luminanceWeighting = vec3(0.22125, 0.7154, 0.0721);
const lowp float saturation = 1.0;

void main() {

  vec2 uv = gl_FragCoord.xy / u_resolution;  

  lowp vec4 textureColor = texture2D(u_texture_0, uv);
  lowp float luminance = dot(textureColor.rgb, luminanceWeighting);
  lowp vec3 greyScaleColor = vec3(luminance);
  
	gl_FragColor = vec4(mix(greyScaleColor, textureColor.rgb, saturation), textureColor.w);
}