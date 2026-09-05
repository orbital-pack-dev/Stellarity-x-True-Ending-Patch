# ste_cos:dragon/trigger_totem
# срабатывание тотема бессмертия у дракона

# проверка: тотем может сработать строго 1 раз за всю битву
execute if score #ste_cos_totem_used ste_cos.flags matches 1 run return 0
execute if entity @s[tag=ste_cos.totem_used] run return 0

scoreboard players set #ste_cos_totem_used ste_cos.flags 1
tag @s add ste_cos.totem_animating
tag @s add ste_cos.totem_used
tag @s add trueEnding_quarterhealth
tag @s add trueEnding_halfhealth

# немедленно удаляем любые тотемы из инвентаря дракона
item replace entity @s weapon.mainhand with air
item replace entity @s weapon.offhand with air

# восстановление здоровья и предотвращение гибели (36 HP)
attribute @s minecraft:max_health base set 300
data modify entity @s Health set value 36.0f
scoreboard players set @s stellarity.dragon.health 36
scoreboard players set @s stellarity.dragon.health_old 36
scoreboard players set @s ste_cos.health 36
scoreboard players set @s ste_cos.health_old 36

data modify entity @s Invulnerable set value 1b
data modify entity @s DragonPhase set value 3
data modify entity @s Motion set value [-0.038d, 1.508d, -0.041d]

# экранная тряска
tag @a add stellarity.dragon.screenshake

# звуки эпического возрождения тотемом (громкость 64+, слышно на всем острове)
playsound item.totem.use master @a ~ ~ ~ 64.0 0.8
playsound entity.warden.heartbeat master @a ~ ~ ~ 64.0 0.6
playsound entity.warden.sonic_boom master @a ~ ~ ~ 64.0 0.7
playsound block.amethyst_block.resonate master @a ~ ~ ~ 64.0 0.5
playsound entity.ender_dragon.growl master @a ~ ~ ~ 64.0 0.75
playsound entity.illusioner.cast_spell master @a ~ ~ ~ 48.0 0.65

# объемная космическая вспышка и ударная волна тотема (жёлто-оранжевые цвета)
particle flash{color:[1.0,0.82,0.15,1.0]} ~ ~2 ~ 0 0 0 0 2 force @a
particle flash{color:[1.0,0.55,0.05,1.0]} ~ ~2 ~ 0 0 0 0 2 force @a
particle sonic_boom ~ ~2 ~ 0 0 0 0 3 force @a

# многослойные объемные частицы тотема во все стороны
particle totem_of_undying ~ ~2 ~ 3 2 3 0.6 300 force @a
particle totem_of_undying ~ ~2 ~ 6 4 6 0.35 250 force @a

# струи драконьего пламени и золотисто-фиолетовая звездная пыль
particle dragon_breath ~ ~2 ~ 3 2 3 0.2 120 force @a
particle dust_color_transition{from_color:[1.0,0.85,0.2],scale:3.5,to_color:[0.55,0.0,0.85]} ~ ~2 ~ 4 3 4 0.25 180 force @a
particle end_rod ~ ~2 ~ 3 3 3 0.3 80 force @a
particle electric_spark ~ ~2 ~ 4 3 4 0.35 90 force @a

# сдвиг таймера босса на фазу тотема
# scoreboard players set @s trueEnding_bosstime 3001
