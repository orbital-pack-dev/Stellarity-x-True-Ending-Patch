# =====================================================================
# ste_te_patch:mechanics/crystal_guards
# Стражи работают ТОЛЬКО пока кристаллы живы ($crystals_gone == 0).
# Когда все кристаллы сломаны — стражей нет, сопротивления нет, спама нет.
# =====================================================================

# Тикаем кулдаун
execute if score $guard_cooldown ste_te_flags matches 1.. run scoreboard players remove $guard_cooldown ste_te_flags 1

# Спавним фантома если: кристаллы живы, кристалл защищен, нет фантомов рядом, кулдаун 0
execute in minecraft:the_end as @e[type=end_crystal,tag=ste_te_guarded] at @s unless entity @e[type=phantom,tag=ste_crystal_guard,distance=..5] if score $guard_cooldown ste_te_flags matches 0 if score $crystals_gone ste_te_flags matches 0 run summon phantom ~ ~2 ~ {Tags:["ste_crystal_guard"],Health:20f,Silent:0b}
execute in minecraft:the_end as @e[type=end_crystal,tag=ste_te_guarded] at @s unless entity @e[type=phantom,tag=ste_crystal_guard,distance=..5] if score $guard_cooldown ste_te_flags matches 0 if score $crystals_gone ste_te_flags matches 0 run scoreboard players set $guard_cooldown ste_te_flags 20

# Партиклы стражей (только пока живые кристаллы)
execute in minecraft:the_end as @e[type=phantom,tag=ste_crystal_guard] at @s if score $crystals_gone ste_te_flags matches 0 run particle soul_fire_flame ~ ~1 ~ 0.5 0.5 0.5 0.1 3 force

# Даем сопротивление Дракону, если есть стражи (только пока живые кристаллы)
execute if score $crystals_gone ste_te_flags matches 0 if entity @e[type=phantom,tag=ste_crystal_guard] run effect give @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] resistance 2 255 true
