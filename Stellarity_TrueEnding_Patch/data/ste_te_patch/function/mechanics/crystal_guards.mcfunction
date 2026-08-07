# =====================================================================
# ste_te_patch:mechanics/crystal_guards
# =====================================================================

# Тикаем кулдаун
execute if score $guard_cooldown ste_te_flags matches 1.. run scoreboard players remove $guard_cooldown ste_te_flags 1

# Спавним фантома если: кристалл защищен, нет фантомов рядом, и кулдаун 0
execute in minecraft:the_end as @e[type=end_crystal,tag=ste_te_guarded] at @s unless entity @e[type=phantom,tag=ste_crystal_guard,distance=..5] if score $guard_cooldown ste_te_flags matches 0 run summon phantom ~ ~2 ~ {Tags:["ste_crystal_guard"],Health:20f,Silent:0b}
execute in minecraft:the_end as @e[type=end_crystal,tag=ste_te_guarded] at @s unless entity @e[type=phantom,tag=ste_crystal_guard,distance=..5] if score $guard_cooldown ste_te_flags matches 0 run scoreboard players set $guard_cooldown ste_te_flags 20

# Партиклы стражей
execute in minecraft:the_end as @e[type=phantom,tag=ste_crystal_guard] at @s run particle soul_fire_flame ~ ~1 ~ 0.5 0.5 0.5 0.1 3 force

# Даем сопротивление Дракону, если есть стражи
execute if entity @e[type=phantom,tag=ste_crystal_guard] run effect give @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] resistance 2 255 true
