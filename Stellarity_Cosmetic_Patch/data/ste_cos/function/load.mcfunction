# =====================================================================
# ste_cos:load
# Косметический Патч совместимости — инициализация.
# =====================================================================

scoreboard objectives add ste_cos.flags dummy "STE-COS Flags"
scoreboard objectives add ste_cos.phantom.orbit dummy "STE-COS Phantom Orbit"

scoreboard players set $crystals_checked ste_cos.flags 0
scoreboard players set $guard_spawned ste_cos.flags 0
