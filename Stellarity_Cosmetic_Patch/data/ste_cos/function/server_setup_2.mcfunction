# ste_cos:server_setup_2
datapack enable "file/Stellarity" last
datapack enable "file/true_ending" after "file/Stellarity"
datapack enable "file/Stellarity_Cosmetic_Patch" first

tellraw @a {"text":"[STE-COS] Datapack load order has been successfully configured!","color":"green"}
