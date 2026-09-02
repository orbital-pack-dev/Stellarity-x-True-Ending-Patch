# логика поведения дракона
scoreboard players reset #crystal_count stellarity.misc
execute as @e[type=end_crystal] at @s run function stellarity:entity/dragon/crystal/loop

# считаем только кристаллы с постаментом
execute store result score #crystals_left stellarity.misc if entity @e[type=end_crystal,nbt={ShowBottom:1b}]

# неуязвимость дракона при наличии кристаллов
execute if score #crystals_left stellarity.misc matches 1.. run tag @s add stellarity.dragon.invulnerable
execute if score #crystals_left stellarity.misc matches 0 run tag @s remove stellarity.dragon.invulnerable

# перемещение маркера дракона
execute at @s run tp @e[type=marker,tag=stellarity.dragon_marker,limit=1] ~ ~ ~

# получение здоровья и перевод в проценты
execute store result score @s stellarity.dragon.health run data get entity @s Health 100
scoreboard players operation @s stellarity.misc = @s stellarity.dragon.health
scoreboard players operation @s stellarity.misc /= #three stellarity.constants

# запрет лечения от кристаллов
execute if score @s stellarity.dragon.health > @s stellarity.dragon.health_old store result entity @s Health float 1 run scoreboard players get @s stellarity.dragon.health_old
scoreboard players operation @s stellarity.dragon.health_old = @s stellarity.dragon.health

# обновление полосы здоровья
scoreboard players operation #dragon stellarity.misc = @s stellarity.misc
scoreboard players operation #dragon stellarity.misc /= #one_hundred stellarity.constants
execute store result bossbar stellarity:ender_dragon value run scoreboard players get #dragon stellarity.misc

# видимость полосы босса
execute as @a[tag=stellarity.has_dragon,distance=400..] run function stellarity:entity/dragon/bossbar/remove
execute as @a[tag=!stellarity.has_dragon,distance=..400] run function stellarity:entity/dragon/bossbar/add
execute store result score #total_crystals stellarity.misc if entity @e[type=end_crystal]
execute store result bossbar stellarity:crystal_count max run scoreboard players get #total_crystals stellarity.misc
execute store result bossbar stellarity:crystal_count value run scoreboard players get #crystals_left stellarity.misc

# музыка битвы
execute as @a[tag=stellarity.has_dragon] run function stellarity:entity/dragon/music

# фазы поведения дракона
execute store result score @s stellarity.misc run data get entity @s DragonPhase
execute unless score @s trueEnding_bosstime matches 1.. if score @s stellarity.misc matches 2..7 run data modify entity @s DragonPhase set value 0

scoreboard players remove @s[tag=!stellarity.dragon.invulnerable] stellarity.dragon.attack_cooldown 1
execute if score @s stellarity.dragon.attack_cooldown matches ..0 run function stellarity:entity/dragon/attacks/trigger

# возрождение пяти кристаллов при низком здоровье
execute if score @s stellarity.misc matches ..25 unless score @s stellarity.revived_crystals matches 1.. run function stellarity:entity/dragon/attacks/revive_crystals/initiate

# стук сердца при низком здоровье
execute if score @s stellarity.misc matches ..25 at @s run function stellarity:entity/dragon/heartbeat

# полет к порталу при гибели
execute if score @s stellarity.dragon.health matches ..0 run function stellarity:entity/dragon/death
