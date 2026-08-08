# =====================================================================
# ste_cos:portal/chorus_col
# AS scanner AT сканера (Y=50, ось XZ текущей клетки).
# Для каждого Y (50..70) в этом столбце: если блок chorus_plant/
# chorus_flower — дропает chorus_fruit (item) и убирает блок (air).
# Используем construct: jump на высота через positioned.
# =====================================================================

# --- Y=50 ---
execute positioned ~ ~0 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~0 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~0 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~0 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=51 ---
execute positioned ~ ~1 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~1 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~1 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~1 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=52 ---
execute positioned ~ ~2 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~2 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~2 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~2 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=53 ---
execute positioned ~ ~3 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~3 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~3 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~3 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=54 ---
execute positioned ~ ~4 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~4 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~4 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~4 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=55 ---
execute positioned ~ ~5 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~5 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~5 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~5 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=56 ---
execute positioned ~ ~6 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~6 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~6 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~6 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=57 ---
execute positioned ~ ~7 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~7 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~7 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~7 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=58 ---
execute positioned ~ ~8 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~8 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~8 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~8 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=59 ---
execute positioned ~ ~9 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~9 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~9 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~9 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=60 ---
execute positioned ~ ~10 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~10 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~10 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~10 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=61 ---
execute positioned ~ ~11 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~11 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~11 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~11 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=62 ---
execute positioned ~ ~12 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~12 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~12 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~12 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=63 ---
execute positioned ~ ~13 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~13 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~13 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~13 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=64 ---
execute positioned ~ ~14 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~14 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~14 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~14 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air

# --- Y=65 ---
execute positioned ~ ~15 ~ if block ~ ~ ~ minecraft:chorus_plant run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~15 ~ if block ~ ~ ~ minecraft:chorus_flower run summon item ~ ~ ~ {Item:{id:"minecraft:chorus_fruit",count:1}}
execute positioned ~ ~15 ~ if block ~ ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ air
execute positioned ~ ~15 ~ if block ~ ~ ~ minecraft:chorus_flower run setblock ~ ~ ~ air
