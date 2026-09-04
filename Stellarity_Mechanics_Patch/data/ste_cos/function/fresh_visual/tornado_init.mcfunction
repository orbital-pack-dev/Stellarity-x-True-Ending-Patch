# ste_cos:fresh_visual/tornado_init
# инициализация круговорота космического торнадо вокруг острова на высоте 0 126 0

kill @e[type=marker,tag=ste_cos.tornado_marker]

summon marker 0 126 0 {Tags:["ste_cos.tornado_marker","ste_cos.visual_marker"]}

scoreboard players set #tornado_step ste_cos.timer 0
