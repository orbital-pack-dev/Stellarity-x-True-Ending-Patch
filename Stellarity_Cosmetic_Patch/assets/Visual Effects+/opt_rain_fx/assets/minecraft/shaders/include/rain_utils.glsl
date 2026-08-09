#version 330

bool check_alpha(float textureAlpha, float targetAlpha) {
    return abs(textureAlpha - targetAlpha) < 0.01;
}