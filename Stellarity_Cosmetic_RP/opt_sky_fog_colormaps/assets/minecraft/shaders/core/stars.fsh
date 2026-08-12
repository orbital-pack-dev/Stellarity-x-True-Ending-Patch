#version 330

#moj_import <minecraft:dynamictransforms.glsl>

out vec4 fragColor;

void main() {
    vec4 color = ColorModulator;

    color.rgb *= vec3(0.0, 0.0, 0.00);
    color.rgb = min(color.rgb, vec3(1.0));
    color.a = min(color.a * 0.0, 0.0);

    fragColor = color;
}