# ste_cos:final_breath/blast
# залп ультимативной атаки: рёв дракона + соникбум вардена + взрыв + выстрел лазера
# пост-эффект: площадка парения (summon_pad) над порталом, дракон зависает на 0 77 0 (DragonPhase: 10), волны портала отключены

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

# тяжелый магический урон по конусу перед драконом
execute positioned ^ ^ ^4 as @a[distance=..8,gamemode=!creative,gamemode=!spectator] run damage @s 16 magic by @e[type=ender_dragon,limit=1]

# снятие слабости и тьмы с игроков
effect clear @a weakness
effect clear @a darkness

# отключение опасных волн портала
tag @s remove ste_cos.portal_danger_active
tag @s remove stellarity.portal_activated
kill @e[type=marker,tag=ste_cos.portal_wave]
scoreboard players set #portal_danger_active ste_cos.flags 0

# позиционирование дракона над порталом на высоте ~ ~12 ~ (0 77 0) в режиме парения (DragonPhase: 10)
tp @s 0 77 0
data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]
data modify entity @s DragonPhase set value 10

# призыв левитационной площадки True Ending на портал для финальных ударов игроков
execute in minecraft:the_end positioned 0 65 0 run function true_ending:boss/shockwave/summon_pad

# снятие неуязвимости и возврат брони (дракона теперь можно добить!)
attribute @s minecraft:armor base set 8
attribute @s minecraft:armor_toughness base set 4
data modify entity @s Invulnerable set value 0b

# финальная стойка до смерти
tag @s remove ste_cos.final_breath_active
tag @s add ste_cos.final_stand
tag @s add trueEnding_inattack
scoreboard players set @s trueEnding_bosstime 0

scoreboard players set #final_breath_timer ste_cos.timer 0
scoreboard players set #final_breath_state ste_cos.flags 0
