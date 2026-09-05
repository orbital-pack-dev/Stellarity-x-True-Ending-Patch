# ste_cos:fresh_visual/crystal_aura
# аура вокруг кристалла края (пульсирует строго 1 раз в секунду)

# двойная фиолетовая вспышка кристалла
particle flash{color:-4980481} ~ ~1 ~ 0 0 0 0 1 force @a[distance=..128]
particle flash{color:-2673921} ~ ~1 ~ 0 0 0 0 1 force @a[distance=..128]

# глубокий космический резонанс аметиста и магии (громкость 32+)
playsound block.amethyst_block.resonate block @a ~ ~ ~ 32.0 0.60
playsound entity.illusioner.cast_spell block @a ~ ~ ~ 32.0 0.65

# объемное извержение частиц: вертикальный столб драконьего дыхания и звезд
particle dragon_breath ~ ~1.2 ~ 0.35 0.8 0.35 0.06 18 force @a[distance=..128]
particle end_rod ~ ~1.2 ~ 0.25 0.5 0.25 0.06 10 force @a[distance=..128]

# переливающееся облако космической пыли и схлопывание пространства
particle dust_color_transition{from_color:[0.3,0.9,1.0],scale:1.8,to_color:[0.65,0.05,0.95]} ~ ~1.2 ~ 0.6 0.5 0.6 0.08 22 force @a[distance=..128]
particle reverse_portal ~ ~1 ~ 0.6 0.6 0.6 0.12 25 force @a[distance=..128]
particle electric_spark ~ ~1 ~ 0.4 0.4 0.4 0.06 10 force @a[distance=..128]
