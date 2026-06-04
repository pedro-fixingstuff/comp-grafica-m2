shader_type spatial;
render_mode diffuse_toon, specular_toon; 

uniform float heightscale = 1;
uniform sampler2D noise;
uniform sampler2D normalmap;
varying vec2 tex_position;

float height(vec2 position){
	return texture(noise, position / 10.0).x;
}

void vertex() {
	// Called for every vertex the material is visible on.
	// VERTEX.y += cos(VERTEX.x) * sin(VERTEX.z);
	tex_position = VERTEX.xz / 5.0 + 0.5;
	float height = texture(noise, tex_position).x;
	VERTEX.y = height; 
}

void fragment() {
	NORMAL_MAP = texture(normalmap, tex_position).xyz;
	ALBEDO = vec3(0.1, 0.3, 0.5);
	METALLIC = 0.5;
	ROUGHNESS = 0.5;
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
