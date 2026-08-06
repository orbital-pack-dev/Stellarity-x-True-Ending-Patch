# Stellarity x True Ending Compatibility Patch - Walkthrough

Я успешно создал `Stellarity_TrueEnding_Patch`, который решает задачу склейки этих дата-паков. Вот что было сделано:

## 1. Инициализация Патча
Была создана папка `Stellarity_TrueEnding_Patch` с файлом `pack.mcmeta` (формат 48 для 1.21.11). Внутри воссоздана необходимая структура директорий для переопределения функций.

## 2. Подшивка Stellarity (Сохранение визуала)
Я переопределил файл [main.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/stellarity/function/entity/dragon/main.mcfunction) из `stellarity:entity/dragon/main`. 
- **Отключено**: Системы Phase Monitor (логика перехода по фазам), вызовы атак (chainfire, shulker_hell, ball of blight и др.), система оживления кристаллов.
- **Сохранено**: Логика счетчика кристаллов, подсветка боссбара, музыка Дракона, партиклы (trails), визуалы смерти (fly_to_portal).

## 3. Подшивка True Ending (Отключение лишнего фона)
Я переопределил главный тиковый файл [tick.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/true_ending/function/tick.mcfunction) из `true_ending:tick`.
- **Отключено**: Вызовы эмбиента (`a_main`, `a_main_no_dragon`), респавна (`respawning/a_main`), партиклов фона и своей музыки.
- **Сохранено**: Основная логика босса (`true_ending:boss/a_main`), спавн ультра-фаерболов, ударных волн и фантомов, а также начисление опыта. 

## Результат
Теперь, если поместить `Stellarity_TrueEnding_Patch` выше обоих модов в списке дата-паков:
- Stellarity будет продолжать спавнить свои башни и алтарь, считать кристаллы и играть музыку/показывать свой Bossbar.
- При начале боя Дракон будет использовать фазы и ИИ из True Ending (вызывать фантомов, атаковать ударными волнами), при этом красиво светясь частицами от Stellarity!
