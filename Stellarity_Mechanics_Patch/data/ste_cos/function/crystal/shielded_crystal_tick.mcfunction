# ste_cos:crystal/shielded_crystal_tick
# тиковый цикл защищенного кристалла

# 1. Защита от снарядов (отражение трезубцев, уничтожение остальных)
function ste_cos:crystal/shielded_crystal_deflect

# 2. Авто-исправление поврежденного beam_target во избежание спама варнингов в логах
execute if data entity @s beam_target unless data entity @s beam_target[2] run data remove entity @s beam_target
