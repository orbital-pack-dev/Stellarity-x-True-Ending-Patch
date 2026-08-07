# =====================================================================
# ste_te_patch:mechanics/mirror_clones_spawn
# Контекст: AS ender_dragon (stellarity.dragon) AT дракона, in the_end.
# =====================================================================
tag @s add ste_te_mirror_done

# Спавн клонов RELATIVE to dragon position
summon ender_dragon ~10 ~ ~10 {Tags:["ste_mirror_clone_1","trueEnding_mirrordragon"],NoAI:0b,Silent:1b}
summon ender_dragon ~-10 ~ ~-10 {Tags:["ste_mirror_clone_2","trueEnding_mirrordragon"],NoAI:0b,Silent:1b}

# Золотые искры у оригинала AT дракона
execute at @s run particle wax_on ~ ~ ~ 5 2 5 0.1 80 force
execute at @s run particle enchant ~ ~ ~ 3 3 3 0.5 50 force

# Клоны — фиолетовые (AT клона)
execute in minecraft:the_end as @e[type=ender_dragon,tag=ste_mirror_clone_1] at @s run particle witch ~ ~ ~ 5 2 5 0.3 100 force
execute in minecraft:the_end as @e[type=ender_dragon,tag=ste_mirror_clone_2] at @s run particle witch ~ ~ ~ 5 2 5 0.3 100 force

execute at @s run playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..256] ~ ~ ~ 10 0.9
title @a[distance=..200] title {"text":"ILLUSION","color":"light_purple","bold":true}
title @a[distance=..200] subtitle {"text":"Find the real Dragon!","color":"gray"}
