# =====================================================================
# ste_cos:load
# Косметический Патч совместимости — инициализация.
# =====================================================================

scoreboard objectives add ste_cos.flags dummy "STE-COS Flags"

# Таймер уборки хоруса (~30 сек)
scoreboard players set $pull_timer ste_cos.flags 0
