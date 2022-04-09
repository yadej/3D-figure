uniform mat4 transform;
uniform mat4 texMatrix;
uniform float idselect;

attribute vec4 position;
attribute vec4 color;
attribute vec2 texCoord;
attribute float idnum;

varying vec4 vertColor;
varying vec4 vertTexCoord;
varying float vertexid;

void main() {
  gl_Position = transform * position;
  vertColor = color;
  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);
}
