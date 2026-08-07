# =====================================================================
# crystal_shield_drop.mcfunction
# Выполняется единожды при обнулении кристаллов.
# Контекст: выполняется AS дракона (ender_dragon).
# =====================================================================

# Помечаем, чтобы не сработало повторно в этом бою
tag @s add ste_te_crystals_gone

# Принудительно устанавливаем TE-таймер на 5000 (начало фазы "все кристаллы уничтожены")
# phase_end_crystals_destroyed снимает NoAI, запускает частицы и в итоге сбрасывает bosstime обратно в 219
scoreboard players set @s trueEnding_bosstime 5000

# Гарантируем: снять бессмертие (Stellarity уже делает это через hide_bossbar, но страхуемся)
data modify entity @s Invulnerable set value 0b
tag @s remove stellarity.dragon.invulnerable

# Убрать TE-флаг "inattack" если он висел от предыдущей атаки
tag @s remove trueEnding_inattack

# Сброс счётчика кристаллов в претик TE (чтобы не сработал phase_end_crystals_destroyed_init ещё раз)
scoreboard players set crystals_left_pretick trueEnding_storage 0
