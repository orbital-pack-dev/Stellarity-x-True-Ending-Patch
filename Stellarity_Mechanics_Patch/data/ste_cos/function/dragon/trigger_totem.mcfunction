# ste_cos:dragon/trigger_totem
# срабатывание тотема

# проверка
execute if score #ste_cos_totem_used ste_cos.flags matches 1 run return 0
execute if entity @s[tag=ste_cos.totem_used] run return 0

scoreboard players set #ste_cos_totem_used ste_cos.flags 1
scoreboard players set #fight_stage ste_cos.stage 5
tag @s add ste_cos.totem_animating
tag @s add ste_cos.totem_used
tag @e[type=ender_dragon,tag=stellarity.ender_dragon] add ste_cos.totem_used
tag @s add trueEnding_quarterhealth
tag @s add trueEnding_halfhealth

# принудительное очищение тотемов из рук во избежание дублирования стадии
execute if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with air
execute if items entity @s weapon.offhand minecraft:totem_of_undying run item replace entity @s weapon.offhand with air

# здоровье дракона
attribute @s minecraft:max_health base set 300
data modify entity @s Health set value 36.0f
scoreboard players set @s stellarity.dragon.health 36
scoreboard players set @s stellarity.dragon.health_old 36
scoreboard players set @s ste_cos.health 36
scoreboard players set @s ste_cos.health_old 36

data modify entity @s Invulnerable set value 1b
data modify entity @s DragonPhase set value 3
data modify entity @s Motion set value [-0.038d, 1.508d, -0.041d]

# тряска экрана
tag @a add stellarity.dragon.screenshake

# звуки тотема
playsound item.totem.use master @a ~ ~ ~ 64.0 0.8
playsound entity.warden.heartbeat master @a ~ ~ ~ 64.0 0.6
playsound entity.warden.sonic_boom master @a ~ ~ ~ 64.0 0.7
playsound block.amethyst_block.resonate master @a ~ ~ ~ 64.0 0.5
playsound entity.ender_dragon.growl master @a ~ ~ ~ 64.0 0.75
playsound entity.illusioner.cast_spell master @a ~ ~ ~ 48.0 0.65

# вспышка
particle flash{color:[1.0,0.82,0.15,1.0]} ~ ~2 ~ 0 0 0 0 2 force @a
particle flash{color:[1.0,0.55,0.05,1.0]} ~ ~2 ~ 0 0 0 0 2 force @a
particle sonic_boom ~ ~2 ~ 0 0 0 0 3 force @a

# частицы тотема
particle totem_of_undying ~ ~2 ~ 3 2 3 0.6 300 force @a
particle totem_of_undying ~ ~2 ~ 6 4 6 0.35 250 force @a

# частицы пламени
particle dragon_breath ~ ~2 ~ 3 2 3 0.2 120 force @a
particle dust_color_transition{from_color:[1.0,0.85,0.2],scale:3.5,to_color:[0.55,0.0,0.85]} ~ ~2 ~ 4 3 4 0.25 180 force @a
particle end_rod ~ ~2 ~ 3 3 3 0.3 80 force @a
particle electric_spark ~ ~2 ~ 4 3 4 0.35 90 force @a

# вихрь на земле
function true_ending:boss/shockwave/summon

# таймер фазы
scoreboard players set @s trueEnding_bosstime 3001
