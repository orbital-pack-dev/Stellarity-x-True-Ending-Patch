# ste_cos:fresh_visual/crystal_aura
# аура вокруг кристалла края (пульсирует строго 1 раз в секунду)

# фиолетовая вспышка
particle flash{color:-4980481} ~ ~1 ~ 0 0 0 0 1 force @a[distance=..128]
particle flash{color:-2673921} ~ ~1 ~ 0 0 0 0 1 force @a[distance=..128]

# отлетающие магические частицы
particle dust{color:[0.8,0.1,1.0],scale:1.3} ~ ~1 ~ 0.5 0.5 0.5 0.08 15 force @a[distance=..128]
particle dragon_breath ~ ~1 ~ 0.4 0.4 0.4 0.05 10 force @a[distance=..128]
particle portal ~ ~1 ~ 0.5 0.5 0.5 0.3 20 force @a[distance=..128]
particle electric_spark ~ ~1 ~ 0.3 0.3 0.3 0.05 6 force @a[distance=..128]
