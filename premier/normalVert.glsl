
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec3 lightNormal;
uniform float idselect;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;
attribute float idnum;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;
varying float vertexid;

void main()
{
	gl_Position = transform * position;
	vertColor = color;
  vertexid = idnum;
}
