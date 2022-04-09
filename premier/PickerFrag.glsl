#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif
uniform float idselect;

varying float vertexid;
//varying vec4 vertColor;

void main()
{
  float N0 = mod(vertexid, 256);
  float N1 = mod((vertexid-N0 ) /256, 256);
  float N2 = mod((vertexid-N0-N1*256 ) /(256*256), 256);
  float a = N0 + N1 * 256 + N2 * 256 * 256;
  if( abs(a - idselect) >= 0.1){
    gl_FragColor = vec4(N0/255.0, N1/255.0, N2/255.0, 1.0);
  }else{
    gl_FragColor = vec4(0.5, 0.7, 0.7, 1.0);
  }
  
}
