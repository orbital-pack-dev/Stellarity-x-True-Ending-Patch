# =====================================================================
# ste_cos:load
# Косметический Патч совместимости — инициализация.
# =====================================================================

scoreboard objectives add ste_cos.flags dummy "STE-COS Flags"
scoreboard objectives add ste_cos.phantom.orbit dummy "STE-COS Phantom Orbit"
scoreboard objectives add ste_cos.egg dummy "STE-COS Egg Scanner"

scoreboard players set $crystals_checked ste_cos.flags 0
scoreboard players set $guard_spawned ste_cos.flags 0

# Счётчики сканера яйца
scoreboard players set $tall ste_cos.egg 0
scoreboard players set $xpx ste_cos.egg 0
scoreboard players set $zpx ste_cos.egg 0
