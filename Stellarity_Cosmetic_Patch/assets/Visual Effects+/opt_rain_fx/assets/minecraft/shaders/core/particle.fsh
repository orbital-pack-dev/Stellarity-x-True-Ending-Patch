#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec2 texCoord0;
in vec4 vertexColor;

flat in int isRain;

out vec4 fragColor;


bool is_green_screen(vec3 c)
{
    return c.g > 0.75 &&
           c.g > c.r * 2.5 &&
           c.g > c.b * 2.5;
}


void main()
{
    vec4 texColor = texture(Sampler0, texCoord0);
    vec4 color = texColor * vertexColor * ColorModulator;

    if (isRain == 1 && is_green_screen(texColor.rgb))
    {
        discard;
    }

    if (color.a < 0.1)
    {
        discard;
    }

    fragColor = apply_fog(
        color,
        sphericalVertexDistance,
        cylindricalVertexDistance,
        FogEnvironmentalStart,
        FogEnvironmentalEnd,
        FogRenderDistanceStart,
        FogRenderDistanceEnd,
        FogColor
    );
}