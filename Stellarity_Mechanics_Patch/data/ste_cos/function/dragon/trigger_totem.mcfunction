# ste_cos:dragon/trigger_totem
# срабатывание тотема бессмертия у дракона

tag @s add ste_cos.totem_animating
tag @s add ste_cos.totem_used
tag @s add trueEnding_quarterhealth
tag @s add trueEnding_halfhealth

# восстановление здоровья и предотвращение гибели
attribute @s minecraft:max_health base set 300
data modify entity @s Health set value 100.0f
scoreboard players set @s stellarity.dragon.health 100
scoreboard players set @s stellarity.dragon.health_old 100
scoreboard players set @s ste_cos.health 100
scoreboard players set @s ste_cos.health_old 100

data modify entity @s Invulnerable set value 1b
data modify entity @s DragonPhase set value 5

# экранная тряска
tag @a add stellarity.dragon.screenshake

# звуки эпического возрождения тотемом (громкость 64+, слышно на всем острове)
playsound item.totem.use master @a ~ ~ ~ 64.0 0.8
playsound entity.warden.heartbeat master @a ~ ~ ~ 64.0 0.6
playsound entity.warden.sonic_boom master @a ~ ~ ~ 64.0 0.7
playsound block.amethyst_block.resonate master @a ~ ~ ~ 64.0 0.5
playsound entity.ender_dragon.growl master @a ~ ~ ~ 64.0 0.75
playsound entity.illusioner.cast_spell master @a ~ ~ ~ 48.0 0.65

# объемная космическая вспышка и ударная волна тотема
particle flash{color:-2673921} ~ ~2 ~ 0 0 0 0 2 force @a
particle flash{color:-4980481} ~ ~2 ~ 0 0 0 0 2 force @a
particle sonic_boom ~ ~2 ~ 0 0 0 0 3 force @a

# многослойные объемные частицы тотема во все стороны
particle totem_of_undying ~ ~2 ~ 3 2 3 0.6 300 force @a
particle totem_of_undying ~ ~2 ~ 6 4 6 0.35 250 force @a

# струи драконьего пламени и золотисто-фиолетовая звездная пыль
particle dragon_breath ~ ~2 ~ 3 2 3 0.2 120 force @a
particle dust_color_transition{from_color:[1.0,0.85,0.2],scale:3.5,to_color:[0.55,0.0,0.85]} ~ ~2 ~ 4 3 4 0.25 180 force @a
particle end_rod ~ ~2 ~ 3 3 3 0.3 80 force @a
particle electric_spark ~ ~2 ~ 4 3 4 0.35 90 force @a

# забираем потраченный тотем из руки
item replace entity @s weapon.mainhand with air

# сдвиг таймера босса на фазу тотема
scoreboard players set @s trueEnding_bosstime 3001
