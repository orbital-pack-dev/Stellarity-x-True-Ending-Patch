# Stellarity x True Ending (Boss Fight) Patch Plan

Цель патча — объединить логику боя Дракона из **True Ending** с визуальной частью, звуком, генерацией и структурой Алтаря/Кристаллов из **Stellarity**. 

Анализ показал следующие зоны ответственности и точки конфликтов, которые необходимо разрешить путем создания файлов-переопределений (overrides) в нашем патче `Stellarity_TrueEnding_Patch`.

## User Review Required

> [!IMPORTANT]
> Пожалуйста, проверь предложенный список переопределений (заглушек). Если я упустил какой-то визуальный эффект из True Ending, который ты хотел бы оставить (например, частицы ударных волн от атак дракона), дай мне знать! В текущем плане отключается **весь** эмбиент и музыка True Ending, и **вся** логика атак Stellarity.

## Open Questions

> [!WARNING]
> Ударные волны и новые фаерболы (ультра-фаерболы) из True Ending имеют свои визуальные частицы. Должны ли мы оставить их (так как они часть логики атак True Ending), или попытаться заменить их на частицы из Stellarity? (По умолчанию мы оставляем визуализацию самих атак True Ending, но отключаем общий фон/музыку).

## Proposed Changes

Мы создадим дата-пак `Stellarity_TrueEnding_Patch`, который будет загружаться **выше** обоих модов и переопределять конфликтующие функции.

### Stellarity overrides (Отключение логики фаз и атак)

Stellarity имеет единый контроллер Дракона, который вызывает музыку, меняет bossbar, но также управляет фазами (strafing, landing, breath attack, fireball) и возрождением кристаллов. Мы переопределим главный файл так, чтобы он сохранил только визуал и музыку.

#### [MODIFY] [main.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/stellarity/function/entity/dragon/main.mcfunction)
- **Оставляем**: 
  - Подсчет кристаллов и логику неуязвимости.
  - Обновление кастомного Bossbar.
  - Музыку (`stellarity:entity/dragon/music/tick`).
  - Партиклы (`stellarity:entity/dragon/trail`).
  - Визуал луча (`beam_thingy`).
- **Удаляем (заглушаем)**:
  - Phase monitor (строки 49-65: проверки на strafing, landing, вызовы атак `fireball`, `shulker_hell`, `ball_of_blight` и т.д.).
  - Систему возрождения кристаллов (revive_crystals), если хотим, чтобы True Ending контролировал баланс (либо можем оставить, если нужно, чтобы кристаллы восстанавливались по логике Stellarity - *по умолчанию удаляем, так как бой из TE*).
  
---

### True Ending overrides (Отключение визуала, эмбиента и структур)

True Ending имеет функции `tick` и `a_main` (в boss и ambience). Нам нужно отключить их визуальную составляющую, музыку и логику респавна (так как алтарь и генерация от Stellarity).

#### [MODIFY] [a_main.mcfunction (ambience)](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/true_ending/function/ambience/a_main.mcfunction)
- Делаем файл **пустым** или удаляем вызовы партиклов. Это отключит свечение кристаллов, пыльцу и другие эффекты фона от True Ending, отдавая приоритет атмосфере Stellarity.

#### [MODIFY] [a_main_no_dragon.mcfunction (ambience)](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/true_ending/function/ambience/a_main_no_dragon.mcfunction)
- Делаем файл **пустым**. Отключает эмбиент TE при отсутствии дракона.

#### [MODIFY] [music.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/true_ending/function/music.mcfunction)
- Делаем файл **пустым**. Это полностью отключит саундтрек True Ending, чтобы играла только музыка Stellarity.

#### [MODIFY] [a_main.mcfunction (respawning)](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/true_ending/function/respawning/a_main.mcfunction)
- Делаем файл **пустым**. Отключает анимацию и логику возрождения дракона из True Ending. Всю работу с Алтарем, установкой 4-х кристаллов и Яйцом Дракона возьмет на себя Stellarity.

#### [MODIFY] [tick.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/true_ending/function/tick.mcfunction)
- *Опционально*: если пустые функции не сработают гладко, мы можем переопределить `tick.mcfunction` из True Ending, удалив вызовы `#ambience`, `#music` и `#respawn animation`, оставив только вызов `#dragon` (`true_ending:boss/a_main`) и счетчики. Это более чистый подход.

---

### Сохраняемые элементы (Без изменений)
- **Логика боя (True Ending)**: Оставляем нетронутыми `true_ending:boss/*`, где спавнятся фантомы, ударные волны и ультра-фаерболы.
- **Генерация и Алтарь (Stellarity)**: Структуры Stellarity остаются без изменений, так как True Ending не вмешивается в генерацию мира.

## Verification Plan

### Manual Verification
1. Зайти в Энд и убедиться, что Алтарь и Кристаллы сгенерировались от Stellarity.
2. Начать бой с Драконом.
3. Проверить:
   - Играет ли музыка из Stellarity.
   - Использует ли Дракон новые атаки (фантомы, dive, ударные волны) из True Ending.
   - Отсутствуют ли стандартные атаки Stellarity, которые могли бы конфликтовать (например, "шар порчи" или shulker hell).
4. Убить дракона и проверить, что алтарь корректно активировался и появилось Яйцо Дракона (от Stellarity).
5. Попробовать призвать дракона заново 4-мя кристаллами, чтобы убедиться, что респавн работает штатно через Stellarity.
