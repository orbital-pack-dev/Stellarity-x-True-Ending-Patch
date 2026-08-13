import os
import json
import re
from pathlib import Path

# The source directories to scan
SOURCES = ["tru.e-ending-1.1.4d", "Stellarity-5.5.5"]
DEST_DIR = "Stellarity_Cosmetic_Patch"

def fix_json_recursively(data, file_path):
    modified = False
    
    if isinstance(data, dict):
        # Fix condition -> type
        if "condition" in data:
            data["type"] = data.pop("condition")
            modified = True
            
        # Fix function -> type (only if it looks like a loot function, i.e., starts with minecraft: or is in item_modifier)
        # Advancement rewards use 'function' but they point to a datapack function like "true_ending:boss/..."
        if "function" in data:
            func_val = data["function"]
            is_item_modifier = "item_modifier" in Path(file_path).parts
            is_loot_function = isinstance(func_val, str) and (func_val.startswith("minecraft:") or is_item_modifier)
            
            if is_loot_function:
                data["type"] = data.pop("function")
                modified = True

        # Fix entity_properties inner predicate
        if data.get("type") == "minecraft:entity_properties" and "predicate" in data:
            pred = data["predicate"]
            if isinstance(pred, dict):
                if "type" in pred:
                    pred["minecraft:entity_type"] = pred.pop("type")
                    modified = True
                if "nbt" in pred:
                    pred["minecraft:custom_data"] = pred.pop("nbt")
                    modified = True
                if "equipment" in pred:
                    pred["minecraft:equipment"] = pred.pop("equipment")
                    modified = True
                    
        # Fix advancement triggers with entity arrays
        if "trigger" in data and "conditions" in data:
            conds = data["conditions"]
            if "entity" in conds and isinstance(conds["entity"], list):
                if len(conds["entity"]) == 1:
                    conds["entity"] = conds["entity"][0]
                elif len(conds["entity"]) > 1:
                    conds["entity"] = {
                        "type": "minecraft:all_of",
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
            
            if fix_json_recursively(data, str(src_path)):
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
            
            # Replace particle flash without color
            new_content = re.sub(r'\bparticle flash(?!\{)\b', 'particle flash{color:-1}', content)
            
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
