# =====================================================================
# crystal_shield_drop.mcfunction
# Выполняется единожды при обнулении кристаллов.
# Контекст: выполняется AS дракона (ender_dragon).
# =====================================================================

# Помечаем, чтобы не сработало повторно в этом бою
tag @s add ste_te_crystals_gone

# Однократный запуск фазы и звука через защелку-флаг
execute unless entity @s[tag=ste_te_sound_played] run scoreboard players set @s trueEnding_bosstime 5000
execute unless entity @s[tag=ste_te_sound_played] run playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..256] ~ ~ ~ 10 0.8
tag @s add ste_te_sound_played

# Гарантируем: снять бессмертие (Stellarity уже делает это через hide_bossbar, но страхуемся)
data modify entity @s Invulnerable set value 0b
tag @s remove stellarity.dragon.invulnerable

# Убрать TE-флаг "inattack" если он висел от предыдущей атаки
tag @s remove trueEnding_inattack

# Сброс счётчика кристаллов в претик TE (чтобы не сработал phase_end_crystals_destroyed_init ещё раз)
scoreboard players set crystals_left_pretick trueEnding_storage 0
