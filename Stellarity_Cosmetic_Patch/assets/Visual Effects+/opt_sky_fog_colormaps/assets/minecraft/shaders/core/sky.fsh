#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:globals.glsl>
#moj_import <minecraft:projection.glsl>

in float sphericalVertexDistance;
in float cylindricalVertexDistance;

out vec4 fragColor;

const float PI = 3.14159265359;
const float TAU = 6.28318530718;

// ---------- HAZE CONFIG ----------

// При этой яркости неба haze уже 100%
const float HAZE_BRIGHTNESS_FULL = 0.45;

// При этой яркости неба haze падает до минимального значения
const float HAZE_BRIGHTNESS_MIN = 0.25;

// Минимальная сила haze ночью
// 0.50 = haze остаётся на 50%
const float HAZE_NIGHT_MULTIPLIER = 1.0;

const float HAZE_START = -0.16;
const float HAZE_END = 0.42;

const float HAZE_OPACITY = 1.35;
const float HAZE_POWER = 1.00;

const float HAZE_WHITE_OVERLAY = 0.9;
const float HAZE_FOG_MIX = 0.5;


// ---------- DOME CONFIG ----------

const vec3 DOME_COLOR = vec3(0.0, 0.0, 0.0);

const float DOME_STRENGTH = 0.12;
const float DOME_START = 0.42;
const float DOME_END = 1.00;
const float DOME_POWER = 1.45;


// ---------- NIGHT OVERLAY CONFIG ----------

// Цвет дополнительного ночного оверлея
const vec3 NIGHT_OVERLAY_COLOR = vec3(0.1059, 0.2196, 0.4549);

// Сила оверлея
const float NIGHT_OVERLAY_STRENGTH = 0.35;

// При какой яркости неба оверлей начинает появляться
const float NIGHT_OVERLAY_FADE_START = 0.08;

// При какой яркости неба оверлей исчезает
const float NIGHT_OVERLAY_FADE_END = 0.24;

// Контраст ночной маски
const float NIGHT_OVERLAY_POWER = 1.0;

// 0 = обычный mix
// 1 = Photoshop-like overlay
const int NIGHT_OVERLAY_BLEND_MODE = 0;


// ---------- STARS CONFIG ----------

const float STAR_STRENGTH = 1.15;
const float STAR_DENSITY = 64.0;
const float STAR_SIZE = 0.1;

const float STAR_HORIZON_START = -0.2;
const float STAR_HORIZON_END = 0.08;

const float STAR_DAY_FADE_START = 0.08;
const float STAR_DAY_FADE_END = 0.24;


// ---------- BLEND FUNCTIONS ----------

vec3 blendOverlay(vec3 base, vec3 blend) {
    return mix(
        2.0 * base * blend,
        1.0 - 2.0 * (1.0 - base) * (1.0 - blend),
        step(vec3(0.5), base)
    );
}


// ---------- HASH / NOISE ----------

float hash12(vec2 p) {
    vec3 p3 = fract(vec3(p.xyx) * 0.1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

vec2 hash22(vec2 p) {
    float n = hash12(p);
    return vec2(
        n,
        hash12(p + n + 19.19)
    );
}


// ---------- VIEW DIRECTION ----------

vec3 getViewDirection() {
    vec2 pos = gl_FragCoord.xy / ScreenSize;

    pos -= vec2(0.5);
    pos *= 2.0;

    vec4 castPos = vec4(pos, 1.0, 1.0);

    castPos = inverse(ProjMat) * castPos;
    castPos = normalize(castPos);

    vec3 viewDir = normalize(castPos.xyz * mat3(ModelViewMat));

    return viewDir;
}


// ---------- STARS ----------

float getStars(vec3 viewDir) {
    vec3 p = normalize(viewDir);

    vec2 uv;

    if (abs(p.y) > 0.65) {
        uv = p.xz / max(abs(p.y), 0.001);
    } else if (abs(p.x) > abs(p.z)) {
        uv = p.zy / max(abs(p.x), 0.001);
    } else {
        uv = p.xy / max(abs(p.z), 0.001);
    }

    vec2 gridUV = uv * STAR_DENSITY;

    vec2 cell = floor(gridUV);
    vec2 local = fract(gridUV);

    vec2 starPos = hash22(cell);
    float starRandom = hash12(cell + 7.13);

    float starExists = step(0.965, starRandom);

    // ---------- SQUARE STAR SHAPE ----------

    vec2 delta = abs(local - starPos);
    float squareDist = max(delta.x, delta.y);

    float aa = max(fwidth(local.x), fwidth(local.y));
    aa = clamp(aa, 0.001, 0.018);

    float core = 1.0 - smoothstep(
        STAR_SIZE,
        STAR_SIZE + aa,
        squareDist
    );

    float glow = 1.0 - smoothstep(
        STAR_SIZE,
        STAR_SIZE * 2.6 + aa,
        squareDist
    );

    float brightness = mix(
        0.35,
        1.0,
        hash12(cell + 23.71)
    );

    float star = core + glow * 0.0;

    star *= starExists;
    star *= brightness;

    return clamp(star, 0.0, 1.0);
}


// ---------- MAIN ----------

void main() {
    vec3 finalColor = ColorModulator.rgb;

    vec3 viewDir = getViewDirection();


    // ---------- HAZE COLOR ----------

    vec3 hazeBaseColor = FogColor.rgb;

    vec3 whiteOverlayColor = mix(
        vec3(0.5),
        vec3(1.0),
        HAZE_WHITE_OVERLAY
    );

    vec3 hazeOverlayColor = blendOverlay(
        hazeBaseColor,
        whiteOverlayColor
    );

    vec3 hazeColor = mix(
        hazeOverlayColor,
        hazeBaseColor,
        HAZE_FOG_MIX
    );


    // ---------- HAZE MASK ----------

    float hazeMask = 1.0 - smoothstep(
        HAZE_START,
        HAZE_END,
        viewDir.y
    );

    hazeMask = pow(
    clamp(hazeMask, 0.0, 1.0),
    HAZE_POWER
    );

    // ---------- HAZE BRIGHTNESS MULTIPLIER ----------
    // Чем ярче небо, тем сильнее haze.
    // При яркости >= HAZE_BRIGHTNESS_FULL haze работает на 100%.
    // При яркости <= HAZE_BRIGHTNESS_MIN haze падает до HAZE_NIGHT_MULTIPLIER.

    float skyBrightnessForHaze = dot(
        ColorModulator.rgb,
        vec3(0.2126, 0.7152, 0.0722)
    );

    float hazeBrightnessMask = smoothstep(
        HAZE_BRIGHTNESS_MIN,
        HAZE_BRIGHTNESS_FULL,
        skyBrightnessForHaze
    );

    float hazeBrightnessMultiplier = mix(
        HAZE_NIGHT_MULTIPLIER,
        1.0,
        hazeBrightnessMask
    );

    hazeMask *= HAZE_OPACITY * hazeBrightnessMultiplier;

    finalColor = mix(
        finalColor,
        hazeColor,
        clamp(hazeMask, 0.0, 1.0)
    );


    // ---------- DOME ----------

    float domeMask = smoothstep(
        DOME_START,
        DOME_END,
        viewDir.y
    );

    domeMask = pow(
        clamp(domeMask, 0.0, 1.0),
        DOME_POWER
    );

    finalColor = mix(
        finalColor,
        DOME_COLOR,
        domeMask * DOME_STRENGTH
    );


    // ---------- NIGHT OVERLAY ----------

    float skyBrightnessForNightOverlay = dot(
        ColorModulator.rgb,
        vec3(0.2126, 0.7152, 0.0722)
    );

    float nightOverlayMask = 1.0 - smoothstep(
        NIGHT_OVERLAY_FADE_START,
        NIGHT_OVERLAY_FADE_END,
        skyBrightnessForNightOverlay
    );

    nightOverlayMask = pow(
        clamp(nightOverlayMask, 0.0, 1.0),
        NIGHT_OVERLAY_POWER
    );

    if (NIGHT_OVERLAY_BLEND_MODE == 1) {
        vec3 overlayColor = blendOverlay(
            finalColor,
            NIGHT_OVERLAY_COLOR
        );

        finalColor = mix(
            finalColor,
            overlayColor,
            nightOverlayMask * NIGHT_OVERLAY_STRENGTH
        );
    } else {
        finalColor = mix(
            finalColor,
            NIGHT_OVERLAY_COLOR,
            nightOverlayMask * NIGHT_OVERLAY_STRENGTH
        );
    }


    // ---------- STARS ----------

    float skyBrightness = dot(
        ColorModulator.rgb,
        vec3(0.2126, 0.7152, 0.0722)
    );

    float nightMask = 1.0 - smoothstep(
        STAR_DAY_FADE_START,
        STAR_DAY_FADE_END,
        skyBrightness
    );

    float starHorizonMask = smoothstep(
        STAR_HORIZON_START,
        STAR_HORIZON_END,
        viewDir.y
    );

    float stars = getStars(viewDir);

    stars *= nightMask;
    stars *= starHorizonMask;
    stars *= STAR_STRENGTH;

    finalColor += vec3(stars);


    // ВАЖНО:
    // apply_fog() тут специально нет.
    fragColor = vec4(finalColor, 1.0);
}