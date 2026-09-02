# TODO

## В процессе / требует решения

- [ ] **Vortex + кастомные крылья** — ждём Stellarity devs (custom item ID для Dragon Wings нужен для фикса vortex_tick на крыльях)
- [ ] **guard_act — кулдаун урона** — при переписывании гвардов-фантомов
- [ ] **orbit_guard — macro refactor** — при переписывании гвардов (текущая версия без макросов не оптимальна)
- [ ] **ste_settings** — система настроек + безопасная регенерация острова (см. TODO в load.mcfunction)
- [ ] Проверить PortalCooldown в Mechanics — работает ли он вообще на `item_display` и `armor_stand` в 1.21.x

## Аудит-фиксы — сделано

- [x] Фикс №1 — `chorus_cleaner`: убран `destroy`, оба патча синхронизированы
- [x] Фикс №2 — 13 идентичных оверрайдов stellarity удалены, `init.mcfunction` обновлён до 6.0.0-beta
- [x] Фикс №3 — `egg_find`: 14k-строчный бруте-форс → 19 страниц по 800 блоков
- [x] Фикс №5 — `pack.mcmeta`: pack_format 118, min_inclusive 94, убраны дублирующие поля
- [x] Фикс №7 — форслоад: 196 чанков → 11 точечных точек (10 башен + центр)
- [x] Фикс №8 — `main_tick`: choreс убран из периодики, добавлен ранний return, комментарии
- [x] Перенос всех фиксов в `Stellarity_Mechanics_Patch`
- [x] Скрипт `sync_patches.py` для синхронизации общих файлов

## Инструменты

- `compare_datapacks.py` — сравнить два датапака (zip или папка): `python compare_datapacks.py old.zip new.zip --diff`
- `sync_patches.py` — синхронизировать общие файлы Compat → Mechanics: `python sync_patches.py --apply`
- `build.py` — сборка релизных zip-архивов (если есть)

## Будущие идеи

- [ ] Исследовать Modrinth feedback для дополнительных фиксов
- [ ] GitHub Actions: авто-проверка что Mechanics и Compat в sync при push
