# =====================================================================
# ste_cos:mechanics/mace_nerf_disable
# AS игрок с тегом ste_cos.mace_nerfed, который убрал Булаву из рук
# =====================================================================

# Снимаем эффекты
effect clear @s weakness
effect clear @s slowness

attribute @s minecraft:attack_damage base set 1
tag @s remove ste_cos.mace_nerfed
