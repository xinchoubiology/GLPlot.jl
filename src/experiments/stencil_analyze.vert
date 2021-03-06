{{GLSL_VERSION}}
{{GLSL_EXTENSIONS}}

{{in}} float dummy;
uniform vec2 mouseposition;

uniform usampler2D stencil;
uniform int groups;

flat {{out}} uint fragvalue;


void main(){
	ivec2 tsize 	= textureSize(stencil, 0);
	ivec2 position	= ivec2(gl_InstanceID % tsize.x, gl_InstanceID / tsize.x);

	if((abs(mouseposition.x - float(position.x)) <= 2) && (abs(mouseposition.y - float(position.y)) <= 2))
	{
		gl_Position = vec4(-0.5, 0,dummy,1);
		fragvalue 	= texelFetch(stencil, position, 0).r;

	}else
	{
		fragvalue 	= uint(1);
   		gl_Position = vec4(0, 0, dummy, 1.0); //image coordinate in space -1:1
	}
}