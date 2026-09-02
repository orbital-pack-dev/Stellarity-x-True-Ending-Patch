# ste_cos:mechanics/portal_wave_tick
# урон от опасной зоны портала

execute as @a[distance=..8,gamemode=!creative,gamemode=!spectator] at @s run damage @s 4 minecraft:dragon_breath
execute as @a[distance=..8,gamemode=!creative,gamemode=!spectator] at @s run effect give @s instant_damage 1 0 true
