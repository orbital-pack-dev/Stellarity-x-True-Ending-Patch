# ste_cos:final_breath/blast
# залп финального вздоха

# разворот на игрока
execute facing entity @p[gamemode=!creative,gamemode=!spectator] eyes run tp @s ~ ~ ~ ~ ~

# звуки
playsound entity.ender_dragon.growl master @a ~ ~ ~ 1000 0.60
playsound entity.warden.sonic_boom master @a ~ ~ ~ 1000 0.75
playsound entity.generic.explode master @a ~ ~ ~ 1000 0.80
playsound block.amethyst_block.resonate master @a ~ ~ ~ 1000 0.50

# взрыв
particle explosion_emitter ~ ~ ~ 0 0 0 0 6 force @a
particle sonic_boom ~ ~ ~ 0 0 0 0 4 force @a
particle flash{color:[0.95,0.30,1.0,1.0]} ~ ~ ~ 0 0 0 0 3 force @a
particle dragon_breath ~ ~ ~ 2 2 2 0.3 150 force @a

# луч вздоха
particle sonic_boom ~ ~-2 ~ 0 0 0 0 3 force @a
particle sonic_boom ~ ~-5 ~ 0 0 0 0 3 force @a
particle sonic_boom ~ ~-8 ~ 0 0 0 0 3 force @a
particle sonic_boom ~ ~-11 ~ 0 0 0 0 4 force @a
particle flash{color:[1.0,0.2,0.9,1.0]} ~ ~-6 ~ 1 5 1 0.1 5 force @a
particle explosion_emitter 0 67 0 2 1 2 0.1 8 force @a
particle reverse_portal 0 67 0 4 2 4 0.2 120 force @a
particle dust_color_transition{from_color:[1.0,0.2,0.9],scale:3.5,to_color:[0.2,0.0,0.4]} 0 67 0 5 2 5 0.3 200 force @a

# урон
execute as @a[distance=..20,gamemode=!creative,gamemode=!spectator] run damage @s 16 magic by @e[type=ender_dragon,limit=1]

# снятие эффектов
effect clear @a weakness
effect clear @a darkness

# отключение волн
tag @s remove ste_cos.portal_danger_active
tag @s remove stellarity.portal_activated
kill @e[type=marker,tag=ste_cos.portal_wave]
scoreboard players set #portal_danger_active ste_cos.flags 0

# позиция дракона
tp @s 0 79 0
data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]
data modify entity @s DragonPhase set value 10

# площадка парения
execute in minecraft:the_end positioned 0 67 0 run function true_ending:boss/shockwave/summon_pad

# снятие неуязвимости
attribute @s minecraft:armor base set 0
attribute @s minecraft:armor_toughness base set 0
data modify entity @s Invulnerable set value 0b
data modify entity @s Health set value 1.0f
scoreboard players set @s ste_cos.health 1
scoreboard players set @s ste_cos.health_old 1
scoreboard players set @s stellarity.dragon.health 1
scoreboard players set @s stellarity.dragon.health_old 1
bossbar set stellarity:ender_dragon value 1

# финал
tag @s remove ste_cos.final_breath_active
tag @s add ste_cos.final_stand
tag @s add trueEnding_inattack
scoreboard players set @s trueEnding_bosstime 0

scoreboard players set #final_breath_timer ste_cos.timer 0
scoreboard players set #final_breath_state ste_cos.flags 0
