#version 330

// ===== CONFIG =====
const vec3 SHADOW_FLOOR_COLOR = vec3(0.12, 0.14, 0.22);

const float BLOCK_BOOST = 0.08;
const float BLOCK_BOOST_POWER = 1.75;
const float BLOCK_WARMTH = 0.0;

const float SKY_CURVE = 1.35;
const float SKY_EXPOSURE = 1.0;

const float NIGHT_BLUE_STRENGTH = 0.28;
const vec3 NIGHT_BLUE_COLOR = vec3(0.55, 0.65, 1.00);

const float BASE_SOFTEN = 0.08;
const float BRIGHTNESS_SOFTEN = 0.035;

const float SHADOW_STRENGTH = 0.12;

layout(std140) uniform LightmapInfo {
    float AmbientLightFactor;
    float SkyFactor;
    float BlockFactor;
    float NightVisionFactor;
    float DarknessScale;
    float DarkenWorldFactor;
    float BrightnessFactor;
    vec3 SkyLightColor;
    vec3 AmbientColor;
} lightmapInfo;

in vec2 texCoord;
out vec4 fragColor;

float get_brightness(float level) {
    return level / (4.0 - 3.0 * level);
}

vec3 notGamma(vec3 color) {
    float maxComponent = max(max(color.r, color.g), color.b);
    if (maxComponent <= 0.0) return color;

    float inv = 1.0 - maxComponent;
    float scaled = 1.0 - inv * inv * inv * inv;
    return color * (scaled / maxComponent);
}

vec3 blockLightColor(float b) {
    return vec3(
        b,
        b * ((b * 0.6 + 0.4) * 0.6 + 0.4),
        b * (b * b * 0.6 + 0.4)
    );
}

void main() {
    float blockLevel = floor(texCoord.x * 16.0) / 15.0;
    float skyLevel   = floor(texCoord.y * 16.0) / 15.0;

    float blockBrightness = get_brightness(blockLevel) * lightmapInfo.BlockFactor;
    float skyBrightness   = get_brightness(skyLevel)   * lightmapInfo.SkyFactor;

    bool normalLightmap = lightmapInfo.AmbientLightFactor == 0.0;

    if (normalLightmap) {
        float b = clamp(blockBrightness, 0.0, 1.0);
        float boosted = 1.0 - pow(1.0 - b, BLOCK_BOOST_POWER);
        blockBrightness = mix(b, boosted, BLOCK_BOOST);
    }

    skyBrightness = pow(clamp(skyBrightness, 0.0, 1.0), SKY_CURVE) * SKY_EXPOSURE;
    skyBrightness = clamp(skyBrightness, 0.0, 1.0);

    vec3 color = blockLightColor(blockBrightness);

    color = mix(color, lightmapInfo.AmbientColor, lightmapInfo.AmbientLightFactor);

    color += lightmapInfo.SkyLightColor * skyBrightness;
    color = mix(color, vec3(0.75), BASE_SOFTEN);

    if (normalLightmap) {
        vec3 darkened = color * vec3(0.7, 0.6, 0.6);
        color = mix(color, darkened, lightmapInfo.DarkenWorldFactor);
    }

    if (normalLightmap) {
        float blockMask = 1.0 - clamp(blockBrightness * 2.0, 0.0, 1.0);
        float skyMask = clamp(skyBrightness * 2.5, 0.0, 1.0);
        float darknessMask = 1.0 - clamp(max(max(color.r, color.g), color.b) * 1.6, 0.0, 1.0);

        float nightBlueMask = blockMask * skyMask * darknessMask * NIGHT_BLUE_STRENGTH;
        color = mix(color, color * NIGHT_BLUE_COLOR, nightBlueMask);
    }

    if (lightmapInfo.NightVisionFactor > 0.0) {
        float m = max(color.r, max(color.g, color.b));
        if (m > 0.0 && m < 1.0) {
            color = mix(color, color / m, lightmapInfo.NightVisionFactor);
        }
    }

    if (normalLightmap) {
        color = clamp(color - vec3(lightmapInfo.DarknessScale), 0.0, 1.0);
    }

    color = clamp(color, 0.0, 1.0);

    color = mix(color, notGamma(color), lightmapInfo.BrightnessFactor);
    color = mix(color, vec3(0.75), BRIGHTNESS_SOFTEN);

    vec3 shadow = color * color;
    color = mix(color, shadow, SHADOW_STRENGTH);

    if (normalLightmap) {
        color = max(color, SHADOW_FLOOR_COLOR);
    }

    color = clamp(color, 0.0, 1.0);

    fragColor = vec4(color, 1.0);
}