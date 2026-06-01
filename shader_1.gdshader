shader_type spatial;

uniform float amplitude = 0.02;
uniform float frequency = 16.0;

void vertex() {
	// Modula a esfera em latitude
    vec3 dir = normalize(VERTEX);

    float theta = acos(dir.y);

    float r = length(VERTEX);
    r += amplitude * sin(theta * frequency + TIME);

    VERTEX = dir * r;
}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
