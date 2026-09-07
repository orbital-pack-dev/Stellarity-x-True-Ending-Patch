import os

IGNORED_DIRS = {
    ".git",
    ".idea",
    ".vscode",
    ".gradle",
    "node_modules",
    "build",
    "dist",
    "bin",
    "obj",
    "__pycache__",
}

IGNORED_EXTENSIONS = {
    ".png",
    ".jpg",
    ".jpeg",
    ".gif",
    ".ogg",
    ".mp3",
    ".wav",
    ".jar",
    ".zip",
    ".tar",
    ".gz",
    ".7z",
    ".exe",
    ".dll",
    ".so",
    ".dylib",
    ".class",
    ".ico",
}

BUFFER_SIZE = 64 * 1024


def analyze_project():
    script_path = os.path.abspath(__file__)
    root_dir = os.path.dirname(script_path)
    report_path = os.path.join(root_dir, "project_report.md")

    total_folders = 0
    total_files = 0
    total_lines = 0
    total_chars = 0

    for root, dirs, files in os.walk(root_dir):
        dirs[:] = [d for d in dirs if d not in IGNORED_DIRS]
        total_folders += len(dirs)

        for file in files:
            file_path = os.path.abspath(os.path.join(root, file))

            if file_path == script_path or file_path == os.path.abspath(report_path):
                continue

            _, ext = os.path.splitext(file)
            if ext.lower() in IGNORED_EXTENSIONS:
                continue

            total_files += 1

            try:
                with open(file_path, "rb") as f:
                    file_has_bytes = False
                    last_byte = b""

                    while True:
                        chunk = f.read(BUFFER_SIZE)
                        if not chunk:
                            break
                        file_has_bytes = True
                        total_chars += len(chunk)
                        total_lines += chunk.count(b"\n")
                        last_byte = chunk[-1:]

                    if file_has_bytes and last_byte != b"\n":
                        total_lines += 1
            except (OSError, PermissionError):
                pass

    report_content = (
        f"# Project Structure Report: {os.path.basename(root_dir)}\n\n"
        f"## Summary\n\n"
        f"- **Total Folders:** {total_folders}\n"
        f"- **Total Files:** {total_files}\n"
        f"- **Total Lines:** {total_lines}\n"
        f"- **Total Characters:** {total_chars}\n"
    )

    try:
        with open(report_path, "w", encoding="utf-8") as rf:
            rf.write(report_content)
        print("Анализ завершен. Результаты записаны в project_report.md")
    except OSError as e:
        print(f"Не удалось сохранить отчет: {e}")


if __name__ == "__main__":
    analyze_project()