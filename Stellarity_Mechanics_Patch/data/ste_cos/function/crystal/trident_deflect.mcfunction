# ste_cos:crystal/trident_deflect
# безопасный отскок трезубца от силового щита кристалла (предмет не удаляется!)

tag @s add ste_cos.deflected
execute facing entity @e[type=end_crystal,distance=..5,limit=1] eyes run tp @s ^ ^0.4 ^-2.0
data modify entity @s Motion set value [0.0d, 0.25d, 0.0d]
particle electric_spark ~ ~ ~ 0.3 0.3 0.3 0.1 12 force
particle flash{color:[0.5,0.85,1.0,1.0]} ~ ~ ~ 0 0 0 0 1 force
playsound item.shield.block hostile @a[distance=..16] ~ ~ ~ 1.0 1.0
playsound block.amethyst_block.hit hostile @a[distance=..16] ~ ~ ~ 1.0 1.6
