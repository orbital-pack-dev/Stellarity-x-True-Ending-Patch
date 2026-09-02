# true_ending:boss/phantom/summon
# призыв стража-фантома на столбах с клетками

execute if block ~ ~ ~ iron_bars unless entity @e[type=phantom,tag=trueEnding_guardphantom,distance=..20] run summon phantom ~ ~ ~7 {Tags:["trueEnding_guardphantom"],NoAI:1b}

# клетка
execute if block ~ ~-1 ~ bedrock if block ~ ~2 ~ iron_bars run function true_ending:boss/phantom/summon_setbedrock
execute if block ~ ~-1 ~ bedrock if block ~ ~2 ~ iron_bars run tag @s add trueEnding_endspike_caged

execute if block ~ ~-1 ~ bedrock if block ~ ~3 ~ iron_bars run function true_ending:boss/phantom/summon_setbedrock
execute if block ~ ~-1 ~ bedrock if block ~ ~3 ~ iron_bars run tag @s add trueEnding_endspike_caged

tp @s ~ ~ ~

# спуск вниз до бедрока
execute if entity @s[y=50,dy=100] unless block ~ ~ ~ bedrock positioned ~ ~-1 ~ run function true_ending:boss/phantom/summon

