# =====================================================================
# ste_te_patch:mechanics/mirror_clones_spawn
# Контекст: AS ender_dragon AT дракона.
# =====================================================================
tag @s add ste_te_mirror_done

# Два клона над порталом
summon ender_dragon 10 100 10 {Tags:["ste_mirror_clone_1","trueEnding_mirrordragon"],NoAI:0b,Silent:1b}
summon ender_dragon -10 100 -10 {Tags:["ste_mirror_clone_2","trueEnding_mirrordragon"],NoAI:0b,Silent:1b}

# Золотые искры у оригинала
particle wax_on ~ ~ ~ 5 2 5 0.1 80 force
particle enchant ~ ~ ~ 3 3 3 0.5 50 force

# Клоны — фиолетовые
execute at @e[type=ender_dragon,tag=ste_mirror_clone_1] run particle witch ~ ~ ~ 5 2 5 0.3 100 force
execute at @e[type=ender_dragon,tag=ste_mirror_clone_2] run particle witch ~ ~ ~ 5 2 5 0.3 100 force

playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..256] ~ ~ ~ 10 0.9
title @a[distance=..200] title {"text":"ILLUSION","color":"light_purple","bold":true}
title @a[distance=..200] subtitle {"text":"Find the real Dragon!","color":"gray"}
