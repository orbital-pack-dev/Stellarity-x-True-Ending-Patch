# Движение вперед
tp @s ^ ^ ^0.5

# Частицы на уровне верхнего блока (рельефа)
execute at @s positioned over motion_blocking run particle dragon_breath ~ ~ ~ .2 .2 .2 0.05 3 normal

# Урон игрокам поблизости на уровне верхнего блока (рельефа)
execute at @s positioned over motion_blocking as @a[distance=..2,gamemode=!spectator,gamemode=!creative] run damage @s 6 magic by @e[type=ender_dragon,limit=1]

# Увеличиваем возраст
scoreboard players add @s ste_cos.timer 1

# Убиваем, когда радиус достиг 21 блока (скорость 0.5 б/т, значит 42 тика)
execute if score @s ste_cos.timer matches 42.. run kill @s
