# ste_cos:mechanics/arrow_highlight
# вызов подсветки всех стрел в Краю

execute in minecraft:the_end as @e[type=arrow,tag=!ste_cos.arrow_landed] at @s run function ste_cos:mechanics/arrow_highlight_each
execute in minecraft:the_end as @e[type=spectral_arrow,tag=!ste_cos.arrow_landed] at @s run function ste_cos:mechanics/arrow_highlight_each
