import os
import json
import re
from pathlib import Path

# The source directories to scan
SOURCES = ["tru.e-ending-1.1.4d", "Stellarity-5.5.5"]
DEST_DIR = "Stellarity_Cosmetic_Patch"

def fix_json_recursively(data, file_path):
    modified = False
    
    # 1. Advancement entity array triggers
    if isinstance(data, dict):
        if "criteria" in data and isinstance(data["criteria"], dict):
            for crit_name, crit_val in data["criteria"].items():
                if isinstance(crit_val, dict) and "trigger" in crit_val and "conditions" in crit_val:
                    conds = crit_val["conditions"]
                    if "entity" in conds and isinstance(conds["entity"], list):
                        if len(conds["entity"]) == 1:
                            conds["entity"] = conds["entity"][0]
                        elif len(conds["entity"]) > 1:
                            conds["entity"] = {
                                "condition": "minecraft:all_of",
                                "terms": conds["entity"]
                            }
                        modified = True

        # Recurse values
        for k, v in data.items():
            if isinstance(v, (dict, list)):
                if fix_json_recursively(v, file_path):
                    modified = True
                    
    elif isinstance(data, list):
        for item in data:
            if isinstance(item, (dict, list)):
                if fix_json_recursively(item, file_path):
                    modified = True
                    
    return modified

def process_file(src_path, dest_path):
    if src_path.suffix == ".json":
        try:
            with open(src_path, 'r', encoding='utf-8') as f:
                data = json.load(f)
            
            modified = False
            
            # 2. Standalone predicates where root is a list
            if "predicate" in src_path.parts:
                if isinstance(data, list):
                    if len(data) == 1:
                        data = data[0]
                    else:
                        data = {
                            "condition": "minecraft:all_of",
                            "terms": data
                        }
                    modified = True
            
            if fix_json_recursively(data, str(src_path)):
                modified = True
                
            if modified:
                os.makedirs(dest_path.parent, exist_ok=True)
                with open(dest_path, 'w', encoding='utf-8') as f:
                    json.dump(data, f, indent=4)
                print(f"Fixed JSON: {dest_path}")
                return True
        except Exception as e:
            print(f"Error processing {src_path}: {e}")
            
    elif src_path.suffix == ".mcfunction":
        try:
            with open(src_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            # 3. Replace particle flash without color
            new_content = re.sub(r'\bparticle flash(?!\s*\{)\b', 'particle flash{color:-1}', content)
            
            if new_content != content:
                os.makedirs(dest_path.parent, exist_ok=True)
                with open(dest_path, 'w', encoding='utf-8') as f:
                    f.write(new_content)
                print(f"Fixed MCFUNCTION: {dest_path}")
                return True
        except Exception as e:
            print(f"Error processing {src_path}: {e}")
            
    return False

def main():
    dest_base = Path(DEST_DIR)
    
    for src in SOURCES:
        src_base = Path(src)
        if not src_base.exists():
            continue
            
        for root, _, files in os.walk(src_base):
            for file in files:
                if file.endswith((".json", ".mcfunction")):
                    src_path = Path(root) / file
                    rel_path = src_path.relative_to(src_base)
                    
                    if not rel_path.parts[0] == "data":
                        continue
                        
                    dest_path = dest_base / rel_path
                    process_file(src_path, dest_path)

if __name__ == "__main__":
    main()
