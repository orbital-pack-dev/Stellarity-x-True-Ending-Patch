#version 330

#moj_import <minecraft:dynamictransforms.glsl>

out vec4 fragColor;

void main() {
    vec4 color = ColorModulator;

    color.rgb *= vec3(1.5, 1.6, 1.75);
    color.rgb = min(color.rgb, vec3(1.0));
    color.a = min(color.a * 1.2, 1.0);

    fragColor = color;
}