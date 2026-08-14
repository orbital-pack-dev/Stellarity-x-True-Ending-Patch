# ste_cos:server_setup
# Скрипт для настройки порядка датапаков на сервере
# Используйте: /function ste_cos:server_setup

datapack disable "file/Stellarity_Cosmetic_Patch"
datapack disable "file/Stellarity"
datapack disable "file/true_ending"

schedule function ste_cos:server_setup_2 20t
