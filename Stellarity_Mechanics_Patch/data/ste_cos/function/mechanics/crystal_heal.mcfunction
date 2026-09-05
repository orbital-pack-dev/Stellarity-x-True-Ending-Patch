# ste_cos:mechanics/crystal_heal
# периодическое лечение дракона от кристаллов края

scoreboard objectives add ste_cos.health dummy
scoreboard objectives add ste_cos.health_old dummy

execute store result score @s ste_cos.health run data get entity @s Health 1
execute unless score @s ste_cos.health matches 2.. run return 0

scoreboard players add @s ste_cos.health 4

# Определение максимального здоровья дракона
scoreboard players set #ste_cos_maxhp ste_cos.flags 0
execute store result score #ste_cos_maxhp ste_cos.flags run attribute @s minecraft:max_health get
execute unless score #ste_cos_maxhp ste_cos.flags matches 1.. store result score #ste_cos_maxhp ste_cos.flags run attribute @s minecraft:max_health get

# Пока живы кристаллы, максимальное здоровье не опускается ниже 1024 (системный анти-урон)
execute if score #ste_cos_crystals ste_cos.flags matches 1.. if score #ste_cos_maxhp ste_cos.flags matches ..1023 run scoreboard players set #ste_cos_maxhp ste_cos.flags 1024
execute if score #crystal_count stellarity.misc matches 1.. if score #ste_cos_maxhp ste_cos.flags matches ..1023 run scoreboard players set #ste_cos_maxhp ste_cos.flags 1024

# Если кристаллы уничтожены и макс ХП не определилось, ставим 300
execute unless score #ste_cos_crystals ste_cos.flags matches 1.. unless score #crystal_count stellarity.misc matches 1.. unless score #ste_cos_maxhp ste_cos.flags matches 1.. run scoreboard players set #ste_cos_maxhp ste_cos.flags 300

# Ограничиваем здоровье рассчитанным максимумом (не урезаем до 300 при живых кристаллах)
execute if score #ste_cos_maxhp ste_cos.flags matches 1.. if score @s ste_cos.health > #ste_cos_maxhp ste_cos.flags run scoreboard players operation @s ste_cos.health = #ste_cos_maxhp ste_cos.flags

# Запись нового здоровья только при безопасном значении (минимум 2 ХП)
execute if score @s ste_cos.health matches 2.. store result entity @s Health float 1 run scoreboard players get @s ste_cos.health

execute store result score @s stellarity.dragon.health run data get entity @s Health 1
execute store result score @s stellarity.dragon.health_old run data get entity @s Health 1
execute store result score @s ste_cos.health_old run data get entity @s Health 1
