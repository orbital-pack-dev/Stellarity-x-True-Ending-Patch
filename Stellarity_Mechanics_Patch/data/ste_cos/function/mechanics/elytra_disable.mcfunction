# 1. Если игрок держит фейерверк в руке и надеты элитры — блокируем
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon] at @s as @a[distance=..300,gamemode=!spectator,gamemode=!creative] if items entity @s armor.chest minecraft:elytra if data entity @s SelectedItem{id:"minecraft:firework_rocket"} run function ste_cos:mechanics/elytra_stop

# 2. Если игрок летит на элитрах — блокируем (отменяется полет и ломается элитра)
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon] at @s as @a[distance=..300,gamemode=!spectator,gamemode=!creative] if items entity @s armor.chest minecraft:elytra if data entity @s {FallFlying:1b} run function ste_cos:mechanics/elytra_stop
