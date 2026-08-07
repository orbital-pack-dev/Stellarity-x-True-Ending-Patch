# =====================================================================
# OVERRIDE: true_ending:boss/dive/decoy_enderdragon_summon (Косметический Патч)
# Оригинал: tru.e-ending-1.1.4d/.../decoy_enderdragon_summon.mcfunction
#
# ФИКС Тройного-Нырка (копии дракона):
#   Оригинал использовал невалидный `spreadplayers ~ ~ 6 6` и спавн на
#   `~ ~128 ~`, из-за чего копии могли появляться некорректно.
#
#   Здесь: две копии спавнятся ОТНОСИТЕЛЬНО дракона в фиксированные точки
#   в зависимости от frantEnding_bosstime:
#       bosstime == 1020  -> правая-вверх-вперёд  (~12 ~4 ~10)
#       bosstime == 1050  -> левая-вверх-вперёд   (~-12 ~4 ~10)
#   без spreadplayers. Теги сохраняем:
#       trueEnding_mirrordragon   (ведётся TE в tick / boss/dive/decoy_enderdragon)
#       trueEnding_mirrordragon_temp (быстрое снятие сразу после спавна,
#                                     чтобы копию вёл основной цикл)
#  @s здесь = сам дракон (контекст из dive/phase, вызван AS дракона AT дракона).
# =====================================================================

# Первая копия (bosstime 1020): справа-вверх-вперёд
execute if score @s trueEnding_bosstime matches 1020 run summon ender_dragon ~12 ~4 ~10 {Tags:["trueEnding_mirrordragon","trueEnding_mirrordragon_temp"],NoAI:0b,Silent:1b,Invulnerable:1b}

# Вторая копия (bosstime 1050): слева-вверх-вперёд
execute if score @s trueEnding_bosstime matches 1050 run summon ender_dragon ~-12 ~4 ~10 {Tags:["trueEnding_mirrordragon","trueEnding_mirrordragon_temp"],NoAI:0b,Silent:1b,Invulnerable:1b}

# Снимаем временный тег с появившейся копии, чтобы её сразу вёл TE-цикл decoy
execute as @e[type=ender_dragon,tag=trueEnding_mirrordragon_temp,limit=1] run tag @s remove trueEnding_mirrordragon_temp
