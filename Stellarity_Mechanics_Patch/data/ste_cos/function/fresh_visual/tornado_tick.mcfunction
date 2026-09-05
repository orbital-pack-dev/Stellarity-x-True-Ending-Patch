# ste_cos:fresh_visual/tornado_tick
# вращение и испускание волн космического вихря над островом

execute as @e[type=marker,tag=ste_cos.tornado_marker] at @s run tp @s ~ ~ ~ ~4 0
execute as @e[type=marker,tag=ste_cos.tornado_marker] at @s run function ste_cos:fresh_visual/tornado_wave

# низкий фоновый гул закручивающегося космического вихря над островом (громкость 32+)
execute if predicate true_ending:chance/6_percent run playsound block.respawn_anchor.deplete ambient @a 0 129 0 32.0 0.55
execute if predicate true_ending:chance/6_percent run playsound block.amethyst_block.resonate ambient @a 0 129 0 32.0 0.50
