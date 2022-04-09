#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;
uniform float idselect;

attribute float idnum;

varying vec4 vertColor;
varying vec4 vertTexCoord;
varying float vertexid;

void main() {
  if(abs(idnum - idselect) > 0.1){
    gl_FragColor = texture2D(texture, vertTexCoord.st) * vertColor;
 }else{
    gl_FragColor = texture2D(texture, vertTexCoord.st) * vec4(0.5,0.7,0.7, 1.0);
    //gl_FragColor = texture2D(texture, vertTexCoord.st) * vertColor;
  }
  
}
