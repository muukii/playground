#ifdef GL_ES
precision mediump float;
/*
precision mediump float; は、全ての浮動小数点型の変数に中レベルの精度を指定しています。より低い精度（precision lowp float;）や高い精度（precision highp float;）を選ぶこともできます。
*/
#endif

vec4 red() {
	return vec4(0.2,0.0,0.4,1.0);
}

void main() {
	gl_FragColor = red();
}
