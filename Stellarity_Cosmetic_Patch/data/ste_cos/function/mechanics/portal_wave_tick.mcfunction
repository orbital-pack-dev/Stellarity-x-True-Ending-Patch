# Движение вперед
tp @s ^ ^ ^0.5

# Частицы
particle dragon_breath ~ ~.5 ~ .2 .2 .2 0.05 3 normal
particle explosion ~ ~.5 ~ .2 .2 .2 0.05 1 normal

# Урон игрокам поблизости
execute as @a[distance=..2,gamemode=!spectator,gamemode=!creative] run damage @s 6 magic by @e[type=ender_dragon,limit=1]

# Увеличиваем возраст
scoreboard players add @s ste_cos.timer 1

# Убиваем, когда радиус достиг 21 блока (скорость 0.5 б/т, значит 42 тика)
execute if score @s ste_cos.timer matches 42.. run kill @s
