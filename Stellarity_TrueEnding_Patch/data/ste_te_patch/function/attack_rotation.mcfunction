# =====================================================================
# BRIDGE: attack_rotation.mcfunction
# BUG FIX #3 — Расширение пула атак.
#
# АНАЛИЗ ОРИГИНАЛЬНОЙ TE РОТАЦИИ:
#   bosstime 219 = IDLE (ожидание следующей атаки).
#   bosstime 220 → сброс в 219 (см. a_main строка 92).
#   Триггеры в a_main:
#     - dive:          score 20tick == 1 AND chance/6_percent    → bosstime 1001
#     - ultra fireball: score 1min  == 1 AND chance/20_percent   → bosstime 20
#     - laser:         score 20tick == 1 AND chance/20_percent   → bosstime 2001 (только <33%)
#     - totem/финал:   автоматически при потере тотема (вшит в a_main строка 52)
#
#   ПРОБЛЕМА: Все RNG-триггеры срабатывают редко. Dive только 6%, ultra только 1/мин.
#   Дракон может застрять в vanilla-поведении (strafing + fireball) надолго.
#
# РЕШЕНИЕ: Добавляем принудительный ротатор в стиле round-robin.
#   Каждые N секунд принудительно выбираем следующую атаку из пула,
#   если дракон в idle (bosstime 219) и не атакует.
#
# ПУЛ АТАК (в порядке ротации, scoreboard ste_te_rotation):
#   0 → Dive (bosstime 1001, доступна всегда)
#   1 → Ultra Fireball (bosstime 20, доступна всегда)
#   2 → Dive Triple (bosstime 960, только при trueEnding_halfhealth)
#   3 → Laser Beam (bosstime 2001, только при trueEnding_quarterhealth)
#
# Ротатор срабатывает раз в 10 секунд (200 тиков) через 5tick-клок.
# =====================================================================

# Ротатор работает только если дракон в idle (bosstime 219) и не атакует
execute in the_end as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!trueEnding_mirrordragon,tag=!trueEnding_inattack,tag=!ste_te_crystals_gone] if score @s trueEnding_bosstime matches 219 at @s run function ste_te_patch:rotation_select

# Сброс клока если достиг 200 (200 тиков = 10 сек)
execute if score ste_te_rotation_clock ste_te_misc matches 200.. run scoreboard players set ste_te_rotation_clock ste_te_misc 0
# Тикаем клок только пока дракон в idle
execute in the_end if entity @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!trueEnding_mirrordragon,tag=!trueEnding_inattack,tag=!ste_te_crystals_gone,scores={trueEnding_bosstime=219}] run scoreboard players add ste_te_rotation_clock ste_te_misc 1
