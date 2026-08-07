# =====================================================================
# ste_te_patch LOAD — инициализация скорбордов патча
# =====================================================================

scoreboard objectives add ste_te_misc dummy "STE-TE Patch"
scoreboard objectives add ste_te_rotation dummy "STE-TE Attack Rotation"

# Клок для ротатора атак
scoreboard players set ste_te_rotation_clock ste_te_misc 0
