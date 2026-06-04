shader_type spatial;

uniform float jump_height = 2.0;
uniform float speed = 1.0;
uniform float squash = 0.5;
uniform float rotation_speed = 1.0;

void vertex() {
	// Trajetória balística
	float phase = abs(sin(TIME * speed));
	//float phase = 0.0;
	// A trajetória vai até abaixo de 0 para simulação do contato com o chão
	// 1. Calculate rotation angle based on time
    float angle = TIME * rotation_speed;

    // 2. Create a Rotation Matrix
    // This example rotates around the Y-axis (UP).
    // The formula creates a 2D rotation matrix for the X and Z coordinates.
    float cos_angle = cos(angle);
    float sin_angle = sin(angle);

    // MATRIX is a built-in that transforms vertex to model space.
    // We create a rotation matrix to modify it.
    mat3 rotation_matrix = mat3(
        vec3(cos_angle, 0.0, sin_angle),  // Column 1
        vec3(0.0, 1.0, 0.0),              // Column 2
        vec3(-sin_angle, 0.0, cos_angle)  // Column 3
    );

    // 3. Apply the rotation to the vertex position
    VERTEX = rotation_matrix * VERTEX;

    // Note: If you have normals, you should rotate them too for correct lighting
    NORMAL = rotation_matrix * NORMAL;
	float bounce = ((jump_height + squash) * phase) - squash;
	VERTEX.x += bounce;

	// Cálculo da deformação preservando o volume da bola

}

void fragment() {
	ALBEDO = vec3(1.0, 0.1, 0.1);
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
