# =====================================================================
# ste_te_patch:load — инициализация скорбордов патча
# =====================================================================

scoreboard objectives add ste_te_rotation dummy "STE-TE Rotation"
scoreboard objectives add ste_te_misc dummy "STE-TE Patch"
scoreboard objectives add ste_te_timer dummy "STE-TE Global Timer"
scoreboard objectives add ste_te_afk_time dummy "STE-TE AFK Timer"
scoreboard objectives add ste_te_dive_count dummy "STE-TE Dive Count"
scoreboard objectives add ste_te_charges dummy "STE-TE Shard Charges"
scoreboard objectives add ste_te_armor_check dummy "STE-TE Armor Check"
scoreboard objectives add ste_te_m1 dummy "STE-TE Mech 1"
scoreboard objectives add ste_te_m2 dummy "STE-TE Mech 2"
scoreboard objectives add ste_te_m3 dummy "STE-TE Mech 3"
scoreboard objectives add ste_te_m4 dummy "STE-TE Mech 4"
scoreboard objectives add ste_te_m5 dummy "STE-TE Mech 5"
scoreboard objectives add ste_te_m6 dummy "STE-TE Mech 6"
scoreboard objectives add ste_te_m7 dummy "STE-TE Mech 7"
scoreboard objectives add ste_te_m8 dummy "STE-TE Mech 8"
scoreboard objectives add ste_te_m9 dummy "STE-TE Mech 9"
scoreboard objectives add ste_te_m10 dummy "STE-TE Mech 10"
scoreboard objectives add ste_te_m11 dummy "STE-TE Mech 11"
scoreboard objectives add ste_te_m12 dummy "STE-TE Mech 12"
scoreboard objectives add ste_te_m13 dummy "STE-TE Mech 13"
scoreboard objectives add ste_te_m14 dummy "STE-TE Mech 14"
scoreboard objectives add ste_te_m_timer dummy "STE-TE Marker Timer"
scoreboard objectives add ste_te_laststand_cd dummy "STE-TE LastStand CD"

# Новые объективы (v2.0)
scoreboard objectives add ste_te_flags dummy
scoreboard objectives add temp_health dummy

# Инициализация
scoreboard players set $dead ste_te_flags 0
scoreboard players set $crystals_gone ste_te_flags 0
scoreboard players set $guards_spawned ste_te_flags 0
scoreboard players set $guard_cooldown ste_te_flags 0
scoreboard players set $shield_dropped ste_te_flags 0
scoreboard players set $ring_radius ste_te_flags 0

# Клок для ротатора атак
scoreboard players set ste_te_rotation_clock ste_te_misc 0
