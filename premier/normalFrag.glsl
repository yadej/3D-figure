#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif
uniform float idselect;
varying float vertexid;
varying vec4 vertColor;

void main()
{  
  if(abs(vertexid - idselect) > 0.1){
    gl_FragColor = vertColor;
  }else{
    gl_FragColor = vec4(0.5,0.7,0.7, 1.0);
  }
}
