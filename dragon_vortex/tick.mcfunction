# диспетчер: раз в 4 тика вызывает нужный frame_N, всего 80 тиков (4 сек)
execute if score #t stlr.vortex matches 0 run function stellarity:vfx/dragon_vortex/frame_0
execute if score #t stlr.vortex matches 4 run function stellarity:vfx/dragon_vortex/frame_4
execute if score #t stlr.vortex matches 8 run function stellarity:vfx/dragon_vortex/frame_8
execute if score #t stlr.vortex matches 12 run function stellarity:vfx/dragon_vortex/frame_12
execute if score #t stlr.vortex matches 16 run function stellarity:vfx/dragon_vortex/frame_16
execute if score #t stlr.vortex matches 20 run function stellarity:vfx/dragon_vortex/frame_20
execute if score #t stlr.vortex matches 24 run function stellarity:vfx/dragon_vortex/frame_24
execute if score #t stlr.vortex matches 28 run function stellarity:vfx/dragon_vortex/frame_28
execute if score #t stlr.vortex matches 32 run function stellarity:vfx/dragon_vortex/frame_32
execute if score #t stlr.vortex matches 36 run function stellarity:vfx/dragon_vortex/frame_36
execute if score #t stlr.vortex matches 40 run function stellarity:vfx/dragon_vortex/frame_40
execute if score #t stlr.vortex matches 44 run function stellarity:vfx/dragon_vortex/frame_44
execute if score #t stlr.vortex matches 48 run function stellarity:vfx/dragon_vortex/frame_48
execute if score #t stlr.vortex matches 52 run function stellarity:vfx/dragon_vortex/frame_52
execute if score #t stlr.vortex matches 56 run function stellarity:vfx/dragon_vortex/frame_56
execute if score #t stlr.vortex matches 60 run function stellarity:vfx/dragon_vortex/frame_60
execute if score #t stlr.vortex matches 64 run function stellarity:vfx/dragon_vortex/frame_64
execute if score #t stlr.vortex matches 68 run function stellarity:vfx/dragon_vortex/frame_68
execute if score #t stlr.vortex matches 72 run function stellarity:vfx/dragon_vortex/frame_72
execute if score #t stlr.vortex matches 76 run function stellarity:vfx/dragon_vortex/frame_76
scoreboard players add #t stlr.vortex 1
execute if score #t stlr.vortex matches ..79 run schedule function stellarity:vfx/dragon_vortex/tick 1t
execute if score #t stlr.vortex matches 80.. run scoreboard players reset #t stlr.vortex
