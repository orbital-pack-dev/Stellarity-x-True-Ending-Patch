# =====================================================================
# ste_te_patch:mechanics/crystal_guards_spawn
# Спавн стражей у каждого кристалла. Однократно при старте боя.
# =====================================================================

# Для каждого незащищённого кристалла
execute as @e[type=end_crystal,tag=!ste_te_guarded] at @s run tag @s add ste_te_guarded
execute as @e[type=end_crystal,tag=ste_te_guarded] at @s run summon phantom ~ ~3 ~ {Tags:["ste_crystal_guard"],Health:20.0f,Silent:0b}
execute as @e[type=end_crystal,tag=ste_te_guarded] at @s run summon interaction ~ ~ ~ {Tags:["ste_te_crystal_hitbox"],width:2.0f,height:2.0f}

# Эффектный спавн
execute as @e[type=end_crystal,tag=ste_te_guarded] at @s run particle soul_fire_flame ~ ~2 ~ 1 1 1 0.5 50 force
execute as @e[type=end_crystal,tag=ste_te_guarded] at @s run particle reverse_portal ~ ~ ~ 2 2 2 0.5 30 force

playsound minecraft:entity.phantom.ambient hostile @a[distance=..256] 0 70 0 10 0.8
