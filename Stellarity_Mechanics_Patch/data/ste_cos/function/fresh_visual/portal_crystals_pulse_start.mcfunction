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

# вспышка на портале
particle explosion_emitter 0 66 0 3 0.5 3 0 10 force @a
particle flash{color:[1.0,0.35,1.0,1.0]} 0 66 0 0 0 0 0 4 force @a
particle sonic_boom 0 66 0 0 0 0 0 4 force @a

# маркеры волны
summon marker 0 65 0 {Rotation:[0.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[5.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[10.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[15.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[20.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[25.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[30.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[35.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[40.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[45.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[50.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[55.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[60.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[65.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[70.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[75.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[80.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[85.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[90.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[95.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[100.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[105.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[110.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[115.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[120.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[125.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[130.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[135.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[140.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[145.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[150.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[155.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[160.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[165.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[170.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[175.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[180.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[185.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[190.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[195.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[200.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[205.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[210.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[215.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[220.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[225.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[230.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[235.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[240.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[245.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[250.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[255.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[260.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[265.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[270.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[275.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[280.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[285.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[290.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[295.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[300.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[305.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[310.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[315.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[320.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[325.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[330.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[335.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[340.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[345.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[350.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
summon marker 0 65 0 {Rotation:[355.0f,0.0f],Tags:["ste_cos.pulse_wave_marker"]}
