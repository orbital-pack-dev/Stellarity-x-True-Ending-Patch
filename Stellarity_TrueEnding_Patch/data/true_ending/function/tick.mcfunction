# =====================================================================
# PATCH OVERRIDE: true_ending:tick
# Оригинальный файл: tru.e-ending-1.1.4d/data/true_ending/function/tick.mcfunction
#
# ИЗМЕНЕНИЯ:
#   - УДАЛЕНО: #ambience вызовы (a_main_no_dragon, a_main) — атмосфера от Stellarity
#   - УДАЛЕНО: #music вызов — музыка от Stellarity
#   - УДАЛЕНО: #respawn animation (respawning/a_main) — алтарь и призыв от Stellarity
#   - УДАЛЕНО: exitportal маркер-вызов — портал генерирует Stellarity
#   - СОХРАНЕНО: Счётчики тиков (1min, 20tick, 10tick, 5tick, 2tick) — нужны TE-атакам
#   - СОХРАНЕНО: Логика дракона-босса (boss/a_main) — весь бой из TE
#   - СОХРАНЕНО: Маркеры атак (ультрафаерболы, ударные волны, фантомы, Dive)
#   - СОХРАНЕНО: XP обработка
#   - СОХРАНЕНО: Настройка здоровья дракона через player settings
#   - СОХРАНЕНО: respawn_ender_dragon трекер (счётчик) — нужен для TE, даже если анимация от Stellarity
# =====================================================================

# COUNTERS AND CLOCKS
scoreboard players add 1min trueEnding_clock 1
scoreboard players add 20tick trueEnding_clock 1
scoreboard players add 10tick trueEnding_clock 1
scoreboard players add 2tick trueEnding_clock 1
scoreboard players add 5tick trueEnding_clock 1

# BOSS AI (True Ending)
execute as @e[type=ender_dragon,tag=!trueEnding_mirrordragon,tag=!trueEnding_dragon_noAI] if data entity @s DragonPhase at @s run function true_ending:boss/a_main

# XP
execute in the_end positioned 0 90 0 as @e[distance=..24,type=experience_orb] run function true_ending:other/xp

######################################################################################################

# ATTACK MARKERS
execute as @e[type=marker,tag=trueEnding_ultrafireball] at @s run function true_ending:boss/ultra_fireball
execute as @e[type=marker,tag=trueEnding_shockwave] at @s run function true_ending:boss/shockwave/root
execute as @e[type=marker,tag=trueEnding_shockwave2] at @s run function true_ending:boss/shockwave/root2
execute as @e[type=marker,tag=trueEnding_pad] at @s run function true_ending:boss/shockwave/pad

# PHANTOM GUARDS
execute as @e[type=phantom,tag=trueEnding_guardphantom] at @s run function true_ending:boss/phantom/entity

# MIRROR DRAGON (Dive attack)
execute as @e[type=ender_dragon,tag=trueEnding_mirrordragon] at @s run function true_ending:boss/dive/decoy_enderdragon

######################################################################################################

# NEW DRAGON FIREBALL (TE mechanic on vanilla dragon_fireball)
execute in the_end positioned 0 80 0 as @e[type=dragon_fireball,distance=..256] at @s as @n[type=ender_dragon,tag=trueEnding_dragon_particlechecked] at @s run function true_ending:boss/summon_ultra_fireball

# RESPAWN COUNTER — только отслеживаем статус для TE-внутренних нужд
# (Анимацию и звуки при респауне ведёт Stellarity)
execute if score respawn_ender_dragon trueEnding_storage matches 0.. in the_end positioned 0 65 0 unless entity @e[type=end_crystal,distance=..16,limit=1] run scoreboard players reset respawn_ender_dragon trueEnding_storage
execute unless score respawn_ender_dragon trueEnding_storage matches 0.. in the_end positioned 0 65 0 if data entity @e[type=end_crystal,distance=..16,limit=1] beam_target run scoreboard players add respawn_ender_dragon trueEnding_storage 0

# PLAYER SETTINGS (health config)
execute as @a[scores={trueEnding_settings.dragonhealth=-2147483648..2147483647}] at @s run function true_ending:settings/set_value_dragonhealth

# PHANTOM SPAWN FROM ENDSPIKE MARKERS
execute in the_end positioned 0 80 0 as @e[type=marker,tag=trueEnding_endspike,tag=!trueEnding_endspike_caged,distance=..128] at @s if loaded ~ ~ ~ run function true_ending:boss/phantom/summon
