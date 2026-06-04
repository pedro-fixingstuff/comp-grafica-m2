shader_type spatial;

uniform float jump_height = 2.0;
uniform float speed = 2.0;
uniform float squash = 0.5;

void vertex() {
	// Trajetória balística
	float phase = abs(sin(TIME * speed));
	// A trajetória vai até abaixo de 0 para simulação do contato com o chão
	float bounce = ((jump_height + squash) * phase) - squash;
	VERTEX.y += bounce;

	// Cálculo da deformação preservando o volume da bola
	if (bounce <= 0.0) {
		float stretch = 1.0 + bounce;
		VERTEX.y *= stretch;
		VERTEX.x /= sqrt(stretch);
		VERTEX.z /= sqrt(stretch);
	}
}

void fragment() {
	ALBEDO = vec3(1.0, 0.1, 0.1);
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
