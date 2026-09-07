# ste_cos:fresh_visual/portal_crystals_pulse_start
# взрывная волна

# очистка
kill @e[type=marker,tag=ste_cos.pulse_wave_marker]
tag @e[tag=ste_cos.pulse_hit] remove ste_cos.pulse_hit

# звуки залпа
playsound entity.warden.sonic_boom master @a 0 65 0 64.0 0.60
playsound block.amethyst_block.resonate master @a 0 65 0 64.0 0.50
playsound entity.generic.explode master @a 0 65 0 64.0 0.75
playsound block.respawn_anchor.deplete master @a 0 65 0 64.0 0.85

# взрыв на портале
particle explosion_emitter 0 66 0 3 0.5 3 0 10 force @a
particle flash{color:[1.0,0.35,1.0,1.0]} 0 66 0 0 0 0 0 4 force @a
particle sonic_boom 0 66 0 0 0 0 0 4 force @a

# маркеры волны
execute positioned 0 65 0 rotated 0 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 22.5 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 45 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 67.5 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 90 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 112.5 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 135 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 157.5 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 180 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 202.5 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 225 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 247.5 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 270 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 292.5 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 315 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
execute positioned 0 65 0 rotated 337.5 0 run summon marker ~ ~ ~ {Tags:["ste_cos.pulse_wave_marker"]}
