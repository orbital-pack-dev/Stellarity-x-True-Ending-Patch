#version 330

uniform sampler2D InSampler;
uniform sampler2D InDepthSampler;

in vec2 texCoord;
out vec4 fragColor;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 InSize;
};

layout(std140) uniform PolyGlobals {
    mat4 PolyProjMat;
    mat4 PolyModelViewMat;
    float PolySunAngle;
};

layout(std140) uniform Globals {
    ivec3 CameraBlockPos;
    vec3 CameraOffset;
    vec2 ScreenSize;
    float GlintAlpha;
    float GameTime;
    int MenuBlurRadius;
    int UseRgss;
};

layout(std140) uniform Fog {
    vec4 FogColor;
};

// ---------------- CONFIG ----------------
const float SUNSET_GLARE_MULTIPLIER = 2.4;
const float SUNSET_ANGLE_WIDTH = 0.18;

const float HALO_RADIUS = 0.10;
const float VEIL_RADIUS = 0.55;

const float HALO_INTENSITY = 0.34;
const float VEIL_INTENSITY = 0.26;

const vec3 GLARE_COLOR = vec3(255.0/255.0, 207.0/255.0, 59.0/255.0);


// Horizontal streaks
const float STREAK_INTENSITY = 0.25;

const float STREAK_LENGTH_1 = 0.045;
const float STREAK_THICKNESS_1 = 0.006;
const float STREAK_Y_OFFSET_1 = 0.014;

const float STREAK_LENGTH_2 = 0.02;
const float STREAK_THICKNESS_2 = 0.006;
const float STREAK_Y_OFFSET_2 = -0.016;
const float STREAK_SECOND_INTENSITY = 0.6;

const float STREAK_EDGE_SOFTNESS = 0.5;

const float STREAK_FEATHER_1 = 4.0;
const float STREAK_FEATHER_2 = 4.0;

// Пикселизация локальных flare-элементов
const float PIXEL_SIZE = 0.003;

// Pixel lens ghosts
const float GHOST_INTENSITY = 0.12;
const float GHOST_DISTANCE_FADE = 1.15;
const float GHOST_GLOW_SIZE_MULT = 2.30;
const float GHOST_GLOW_STRENGTH = 0.55;
const float GHOST_CORE_SHARPNESS = 5.50;
const float GHOST_GLOW_SHARPNESS = 1.60;

// Fog tint for pixel ghosts
// 0.0 = original ghost color, 1.0 = full current fog color.
const float GHOST_FOG_MIX_GLOBAL = 1.00;

// Ghost 5
const float GHOST_1_SCALE = 0.60;
const float GHOST_1_RADIUS = 0.099;
const float GHOST_1_STRENGTH = 1.20;
const vec2  GHOST_1_OFFSET = vec2(0.000, -0.1);
const vec3  GHOST_1_COLOR = vec3(62.0/255.0, 65.0/255.0, 120.0/255.0);
const float GHOST_1_FOG_MIX = 1.0;

// Ghost 1
const float GHOST_2_SCALE = -0.60;
const float GHOST_2_RADIUS = 0.100;
const float GHOST_2_STRENGTH = 1.60;
const vec2  GHOST_2_OFFSET = vec2(0.000, -0.0);
const vec3  GHOST_2_COLOR = vec3(80.0/255.0, 60.0/255.0, 36.0/255.0);
const float GHOST_2_FOG_MIX = 0.00;

// Ghost 4
const float GHOST_3_SCALE = 0.30;
const float GHOST_3_RADIUS = 0.030;
const float GHOST_3_STRENGTH = 0.80;
const vec2  GHOST_3_OFFSET = vec2(0.000, -0.075);
const vec3  GHOST_3_COLOR = vec3(79.0/255.0, 127.0/255.0, 168.0/255.0);
const float GHOST_3_FOG_MIX = 0.75;

// Ghost 3
const float GHOST_4_SCALE = -0.10;
const float GHOST_4_RADIUS = 0.030;
const float GHOST_4_STRENGTH = 0.90;
const vec2  GHOST_4_OFFSET = vec2(0.000, -0.05);
const vec3  GHOST_4_COLOR = vec3(140.0/255.0, 155.0/255.0, 167.0/255.0);
const float GHOST_4_FOG_MIX = 0.0;

// Ghost 6
const float GHOST_5_SCALE = 0.95;
const float GHOST_5_RADIUS = 0.060;
const float GHOST_5_STRENGTH = 1.00;
const vec2  GHOST_5_OFFSET = vec2(0.000, -0.125);
const vec3  GHOST_5_COLOR = vec3(41.0/255.0, 53.0/255.0, 58.0/255.0);
const float GHOST_5_FOG_MIX = 1.25;

// Ghost 2
const float GHOST_6_SCALE = -0.36;
const float GHOST_6_RADIUS = 0.065;
const float GHOST_6_STRENGTH = 0.85;
const vec2  GHOST_6_OFFSET = vec2(0.000, -0.05);
const vec3  GHOST_6_COLOR = vec3(133.0/255.0, 146.0/255.0, 157.0/255.0);
const float GHOST_6_FOG_MIX = 0.00;

// Стабильность depth-окклюзии
const float SKY_DEPTH_MIN = 0.9997;
const float SKY_DEPTH_MAX = 0.999995;
const float VIS_RADIUS_PX = 96;

const float SUN_DISC_RADIUS_PX = 96;
const float EDGE_PRESERVE = 1.0;

// Фейд по краям экрана
const float SCREEN_EDGE_FADE_X = 0.06;
const float SCREEN_EDGE_FADE_Y = 0.09;

// ---------------------------------------

float getDepth(vec2 uv) {
    return texture(InDepthSampler, uv).r;
}

vec2 pixelateUV(vec2 uv) {
    return floor(uv / PIXEL_SIZE) * PIXEL_SIZE + PIXEL_SIZE * 0.5;
}

vec3 getLightScreenPos(float angle, out bool isBehind, out float screenFade) {
    vec3 sunDirWorld = normalize(vec3(
        cos(angle),
        sin(angle),
        0.0
    ));

    vec3 camPos = vec3(PolyModelViewMat[3]);
    vec3 lightPosWorld = camPos - sunDirWorld * 1000.0;

    vec4 lightClip = PolyProjMat * (PolyModelViewMat * vec4(lightPosWorld, 1.0));

    isBehind = (lightClip.w <= 0.0);
    if (isBehind) {
        screenFade = 0.0;
        return vec3(-1.0);
    }

    vec3 lightNDC = lightClip.xyz / lightClip.w;
    vec2 uv = lightNDC.xy * 0.5 + 0.5;

    float fadeLeft   = smoothstep(0.0, SCREEN_EDGE_FADE_X, uv.x);
    float fadeRight  = smoothstep(0.0, SCREEN_EDGE_FADE_X, 1.0 - uv.x);
    float fadeTop    = smoothstep(0.0, SCREEN_EDGE_FADE_Y, uv.y);
    float fadeBottom = smoothstep(0.0, SCREEN_EDGE_FADE_Y, 1.0 - uv.y);

    screenFade = fadeLeft * fadeRight * fadeTop * fadeBottom;

    return vec3(uv, lightClip.w);
}

void getLightWeights(float angle, out float sunWeight, out float moonWeight) {
    const float PI = 3.14159;

    float t = angle + PI;
    t = mod(t, 2.0 * PI);

    // Точки подобраны под твою текущую фазу PolySunAngle:
    // день держится до заката,
    // потом плавно тухнет,
    // ночью 0,
    // перед 24000 плавно набирает обратно до 1.
    const float SUNSET_START  = PI - 0.10;
    const float SUNSET_END    = PI + 0.18;

    const float SUNRISE_START = 2.0 * PI - 0.42;
    const float SUNRISE_END   = 2.0 * PI - 0.06;

    if (t < SUNSET_START) {
        sunWeight = 1.0;
    } else if (t < SUNSET_END) {
        sunWeight = 1.0 - smoothstep(SUNSET_START, SUNSET_END, t);
    } else if (t < SUNRISE_START) {
        sunWeight = 0.0;
    } else if (t < SUNRISE_END) {
        sunWeight = smoothstep(SUNRISE_START, SUNRISE_END, t);
    } else {
        sunWeight = 1.0;
    }

    moonWeight = 1.0 - sunWeight;
}

float angleDistance(float a, float b) {
    const float PI = 3.14159;
    float d = abs(a - b);
    return min(d, 2.0 * PI - d);
}

float getSunsetBoost(float angle) {
    const float PI = 3.14159;

    float t = mod(angle + PI, 2.0 * PI);

    // Пики около горизонта: восход и закат
    float sunsetDist = angleDistance(t, PI);
    float sunriseDist = min(t, 2.0 * PI - t);

    float sunset = 1.0 - smoothstep(0.0, SUNSET_ANGLE_WIDTH, sunsetDist);
    float sunrise = 1.0 - smoothstep(0.0, SUNSET_ANGLE_WIDTH, sunriseDist);

    return clamp(max(sunset, sunrise), 0.0, 1.0);
}

float sampleSkyVisibility(vec2 uv) {
    if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) {
        return 0.0;
    }

    float d = getDepth(uv);
    return smoothstep(SKY_DEPTH_MIN, SKY_DEPTH_MAX, d);
}

vec2 getSunVisibility(vec2 lightUV) {
    if (lightUV.x < 0.0 || lightUV.x > 1.0 || lightUV.y < 0.0 || lightUV.y > 1.0) {
        return vec2(0.0);
    }

    vec2 px = 1.0 / InSize;
    vec2 innerR = px * VIS_RADIUS_PX;

    float centerSum = 0.0;
    float centerW = 0.0;

    float w = 2.0;
    centerSum += sampleSkyVisibility(lightUV) * w;
    centerW += w;

    w = 1.5;
    centerSum += sampleSkyVisibility(lightUV + vec2( innerR.x, 0.0)) * w;
    centerSum += sampleSkyVisibility(lightUV + vec2(-innerR.x, 0.0)) * w;
    centerSum += sampleSkyVisibility(lightUV + vec2(0.0,  innerR.y)) * w;
    centerSum += sampleSkyVisibility(lightUV + vec2(0.0, -innerR.y)) * w;
    centerW += 4.0 * w;

    w = 1.0;
    centerSum += sampleSkyVisibility(lightUV + vec2( innerR.x,  innerR.y)) * w;
    centerSum += sampleSkyVisibility(lightUV + vec2(-innerR.x,  innerR.y)) * w;
    centerSum += sampleSkyVisibility(lightUV + vec2( innerR.x, -innerR.y)) * w;
    centerSum += sampleSkyVisibility(lightUV + vec2(-innerR.x, -innerR.y)) * w;
    centerW += 4.0 * w;

    float avgVisible = centerSum / centerW;

    vec2 discR = px * SUN_DISC_RADIUS_PX;

    float maxVisible = 0.0;
    maxVisible = max(maxVisible, sampleSkyVisibility(lightUV));
    maxVisible = max(maxVisible, sampleSkyVisibility(lightUV + vec2( discR.x, 0.0)));
    maxVisible = max(maxVisible, sampleSkyVisibility(lightUV + vec2(-discR.x, 0.0)));
    maxVisible = max(maxVisible, sampleSkyVisibility(lightUV + vec2(0.0,  discR.y)));
    maxVisible = max(maxVisible, sampleSkyVisibility(lightUV + vec2(0.0, -discR.y)));

    maxVisible = max(maxVisible, sampleSkyVisibility(lightUV + vec2( discR.x * 0.7,  discR.y * 0.7)));
    maxVisible = max(maxVisible, sampleSkyVisibility(lightUV + vec2(-discR.x * 0.7,  discR.y * 0.7)));
    maxVisible = max(maxVisible, sampleSkyVisibility(lightUV + vec2( discR.x * 0.7, -discR.y * 0.7)));
    maxVisible = max(maxVisible, sampleSkyVisibility(lightUV + vec2(-discR.x * 0.7, -discR.y * 0.7)));

    avgVisible = smoothstep(0.18, 0.82, avgVisible);
    maxVisible = smoothstep(0.08, 0.70, maxVisible);

    return vec2(avgVisible, maxVisible);
}

float getSingleHorizontalStreak(
    vec2 uv,
    vec2 lightUV,
    float yOffset,
    float length,
    float thickness,
    float feather
) {
    vec2 streakUV = lightUV + vec2(0.0, yOffset);
    vec2 delta = uv - streakUV;

    float lengthMask = exp(-pow(
        abs(delta.x) / max(length, 0.0001),
        STREAK_EDGE_SOFTNESS
    ));

    // Только мягкая растушёвка без жёсткого ядра
    float thicknessMask = 1.0 - smoothstep(
        0.0,
        thickness * feather,
        abs(delta.y)
    );

    return thicknessMask * lengthMask;
}

float getHorizontalStreak(vec2 uv, vec2 lightUV) {
    float streak1 = getSingleHorizontalStreak(
        uv,
        lightUV,
        STREAK_Y_OFFSET_1,
        STREAK_LENGTH_1,
        STREAK_THICKNESS_1,
        STREAK_FEATHER_1
    );

    float streak2 = getSingleHorizontalStreak(
        uv,
        lightUV,
        STREAK_Y_OFFSET_2,
        STREAK_LENGTH_2,
        STREAK_THICKNESS_2,
        STREAK_FEATHER_2
    ) * STREAK_SECOND_INTENSITY;

    return streak1 + streak2;
}


float aspectDist(vec2 a, vec2 b) {
    vec2 d = a - b;
    d.x *= InSize.x / InSize.y;
    return length(d);
}

float edgeFadeForUV(vec2 uv) {
    return
        smoothstep(0.0, 0.08, uv.x) *
        smoothstep(0.0, 0.08, 1.0 - uv.x) *
        smoothstep(0.0, 0.08, uv.y) *
        smoothstep(0.0, 0.08, 1.0 - uv.y);
}

float roundPixelGhost(
    vec2 uv,
    vec2 lightUV,
    float scale,
    vec2 offset,
    float radius,
    float strength
) {
    vec2 dir = lightUV - vec2(0.5);
    float lenDir = max(length(dir), 0.0001);
    vec2 n = dir / lenDir;

    vec2 pos = vec2(0.5) - n * lenDir * scale + offset;
    float d = aspectDist(uv, pos);

    float safeRadius = max(radius, 0.0001);

    float core = exp(-pow(d / safeRadius, GHOST_CORE_SHARPNESS));
    float glow = exp(-pow(d / (safeRadius * GHOST_GLOW_SIZE_MULT), GHOST_GLOW_SHARPNESS)) * GHOST_GLOW_STRENGTH;

    float distanceFade = 1.0 - smoothstep(0.0, GHOST_DISTANCE_FADE, lenDir);

    return (core + glow) * strength * distanceFade * edgeFadeForUV(pos);
}

vec3 mixGhostFog(vec3 ghostColor, float fogMix) {
    float amount = clamp(fogMix * GHOST_FOG_MIX_GLOBAL, 0.0, 1.0);
    return mix(ghostColor, FogColor.rgb, amount);
}

vec3 getPixelGhosts(vec2 uv, vec2 lightUV) {
    vec3 ghosts = vec3(0.0);

    ghosts += mixGhostFog(GHOST_1_COLOR, GHOST_1_FOG_MIX) * roundPixelGhost(uv, lightUV, GHOST_1_SCALE, GHOST_1_OFFSET, GHOST_1_RADIUS, GHOST_1_STRENGTH);
    ghosts += mixGhostFog(GHOST_2_COLOR, GHOST_2_FOG_MIX) * roundPixelGhost(uv, lightUV, GHOST_2_SCALE, GHOST_2_OFFSET, GHOST_2_RADIUS, GHOST_2_STRENGTH);
    ghosts += mixGhostFog(GHOST_3_COLOR, GHOST_3_FOG_MIX) * roundPixelGhost(uv, lightUV, GHOST_3_SCALE, GHOST_3_OFFSET, GHOST_3_RADIUS, GHOST_3_STRENGTH);
    ghosts += mixGhostFog(GHOST_4_COLOR, GHOST_4_FOG_MIX) * roundPixelGhost(uv, lightUV, GHOST_4_SCALE, GHOST_4_OFFSET, GHOST_4_RADIUS, GHOST_4_STRENGTH);
    ghosts += mixGhostFog(GHOST_5_COLOR, GHOST_5_FOG_MIX) * roundPixelGhost(uv, lightUV, GHOST_5_SCALE, GHOST_5_OFFSET, GHOST_5_RADIUS, GHOST_5_STRENGTH);
    ghosts += mixGhostFog(GHOST_6_COLOR, GHOST_6_FOG_MIX) * roundPixelGhost(uv, lightUV, GHOST_6_SCALE, GHOST_6_OFFSET, GHOST_6_RADIUS, GHOST_6_STRENGTH);

    return ghosts;
}


void main() {
    vec4 base = texture(InSampler, texCoord);
    vec3 color = base.rgb;

    float sunWeight, moonWeight;
    getLightWeights(PolySunAngle, sunWeight, moonWeight);

    bool isBehind;
    float screenFade;
    vec3 lightData = getLightScreenPos(PolySunAngle, isBehind, screenFade);

    float sunsetBoost = getSunsetBoost(PolySunAngle);

    // Буст не включает солнце сам по себе,
    // он только усиливает glare, когда солнце уже активно.
    float sunPresence = sunWeight;

    if (isBehind || sunPresence <= 0.0 || screenFade <= 0.0) {
        fragColor = base;
        return;
    }

    vec2 lightUV = lightData.xy;
    vec2 vis = getSunVisibility(lightUV);

    float sunVisibleAvg = vis.x;
    float sunVisibleEdge = vis.y;

    float lookFactor = smoothstep(0.68, 0.12, distance(lightUV, vec2(0.5, 0.5)));

    float sunsetMultiplier = mix(1.0, SUNSET_GLARE_MULTIPLIER, sunsetBoost * sunWeight);

    float rawStrength = sunPresence * screenFade * lookFactor;

    float edgeSupport = max(
        sunVisibleAvg,
        sunVisibleEdge * EDGE_PRESERVE + sunVisibleAvg * (1.0 - EDGE_PRESERVE)
    );

    float haloStrength = smoothstep(0.03, 0.25, rawStrength * edgeSupport);
    float veilStrength = smoothstep(0.02, 0.22, rawStrength * edgeSupport);
    float streakStrength = smoothstep(0.02, 0.20, rawStrength * edgeSupport);
    float ghostStrength = smoothstep(0.04, 0.24, rawStrength * edgeSupport);

    if (max(max(haloStrength, veilStrength), max(streakStrength, ghostStrength)) <= 0.0001) {
        fragColor = base;
        return;
    }

    // Пикселизируем все glare-слои.
    // Базовая сцена остаётся гладкой, но halo / veil / streak / ghosts
    // теперь используют одну и ту же блочную UV-сетку.
    vec2 pixelatedUV = pixelateUV(texCoord);

    vec2 delta = pixelatedUV - lightUV;
    float aspect = InSize.x / InSize.y;
    delta.x *= aspect;
    float dist = length(delta);

    float halo = exp(-dist / HALO_RADIUS);
    float veil = exp(-dist / VEIL_RADIUS);

    float streak = getHorizontalStreak(pixelatedUV, lightUV);
    vec3 ghosts = getPixelGhosts(pixelatedUV, lightUV);

    float sceneMask = smoothstep(1.0, 0.99995, getDepth(texCoord));

    vec3 localGlow = (
        GLARE_COLOR * (
            halo * HALO_INTENSITY * haloStrength +
            streak * STREAK_INTENSITY * streakStrength
        ) +
        ghosts * GHOST_INTENSITY * ghostStrength
    ) * 1.1 * sunsetMultiplier * sunWeight;

    float washout = veil * VEIL_INTENSITY * veilStrength * (0.35 + 0.65 * sceneMask) * sunsetMultiplier * sunWeight;

    color += localGlow;
    color = mix(color, color + GLARE_COLOR * 0.35, washout);

    fragColor = vec4(color, base.a);
}