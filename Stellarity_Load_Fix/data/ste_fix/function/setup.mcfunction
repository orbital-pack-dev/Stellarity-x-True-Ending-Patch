tellraw @a ["",{"text":"[STE-COS] Пожалуйста, выберите ядро вашего сервера:","color":"gold"}]
tellraw @a ["",{"text":"[▶] Vanilla / Fabric / Forge","color":"green","clickEvent":{"action":"run_command","value":"/function ste_fix:setup_vanilla"},"hoverEvent":{"action":"show_text","contents":"Нажмите для установки порядка загрузки (vanilla)"}}]
tellraw @a ["",{"text":"[▶] Paper / Purpur / Spigot","color":"aqua","clickEvent":{"action":"run_command","value":"/function ste_fix:setup_paper"},"hoverEvent":{"action":"show_text","contents":"Нажмите для установки порядка загрузки (paper)"}}]
