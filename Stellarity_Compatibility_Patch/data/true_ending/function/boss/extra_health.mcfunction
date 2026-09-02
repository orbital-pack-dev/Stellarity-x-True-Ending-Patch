# дополнительное здоровье босса

# запись текущего здоровья
execute store result score temp_health trueEnding_health_extra run data get entity @s Health

# сброс полученного урона
scoreboard players set temp_damageDealt trueEnding_health_extra 0

execute if score 10tick trueEnding_clock matches 1 unless score @s trueEnding_health_extra > @s trueEnding_health_extra_max if data entity @e[type=end_crystal,distance=..32,limit=1] ShowBottom run scoreboard players add @s trueEnding_health_extra 1
