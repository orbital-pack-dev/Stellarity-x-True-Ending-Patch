# =====================================================================
# ste_cos:mechanics/mace_nerf
# AS игрок с Булавой рядом с Драконом.
# =====================================================================
# Накладываем Слабость (чтобы сбить урон булавы) и Медлительность
effect give @s weakness 2 0 true
effect give @s slowness 2 1 true
tag @s add ste_cos.mace_nerfed

attribute @s minecraft:attack_damage base set -4.99
