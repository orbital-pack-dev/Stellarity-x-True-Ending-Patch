# ste_cos:fresh_visual/heart_beat
# удар Сердца Дракона с нарастанием силы от стадий кристаллов

# звук стука сердца (СТРОГО стук Вардена с высокой громкостью для слышимости с земли)
execute if score #heart_stage ste_cos.flags matches 0 run playsound entity.warden.heartbeat hostile @a ~ ~ ~ 32.0 0.7
execute if score #heart_stage ste_cos.flags matches 1..3 run playsound entity.warden.heartbeat hostile @a ~ ~ ~ 32.0 0.85
execute if score #heart_stage ste_cos.flags matches 4..6 run playsound entity.warden.heartbeat hostile @a ~ ~ ~ 32.0 1.0
execute if score #heart_stage ste_cos.flags matches 7..9 run playsound entity.warden.heartbeat hostile @a ~ ~ ~ 32.0 1.15
execute if score #heart_stage ste_cos.flags matches 10.. run playsound entity.warden.heartbeat hostile @a ~ ~ ~ 32.0 1.35

# стадия 0: только маленькое ядрышко пыли, БЕЗ flash
execute if score #heart_stage ste_cos.flags matches 0 run particle dust{color:[0.65,0.05,0.85],scale:0.9} ~ ~ ~ 0.1 0.1 0.1 0 8 force @a
execute if score #heart_stage ste_cos.flags matches 0 run return 1

# стадия 1+: фиолетовая вспышка
particle flash{color:-4980481} ~ ~ ~ 0 0 0 0 1 force @a

# начальная стадия (1..3 кристаллов)
execute if score #heart_stage ste_cos.flags matches 1..3 run particle dust_color_transition{from_color:[0.8,0.1,1.0],scale:1.6,to_color:[0.15,0.0,0.4]} ~ ~ ~ 0.5 0.5 0.5 0.05 16 force @a
execute if score #heart_stage ste_cos.flags matches 1..3 run particle dragon_breath ~ ~ ~ 0.3 0.3 0.3 0.02 8 force @a

# средняя стадия (4..6 кристаллов): электрические искры и ведьмина магия
execute if score #heart_stage ste_cos.flags matches 4..6 run particle dust_color_transition{from_color:[0.85,0.15,1.0],scale:2.4,to_color:[0.15,0.0,0.4]} ~ ~ ~ 0.8 0.8 0.8 0.08 24 force @a
execute if score #heart_stage ste_cos.flags matches 4.. run particle witch ~ ~ ~ 1.0 1.0 1.0 0 25 force @a
execute if score #heart_stage ste_cos.flags matches 4.. run particle electric_spark ~ ~ ~ 0.8 0.8 0.8 0.05 18 force @a

# высокая стадия (7..9 кристаллов): стержни края и аметистовый отклик
execute if score #heart_stage ste_cos.flags matches 7..9 run particle dust_color_transition{from_color:[0.9,0.2,1.0],scale:3.2,to_color:[0.2,0.0,0.5]} ~ ~ ~ 1.2 1.2 1.2 0.1 32 force @a
execute if score #heart_stage ste_cos.flags matches 7.. run particle end_rod ~ ~ ~ 1.3 1.3 1.3 0.05 25 force @a
execute if score #heart_stage ste_cos.flags matches 7.. run particle electric_spark ~ ~ ~ 1.5 1.5 1.5 0.1 30 force @a
execute if score #heart_stage ste_cos.flags matches 7.. run playsound block.amethyst_block.resonate hostile @a ~ ~ ~ 32.0 1.1

# максимальная стадия (10 кристаллов): сжатие пространственного вихря
execute if score #heart_stage ste_cos.flags matches 10.. run particle dust_color_transition{from_color:[1.0,0.3,1.0],scale:4.0,to_color:[0.25,0.0,0.6]} ~ ~ ~ 1.8 1.8 1.8 0.15 45 force @a
execute if score #heart_stage ste_cos.flags matches 10.. run particle reverse_portal ~ ~ ~ 2.5 2.5 2.5 0.1 50 force @a
execute if score #heart_stage ste_cos.flags matches 10.. run playsound entity.warden.sonic_boom hostile @a ~ ~ ~ 32.0 1.25
