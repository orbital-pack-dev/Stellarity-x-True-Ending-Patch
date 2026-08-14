#version 150

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>

//
// ======================================================
// cloud data flags
// ======================================================
//

const int FACE_DIRECTION_BITS = 7;

const int FACE_REVERSED       = 1 << 4;
const int FORCE_UPPER_LIGHT   = 1 << 5;

const int EXTEND_Z_COORD      = 1 << 6;
const int EXTEND_X_COORD      = 1 << 7;

//
// ======================================================
// cloud uniforms
// ======================================================
//

layout(std140) uniform CloudInfo {
    vec4 CloudColor;
    vec3 CloudOffset;
    vec3 CellSize;
};

uniform isamplerBuffer CloudFaces;

//
// ======================================================
// visual config
// ======================================================
//

const float CLOUD_HEIGHT   = 1.5;
const float CLOUD_Y_OFFSET = 10.0;

// soft cloud lighting
const float SHADE_TOP      = 1.00;
const float SHADE_BOTTOM   = 1.00;

const float SHADE_NORTH    = 1.00;
const float SHADE_SOUTH    = 1.00;

const float SHADE_WEST     = 1.00;
const float SHADE_EAST     = 1.00;

// vertical alpha gradient
const float BOTTOM_ALPHA   = 0.75;
const float TOP_ALPHA      = 0.0;

//
// ======================================================
// outputs
// ======================================================
//

out float vertexDistance;
out vec4 vertexColor;

//
// ======================================================
// cube face geometry
// ======================================================
//

const vec3[] FACE_VERTICES = vec3[](

    // bottom
    vec3(1,0,0),
    vec3(1,0,1),
    vec3(0,0,1),
    vec3(0,0,0),

    // top
    vec3(0,1,0),
    vec3(0,1,1),
    vec3(1,1,1),
    vec3(1,1,0),

    // north
    vec3(0,0,0),
    vec3(0,1,0),
    vec3(1,1,0),
    vec3(1,0,0),

    // south
    vec3(1,0,1),
    vec3(1,1,1),
    vec3(0,1,1),
    vec3(0,0,1),

    // west
    vec3(0,0,1),
    vec3(0,1,1),
    vec3(0,1,0),
    vec3(0,0,0),

    // east
    vec3(1,0,0),
    vec3(1,1,0),
    vec3(1,1,1),
    vec3(1,0,1)
);

//
// ======================================================
// lighting helpers
// ======================================================
//

float getBrightness(int direction, bool topShade)
{
    if (topShade || direction == 1)
        return SHADE_TOP;

    if (direction == 0)
        return SHADE_BOTTOM;

    if (direction == 2)
        return SHADE_NORTH;

    if (direction == 3)
        return SHADE_SOUTH;

    if (direction == 4)
        return SHADE_WEST;

    return SHADE_EAST;
}

//
// ======================================================
// face vertex lookup
// ======================================================
//

vec3 getFaceVertex(int direction, int vertexIndex, bool reverseFace)
{
    int faceOffset = direction * 4;

    if (reverseFace)
        faceOffset += 3 - vertexIndex;
    else
        faceOffset += vertexIndex;

    return FACE_VERTICES[faceOffset];
}

//
// ======================================================
// main
// ======================================================
//

void main()
{
    int quadVertex =
        gl_VertexID % 4;

    int dataIndex =
        (gl_VertexID / 4) * 3;

    int cloudX =
        texelFetch(CloudFaces, dataIndex).r;

    int cloudZ =
        texelFetch(CloudFaces, dataIndex + 1).r;

    int packedData =
        texelFetch(CloudFaces, dataIndex + 2).r;

    int direction =
        packedData & FACE_DIRECTION_BITS;

    bool reverseFace =
        (packedData & FACE_REVERSED) != 0;

    bool topShade =
        (packedData & FORCE_UPPER_LIGHT) != 0;

    cloudX =
        (cloudX << 1) |
        ((packedData & EXTEND_X_COORD) >> 7);

    cloudZ =
        (cloudZ << 1) |
        ((packedData & EXTEND_Z_COORD) >> 6);

    vec3 localVertex =
        getFaceVertex(direction, quadVertex, reverseFace);

    vec3 scaledVertex =
        localVertex * CellSize;

    scaledVertex.y *= CLOUD_HEIGHT;

    vec3 worldPosition =
        scaledVertex +
        (vec3(cloudX, 0, cloudZ) * CellSize) +
        CloudOffset +
        vec3(0.0, CLOUD_Y_OFFSET, 0.0);

    float verticalBlend =
        clamp(
            scaledVertex.y / CLOUD_HEIGHT,
            0.0,
            1.0
        );

    float cameraRelative =
        CloudOffset.y - ModelOffset.y;

    bool invertGradient =
        cameraRelative < 0.0;

    float gradientFactor =
        verticalBlend;

    if (invertGradient)
        gradientFactor =
            1.0 - gradientFactor;

    float alphaGradient =
        mix(
            BOTTOM_ALPHA,
            TOP_ALPHA,
            gradientFactor
        );

    gl_Position =
        ProjMat *
        ModelViewMat *
        vec4(worldPosition, 1.0);

    vertexDistance =
        fog_spherical_distance(worldPosition);

    float brightness =
        getBrightness(direction, topShade);

    vec3 finalColor =
        vec3(brightness);

    vertexColor =
        vec4(
            finalColor,
            CloudColor.a * alphaGradient
        ) *
        CloudColor;
}