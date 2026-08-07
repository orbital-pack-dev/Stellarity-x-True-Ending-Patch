# =====================================================================
# ste_te_patch:mechanics/shard_charge_trigger
# Форсируем Laser-фазу от накопленных зарядов. Контекст: AS ender_dragon.
# =====================================================================
scoreboard players set @s ste_te_charges 0
scoreboard players set @s trueEnding_bosstime 2001
particle flash{color:[1.0, 0.8, 0.0, 1.0]} ~ ~ ~ 0 0 0 0 3 force
title @a[distance=..200] actionbar {"text":"CRYSTAL DISCHARGE","color":"aqua","bold":true}
playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..256] ~ ~ ~ 8 1.5
