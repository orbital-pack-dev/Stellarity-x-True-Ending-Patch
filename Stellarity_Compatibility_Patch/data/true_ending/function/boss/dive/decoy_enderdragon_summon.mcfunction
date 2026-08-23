# =====================================================================
# OVERRIDE: true_ending:boss/dive/decoy_enderdragon_summon (Косметический Патч)
#
# ФИКС Тройного-Нырка (копии дракона):
#   - Копия спавнится ВЫСОКО (на ~128 выше дракона, как оригинал) — чтобы не
#     появиться внутри башни/блока и не умереть от suffocation за 1 тик.
#   - NoAI:1b — vanilla ИИ выключен, чтобы второй дракон не конфликтовал
#     (иначе vanilla-механизм деспавнит второго "настоящего" дракона).
#     Копию ведёт ТОЛЬКО TE через true_ending:boss/dive/decoy_enderdragon.
#   - Теги: trueEnding_mirrordragon (TE ведёт её), без temp (упрощение).
#
#   @s = сам дракон (вызван из dive/phase, AS дракона AT дракона).
#   Вызывается при bosstime 1020 и 1050 (2 копии, правая и левая).
# =====================================================================

# Первая копия (bosstime 1020) — случайная позиция (радиус 30 от портала)
execute if score @s trueEnding_bosstime matches 1020 positioned 0 150 0 run summon marker ~ ~ ~ {Tags:["ste_cos_decoy_pos"]}
execute if score @s trueEnding_bosstime matches 1020 run spreadplayers 0 0 15 30 under 255 false @e[type=marker,tag=ste_cos_decoy_pos]
execute if score @s trueEnding_bosstime matches 1020 as @e[type=marker,tag=ste_cos_decoy_pos] at @s run tp @s ~ 150 ~
execute if score @s trueEnding_bosstime matches 1020 at @e[type=marker,tag=ste_cos_decoy_pos] run summon ender_dragon ~ ~ ~ {Tags:["trueEnding_mirrordragon","trueEnding_dragon_particlechecked","stellarity.ender_dragon","stellarity.dragon.invulnerable","smithed.strict","refresh_entity_exists","smithed.entity"],NoAI:0b,Silent:1b,Invulnerable:1b}
execute if score @s trueEnding_bosstime matches 1020 run kill @e[type=marker,tag=ste_cos_decoy_pos]

# Вторая копия (bosstime 1050) — случайная позиция (радиус 30 от портала)
execute if score @s trueEnding_bosstime matches 1050 positioned 0 150 0 run summon marker ~ ~ ~ {Tags:["ste_cos_decoy_pos"]}
execute if score @s trueEnding_bosstime matches 1050 run spreadplayers 0 0 15 30 under 255 false @e[type=marker,tag=ste_cos_decoy_pos]
execute if score @s trueEnding_bosstime matches 1050 as @e[type=marker,tag=ste_cos_decoy_pos] at @s run tp @s ~ 150 ~
execute if score @s trueEnding_bosstime matches 1050 at @e[type=marker,tag=ste_cos_decoy_pos] run summon ender_dragon ~ ~ ~ {Tags:["trueEnding_mirrordragon","trueEnding_dragon_particlechecked","stellarity.ender_dragon","stellarity.dragon.invulnerable","smithed.strict","refresh_entity_exists","smithed.entity"],NoAI:0b,Silent:1b,Invulnerable:1b}
execute if score @s trueEnding_bosstime matches 1050 run kill @e[type=marker,tag=ste_cos_decoy_pos]
