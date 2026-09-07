# ste_cos:crystal/shielded_crystal_tick
# цикл кристалла

# защита от снарядов
function ste_cos:crystal/shielded_crystal_deflect

# луч кристалла
execute if data entity @s beam_target unless data entity @s beam_target[2] run data remove entity @s beam_target
