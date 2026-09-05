# ste_cos:mechanics/arrow_highlight_each
# обработка отдельной стрелы в полете

# если стрела приземлилась в блок — снимаем подсветку
execute if data entity @s {inGround:1b} run data modify entity @s Glowing set value 0b
execute if data entity @s {inGround:1b} run tag @s add ste_cos.arrow_landed
execute if data entity @s {inGround:1b} run return 1

# если стрела только появилась
execute unless entity @s[tag=ste_cos.arrow_tracked] run team join ste_cos.purple_glow @s
execute unless entity @s[tag=ste_cos.arrow_tracked] run data modify entity @s Glowing set value 1b
execute unless entity @s[tag=ste_cos.arrow_tracked] at @s run playsound entity.arrow.shoot hostile @a ~ ~ ~ 0.8 1.5
execute unless entity @s[tag=ste_cos.arrow_tracked] run tag @s add ste_cos.arrow_tracked

# видимый след частиц за стрелой в полете
particle dust{color:[0.75,0.15,0.95],scale:0.8} ~ ~ ~ 0.04 0.04 0.04 0 2 force
