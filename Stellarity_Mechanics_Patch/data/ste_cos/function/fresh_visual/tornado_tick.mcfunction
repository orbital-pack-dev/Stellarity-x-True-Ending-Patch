# ste_cos:fresh_visual/tornado_tick
# вращение и испускание волн торнадо над островом

execute as @e[type=marker,tag=ste_cos.tornado_marker] at @s run tp @s ~ ~ ~ ~6 0
execute as @e[type=marker,tag=ste_cos.tornado_marker] at @s run function ste_cos:fresh_visual/tornado_wave
