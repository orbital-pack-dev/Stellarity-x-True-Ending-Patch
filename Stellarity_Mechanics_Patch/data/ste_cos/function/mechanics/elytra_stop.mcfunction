# ste_cos:mechanics/elytra_stop
# принудительное отключение полета

# сброс падения
execute store result score @s ste_cos.fall run data get entity @s fall_distance 1

# отключение полета
execute if data entity @s {FallFlying:1b} run data modify entity @s FallFlying set value 0b

# предупреждение звуком и частицами
execute if data entity @s {FallFlying:1b} run playsound minecraft:item.elytra.flying player @s ~ ~ ~ 1 0.5
execute if data entity @s {FallFlying:1b} run particle minecraft:smoke ~ ~ ~ 0.5 0.5 0.5 0.05 10 force
