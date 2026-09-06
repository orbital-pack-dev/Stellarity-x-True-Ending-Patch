# ste_cos:minigame_clones/tick_summon_stage
# поэтапный призыв копий с драматическими эффектами и звуками

scoreboard players add #summon_stage_timer ste_cos.timer 1

# удержание дракона в точке 28 85 0 лицом вперед (+Z)
execute as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] run tp @s 28 85 0 0 0
execute as @e[type=ender_dragon,tag=ste_cos.clone_1,limit=1] run tp @s -14 85 24.25 120 0
execute as @e[type=ender_dragon,tag=ste_cos.clone_2,limit=1] run tp @s -14 85 -24.25 -120 0

# 25 тиков (1.25 сек): появление Копии 1 на угле 120° (-14 85 24.25)
execute if score #summon_stage_timer ste_cos.timer matches 25 run function ste_cos:minigame_clones/summon_clone_1

# 50 тиков (еще 1.25 сек): появление Копии 2 на угле 240° (-14 85 -24.25)
execute if score #summon_stage_timer ste_cos.timer matches 50 run function ste_cos:minigame_clones/summon_clone_2

# 70 тиков (еще 1 сек): запуск синхронной карусели!
execute if score #summon_stage_timer ste_cos.timer matches 70 run scoreboard players set #carousel_active ste_cos.flags 1
execute if score #summon_stage_timer ste_cos.timer matches 70 run playsound entity.ender_dragon.growl master @a 0 85 0 64.0 1.0
