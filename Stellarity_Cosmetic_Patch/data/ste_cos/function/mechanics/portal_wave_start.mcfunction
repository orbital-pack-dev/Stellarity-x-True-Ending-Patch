scoreboard players add temp2 ste_cos.flags 1
execute rotated ~10 0 positioned ~ ~.2 ~ run summon marker ~ ~ ~ {Tags:["ste_cos_portal_wave","ste_cos_wave_temp"]}
execute rotated ~10 0 positioned ~ ~.2 ~ run tp @e[sort=nearest,limit=1,type=marker,tag=ste_cos_portal_wave,tag=ste_cos_wave_temp] ~ ~ ~ ~ ~
execute rotated ~10 0 positioned ~ ~.2 ~ run tag @e[sort=nearest,limit=1,type=marker,tag=ste_cos_portal_wave,tag=ste_cos_wave_temp] remove ste_cos_wave_temp
execute unless score temp2 ste_cos.flags matches 36.. rotated ~10 ~ run function ste_cos:mechanics/portal_wave_start
execute if score temp2 ste_cos.flags matches 36.. run scoreboard players reset temp2 ste_cos.flags
