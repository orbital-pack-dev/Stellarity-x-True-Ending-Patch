# =====================================================================
# death_cleanup.mcfunction
# Выполняется AS умирающего дракона (stellarity.at_portal) ОДИН РАЗ.
# Зачищает всё что True Ending создал за время боя.
# =====================================================================

# Помечаем: уже выполнено в этом цикле жизни
tag @s add ste_te_death_cleanup_done

# -----------------------------------------------------------------------
# ЗАЧИСТКА TE МАРКЕРОВ И СУЩНОСТЕЙ
# -----------------------------------------------------------------------

# Ударные волны (shockwave фаза)
kill @e[type=marker,tag=trueEnding_shockwave]
kill @e[type=marker,tag=trueEnding_shockwave2]
kill @e[type=marker,tag=trueEnding_pad]

# Ультра-фаерболы (marker-нити)
kill @e[type=marker,tag=trueEnding_ultrafireball]

# Частицы дракона (marker, что рисует след)
kill @e[type=marker,tag=trueEnding_dragonparticle]

# Фантомы-стражи
kill @e[type=phantom,tag=trueEnding_guardphantom]

# Маркеры позиций для фантомов
kill @e[type=marker,tag=trueEnding_endspike]
kill @e[type=marker,tag=trueEnding_endspike_caged]

# Зеркальный дракон (Dive-атака)
kill @e[type=ender_dragon,tag=trueEnding_mirrordragon]

# Pivot-маркер для Dive-атаки
kill @e[type=marker,tag=trueEnding_pivot]

# Маркер выходного портала (не нужен при смерти — Stellarity генерирует свой)
kill @e[type=marker,tag=trueEnding_exitportal]

# -----------------------------------------------------------------------
# СБРОС SCOREBOARDS TRUE ENDING
# (чтобы при следующем призыве дракона TE-инициализация прошла чисто)
# -----------------------------------------------------------------------

# Сбрасываем таймер босса — чтобы при следующем спауне TE начал с init
scoreboard players reset @s trueEnding_bosstime
scoreboard players reset @s trueEnding_bosstime2
scoreboard players reset @s trueEnding_health_extra
scoreboard players reset @s trueEnding_health_extra_max
scoreboard players reset @s trueEnding_health_percent
scoreboard players reset @s trueEnding_health
scoreboard players reset @s trueEnding_y
scoreboard players reset @s trueEnding_dragonphase

# Убираем теги состояний TE с дракона
tag @s remove trueEnding_dragon_particlechecked
tag @s remove trueEnding_inattack
tag @s remove trueEnding_halfhealth
tag @s remove trueEnding_quarterhealth
tag @s remove trueEnding_inattack_doubledive

# Сбрасываем глобальные счётчики кристаллов TE
scoreboard players reset crystals_left trueEnding_storage
scoreboard players reset crystals_left_pretick trueEnding_storage
scoreboard players reset respawn_ender_dragon trueEnding_storage

# Убираем маркер клока
scoreboard players reset 1min trueEnding_clock
scoreboard players reset 20tick trueEnding_clock
scoreboard players reset 10tick trueEnding_clock
scoreboard players reset 5tick trueEnding_clock
scoreboard players reset 2tick trueEnding_clock

# Останавливаем музыку TE у всех игроков в радиусе
execute in the_end positioned 0 80 0 as @a[distance=..256] run scoreboard players reset @s trueEnding_music

# Сброс флага кульминационного триггера (для следующего боя)
execute as @e[type=ender_dragon,tag=ste_te_death_triggered] run tag @s remove ste_te_death_triggered

# Сброс ротатора атак
execute as @e[type=ender_dragon] run scoreboard players reset @s ste_te_rotation
scoreboard players set ste_te_rotation_clock ste_te_misc 0
