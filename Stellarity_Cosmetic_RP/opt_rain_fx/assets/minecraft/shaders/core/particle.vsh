#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <minecraft:rain_utils.glsl>

in vec3 Position;
in vec2 UV0;
in vec4 Color;
in ivec2 UV2;

uniform sampler2D Sampler0;
uniform sampler2D Sampler2;

out float sphericalVertexDistance;
out float cylindricalVertexDistance;
out vec2 texCoord0;
out vec4 vertexColor;

flat out int isRain;

mat4 mat_xform() {
    float rot_z = 20.0;

    // X/Y scale for the rain quad.
    // x = width, y = length
    vec2 scale = vec2(1.0, 1.6);

    // Keep this offset for lifting rain above the ground/water.
    vec3 offset = vec3(0.0, 2.5, 0.0);

    float pi = 3.14159265;
    float r = rot_z * (pi / 180.0);

    mat4 scaleMat = mat4(
        scale.x, 0.0,     0.0, 0.0,
        0.0,     scale.y, 0.0, 0.0,
        0.0,     0.0,     1.0, 0.0,
        0.0,     0.0,     0.0, 1.0
    );

    mat4 rotMat = mat4(
        cos(r),  sin(r), 0.0, 0.0,
       -sin(r),  cos(r), 0.0, 0.0,
        0.0,     0.0,    1.0, 0.0,
        0.0,     0.0,    0.0, 1.0
    );

    // Correct GLSL translation matrix.
    // Translation must be in the last column, not in the Y row.
    mat4 posMat = mat4(
        1.0,      0.0,      0.0,      0.0,
        0.0,      1.0,      0.0,      0.0,
        0.0,      0.0,      1.0,      0.0,
        offset.x, offset.y, offset.z, 1.0
    );

    return posMat * rotMat * scaleMat;
}

vec2 rain_tail_compensation(vec2 uv) {
    float rot_z = 20.0;
    float pi = 3.14159265;
    float r = rot_z * (pi / 180.0);

    // Extends only the lower part of the rain quad.
    // Increase this if the gap near the ground is still visible.
    float tail_extend = 0.08;

    // Usually UV.y = 0.0 is top and UV.y = 1.0 is bottom.
    // If the wrong side stretches, replace this with: 1.0 - uv.y
    float bottom_mask = uv.y;

    // Direction of the lower tail after the same Z rotation.
    vec2 rain_dir = normalize(vec2(sin(r), -cos(r)));

    return rain_dir * tail_extend * bottom_mask;
}

void main() {
    texCoord0 = UV0;

    float alpha = textureLod(Sampler0, texCoord0, 0.0).a * 255.0;
    vec3 fogPos = Position;

    if (check_alpha(alpha, 97.0)) {
        vec4 transformed = mat_xform() * vec4(Position, 1.0);

        // Compensates the empty ground gap caused by slanted and lifted rain.
        // This does not move the whole rain quad down, only stretches its lower part.
        transformed.xy += rain_tail_compensation(UV0);

        gl_Position = ProjMat * ModelViewMat * transformed;
        fogPos = transformed.xyz;
        isRain = 1;
    } else {
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
        isRain = 0;
    }

    sphericalVertexDistance = fog_spherical_distance(fogPos);
    cylindricalVertexDistance = fog_cylindrical_distance(fogPos);
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
}
