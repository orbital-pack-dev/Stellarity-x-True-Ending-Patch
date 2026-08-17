function ste_fix:disable_all

# Paper / Purpur
datapack enable "file/Stellarity-5.5.5" after "paper"
datapack enable "file/Stellarity-5.5.5.zip" after "paper"
datapack enable "file/Stellarity" after "paper"
datapack enable "file/Stellarity.zip" after "paper"

datapack enable "file/tru.e-ending-1.1.4d" after "file/Stellarity-5.5.5"
datapack enable "file/tru.e-ending-1.1.4d.zip" after "file/Stellarity-5.5.5.zip"
datapack enable "file/tru.e-ending-1.1.4d" after "file/Stellarity"
datapack enable "file/tru.e-ending-1.1.4d.zip" after "file/Stellarity.zip"

datapack enable "file/Stellarity_Cosmetic_Patch" last
datapack enable "file/Stellarity_Cosmetic_Patch.zip" last

tellraw @a {"text":"[STE-COS] Datapack load order for Paper/Purpur has been configured!","color":"green"}
