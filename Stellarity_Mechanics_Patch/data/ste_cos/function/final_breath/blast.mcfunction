# ste_cos:final_breath/blast
# залп ультимативной атаки: рёв дракона + соникбум вардена + 1 единичный патрон лазера True Ending

# разворот строго на ближайшего игрока
execute facing entity @p[gamemode=!creative,gamemode=!spectator] eyes run tp @s ~ ~ ~ ~ ~

# оглушительные звуки (громкость 1000 на всю арену)
playsound entity.ender_dragon.growl master @a ~ ~ ~ 1000 0.60
playsound entity.warden.sonic_boom master @a ~ ~ ~ 1000 0.75
playsound entity.generic.explode master @a ~ ~ ~ 1000 0.80
playsound block.amethyst_block.resonate master @a ~ ~ ~ 1000 0.50

# колоссальный взрыв и звуковой удар вардена
particle explosion_emitter ~ ~ ~ 0 0 0 0 6 force @a
particle sonic_boom ~ ~ ~ 0 0 0 0 4 force @a
particle flash{color:[0.95,0.30,1.0,1.0]} ~ ~ ~ 0 0 0 0 3 force @a
particle dragon_breath ~ ~ ~ 2 2 2 0.3 150 force @a

# ровно 1 единичный выстрел лазера True Ending
execute rotated ~ 0 positioned ^-3 ^ ^-5 rotated as @s rotated ~-180 ~ run function true_ending:boss/laser/raycast

# тяжелый магический урон по конусу перед драконом (оставляет на волоске, без мгновенного ваншота)
execute positioned ^ ^ ^4 as @a[distance=..8,gamemode=!creative,gamemode=!spectator] run damage @s 16 magic by @e[type=ender_dragon,limit=1]

# возврат брони к штатным значениям и снятие неуязвимости
attribute @s minecraft:armor base set 8
attribute @s minecraft:armor_toughness base set 4
data modify entity @s Invulnerable set value 0b

# сброс фаз атаки
tag @s remove ste_cos.final_breath_active
tag @s add ste_cos.final_stand
tag @s add trueEnding_inattack
scoreboard players set @s trueEnding_bosstime 0
data modify entity @s DragonPhase set value 2

# удержание дракона у портала до победного конца
tag @s add stellarity.to_portal
tag @s add ste_cos.portal_lock_final
scoreboard players set #final_breath_timer ste_cos.timer 0
scoreboard players set #final_breath_state ste_cos.flags 0
