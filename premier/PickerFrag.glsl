#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform ivec4 code;
 
out vec4 outputF;

void main()
{
    outputF = vec4(code/255.0, 0, 0, 0);
}
