# === ПУЛЬС: ЯРКАЯ ФАЗА ===
# Позиция и исполнитель унаследованы от pulse.mcfunction (= маркер ste_cos_egg_tracker)

# --- Восходящая двойная спираль (2 стренда по 6 точек, радиус 0.5 -> 0.1) ---
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:0.9,to_color:[1.0,0.1,0.9]} ~0.50 ~0.20 ~0.00 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:0.85,to_color:[1.0,0.1,0.9]} ~0.21 ~0.35 ~0.37 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:0.8,to_color:[1.0,0.1,0.9]} ~-0.17 ~0.50 ~0.30 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:0.75,to_color:[1.0,0.1,0.9]} ~-0.26 ~0.65 ~0.00 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:0.7,to_color:[1.0,0.1,0.9]} ~-0.09 ~0.80 ~-0.16 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:0.65,to_color:[1.0,0.1,0.9]} ~0.05 ~0.95 ~-0.09 0 0 0 0 1 force

particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:0.9,to_color:[1.0,0.1,0.9]} ~-0.50 ~0.20 ~0.00 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:0.85,to_color:[1.0,0.1,0.9]} ~-0.21 ~0.35 ~-0.37 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:0.8,to_color:[1.0,0.1,0.9]} ~0.17 ~0.50 ~-0.30 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:0.75,to_color:[1.0,0.1,0.9]} ~0.26 ~0.65 ~0.00 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:0.7,to_color:[1.0,0.1,0.9]} ~0.09 ~0.80 ~0.16 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:0.65,to_color:[1.0,0.1,0.9]} ~-0.05 ~0.95 ~0.09 0 0 0 0 1 force

# --- Вершина: яркая вспышка-ядро ---
particle minecraft:dust_color_transition{from_color:[1.0,0.1,0.9],scale:1.3,to_color:[1.0,0.6,1.0]} ~0.0 ~1.15 ~0.0 0.06 0.06 0.06 0 6 force
particle minecraft:end_rod ~0.0 ~1.15 ~0.0 0.05 0.08 0.05 0.01 4 force

# --- Внешнее кольцо, 16 точек, радиус 0.9 (углы просчитаны офлайн, шаг 22.5°) ---
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~0.90 ~0.5 ~0.00 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~0.83 ~0.5 ~0.34 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~0.64 ~0.5 ~0.64 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~0.34 ~0.5 ~0.83 0 0 0 0 1 force
particle minecraft:end_rod ~0.00 ~0.55 ~0.90 0.02 0.05 0.02 0.01 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~0.00 ~0.5 ~0.90 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~-0.34 ~0.5 ~0.83 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~-0.64 ~0.5 ~0.64 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~-0.83 ~0.5 ~0.34 0 0 0 0 1 force
particle minecraft:end_rod ~-0.90 ~0.55 ~0.00 0.02 0.05 0.02 0.01 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~-0.90 ~0.5 ~0.00 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~-0.83 ~0.5 ~-0.34 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~-0.64 ~0.5 ~-0.64 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~-0.34 ~0.5 ~-0.83 0 0 0 0 1 force
particle minecraft:end_rod ~0.00 ~0.55 ~-0.90 0.02 0.05 0.02 0.01 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~0.00 ~0.5 ~-0.90 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~0.34 ~0.5 ~-0.83 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~0.64 ~0.5 ~-0.64 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.35,0.0,0.55],scale:1.1,to_color:[1.0,0.1,0.9]} ~0.83 ~0.5 ~-0.34 0 0 0 0 1 force

# --- Портальный "выдох" в момент пика ---
particle minecraft:dragon_breath ~0.0 ~0.5 ~0.0 0.5 0.5 0.5 0.03 4 force
