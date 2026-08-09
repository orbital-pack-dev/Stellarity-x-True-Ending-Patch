# === ПУЛЬС: ТЁМНАЯ ФАЗА (выдох/затухание) ===
# Плотность вдвое ниже bright-фазы — это и создаёт эффект "дыхания", а не ровный шум

# --- Затухающие остатки спирали (по 3 точки на стренд) ---
particle minecraft:dust_color_transition{from_color:[0.8,0.0,0.7],scale:0.9,to_color:[0.08,0.0,0.18]} ~0.05 ~0.95 ~-0.09 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.8,0.0,0.7],scale:0.75,to_color:[0.08,0.0,0.18]} ~-0.26 ~0.65 ~0.00 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.8,0.0,0.7],scale:0.6,to_color:[0.08,0.0,0.18]} ~0.50 ~0.20 ~0.00 0 0 0 0 1 force

particle minecraft:dust_color_transition{from_color:[0.8,0.0,0.7],scale:0.9,to_color:[0.08,0.0,0.18]} ~-0.05 ~0.95 ~0.09 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.8,0.0,0.7],scale:0.75,to_color:[0.08,0.0,0.18]} ~0.26 ~0.65 ~0.00 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.8,0.0,0.7],scale:0.6,to_color:[0.08,0.0,0.18]} ~-0.50 ~0.20 ~0.00 0 0 0 0 1 force

# --- Сжимающееся кольцо, 8 точек, радиус 0.5 ---
particle minecraft:dust_color_transition{from_color:[0.8,0.0,0.7],scale:0.7,to_color:[0.08,0.0,0.18]} ~0.50 ~0.5 ~0.00 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.8,0.0,0.7],scale:0.7,to_color:[0.08,0.0,0.18]} ~0.35 ~0.5 ~0.35 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.8,0.0,0.7],scale:0.7,to_color:[0.08,0.0,0.18]} ~0.00 ~0.5 ~0.50 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.8,0.0,0.7],scale:0.7,to_color:[0.08,0.0,0.18]} ~-0.35 ~0.5 ~0.35 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.8,0.0,0.7],scale:0.7,to_color:[0.08,0.0,0.18]} ~-0.50 ~0.5 ~0.00 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.8,0.0,0.7],scale:0.7,to_color:[0.08,0.0,0.18]} ~-0.35 ~0.5 ~-0.35 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.8,0.0,0.7],scale:0.7,to_color:[0.08,0.0,0.18]} ~0.00 ~0.5 ~-0.50 0 0 0 0 1 force
particle minecraft:dust_color_transition{from_color:[0.8,0.0,0.7],scale:0.7,to_color:[0.08,0.0,0.18]} ~0.35 ~0.5 ~-0.35 0 0 0 0 1 force

# --- Тихий "вдох" портала ---
particle minecraft:dragon_breath ~0.0 ~0.4 ~0.0 0.2 0.2 0.2 0.01 2 force
