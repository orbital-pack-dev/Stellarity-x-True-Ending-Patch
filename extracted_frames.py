import io
import os
import zipfile
import requests

# Настройки
PROJECT_SLUG = "icons"
TARGET_PATH_INSIDE_ZIP = "assets/icons/textures/menu/resource_pack_frame.png"
OUTPUT_DIR = "extracted_frames"

# Modrinth API требует User-Agent в формате: <Username>/<ProjectName>/<Version> (<Contact>)
HEADERS = {
    "User-Agent": "void7676/icons-frame-extractor/1.0 (github.com/void7676)"
}

def main():
    if not os.path.exists(OUTPUT_DIR):
        os.makedirs(OUTPUT_DIR)
        print(f"Создана директория для результатов: {OUTPUT_DIR}")

    print(f"Запрос списка версий для проекта '{PROJECT_SLUG}' через Modrinth API...")
    url = f"https://api.modrinth.com/v2/project/{PROJECT_SLUG}/version"
    
    response = requests.get(url, headers=HEADERS)
    if response.status_code != 200:
        print(f"Ошибка получения данных от API Modrinth: HTTP {response.status_code}")
        return

    versions_data = response.json()
    print(f"Найдено версий: {len(versions_data)}\n" + "-" * 50)

    extracted_count = 0

    for ver in versions_data:
        version_number = ver.get("version_number", "unknown_ver")
        files = ver.get("files", [])
        
        if not files:
            continue

        # Ищем первичный файл версии (primary: True), либо берем первый из списка
        primary_file = next((f for f in files if f.get("primary")), files[0])
        file_url = primary_file.get("url")
        file_name = primary_file.get("filename")

        print(f"Обработка версии: {version_number} ({file_name})...")

        try:
            # Скачиваем архив прямо в оперативную память (BytesIO)
            dl_response = requests.get(file_url, headers=HEADERS, stream=True)
            if dl_response.status_code != 200:
                print(f"  [!] Ошибка скачивания {file_name}: HTTP {dl_response.status_code}")
                continue

            zip_buffer = io.BytesIO(dl_response.content)

            # Открываем zip в памяти без сохранения на диск
            with zipfile.ZipFile(zip_buffer) as zf:
                # Нормализуем пути (zip всегда использует слэши '/')
                target_normalized = TARGET_PATH_INSIDE_ZIP.replace("\\", "/")
                
                # Поиск файла без учета регистра (на случай разного регистра в путях)
                found_in_zip = None
                for member_path in zf.namelist():
                    if member_path.lower() == target_normalized.lower():
                        found_in_zip = member_path
                        break

                if found_in_zip:
                    # Формируем имя целевого файла: resource_pack_frame_<version>.png
                    out_filename = f"resource_pack_frame_{version_number}.png"
                    # Безопасная очистка имени файла от запрещенных символов OS
                    for char in ['/', '\\', ':', '*', '?', '"', '<', '>', '|']:
                        out_filename = out_filename.replace(char, "_")

                    out_path = os.path.join(OUTPUT_DIR, out_filename)

                    with zf.open(found_in_zip) as src_file, open(out_path, "wb") as dst_file:
                        dst_file.write(src_file.read())

                    print(f"  [+] Извлечен файл: {out_filename}")
                    extracted_count += 1
                else:
                    print(f"  [-] Файл по пути '{TARGET_PATH_INSIDE_ZIP}' не найден в этой версии.")

        except zipfile.BadZipFile:
            print(f"  [!] Ошибка: Скачанный файл {file_name} не является корректным ZIP-архивом.")
        except Exception as e:
            print(f"  [!] Произошла ошибка при обработке: {e}")

    print("-" * 50)
    print(f"Готово! Извлечено файлов: {extracted_count} из {len(versions_data)}. Сохранено в: ./{OUTPUT_DIR}/")

if __name__ == "__main__":
    main()