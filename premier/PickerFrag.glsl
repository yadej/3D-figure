#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying float vertexid;
//varying vec4 vertColor;

void main()
{
  float N0 = mod(vertexid, 256);
  //float N1 = mod ((vertexid-N0 ) /256.0), 256);
  //float N2 = mod ((vertexid-N0-N1*256 ) /256*256), 256);
  gl_FragColor = vec4(N0/255.0, N0/255.0, N0/255.0, 1.0);
  
}
