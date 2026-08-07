# =====================================================================
# rotation_select.mcfunction
# Выполняется AS дракона в idle. Выбирает следующую атаку.
# Клок ste_te_rotation_clock в objective ste_te_misc достиг 200 → запускаем.
#
# ИСПРАВЛЕНО: scoreboard players add/set принимают int-литерал, а НЕ имя objective.
#   Неверно:   scoreboard players add @s ste_te_rotation ste_te_misc 1
#   Верно:     scoreboard players add @s ste_te_rotation 1
# =====================================================================

# Только если клок >= 200 (прошло 10 секунд idle)
execute unless score ste_te_rotation_clock ste_te_misc matches 200.. run return 0

# Сброс клока
scoreboard players set ste_te_rotation_clock ste_te_misc 0

# Инкремент указателя ротации (0-3 для 4 атак) — objective: ste_te_rotation
scoreboard players add @s ste_te_rotation 1
execute if score @s ste_te_rotation matches 4.. run scoreboard players set @s ste_te_rotation 0

# ------ Слот 0: Dive ------
# Всегда доступен
execute if score @s ste_te_rotation matches 0 run scoreboard players set @s trueEnding_bosstime 1001

# ------ Слот 1: Ultra Fireball ------
# Всегда доступен
execute if score @s ste_te_rotation matches 1 run scoreboard players set @s trueEnding_bosstime 1

# ------ Слот 2: Triple Dive (Dive с зеркальным драконом) ------
# Только при trueEnding_halfhealth (HP < 66%)
# Если тег ещё не установлен (первая половина жизни) → откатиться на Dive
execute if score @s ste_te_rotation matches 2 if entity @s[tag=trueEnding_halfhealth] run scoreboard players set @s trueEnding_bosstime 960
execute if score @s ste_te_rotation matches 2 unless entity @s[tag=trueEnding_halfhealth] run scoreboard players set @s trueEnding_bosstime 1001

# ------ Слот 3: Laser Beam ------
# Только при trueEnding_quarterhealth (HP < 33%)
# Если < четверть жизни → лазер, иначе → ultra fireball как заменитель
execute if score @s ste_te_rotation matches 3 if entity @s[tag=trueEnding_quarterhealth] run scoreboard players set @s trueEnding_bosstime 2001
execute if score @s ste_te_rotation matches 3 unless entity @s[tag=trueEnding_quarterhealth] run scoreboard players set @s trueEnding_bosstime 20
