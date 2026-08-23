import os
import zipfile
import json
import shutil

def generate_mod_jsons(patch_name):
    # Determine mod id and name based on patch
    if patch_name == "Stellarity_Compatibility_Patch":
        mod_id = "stellarity_x_true_ending_compatibility_patch"
        mod_name = "Stellarity x True Ending (Compatibility)"
        desc = "Hardcore compatibility patch linking Stellarity and True Ending mechanics. This patch seamlessly integrates features from both mods, ensuring balanced gameplay and cohesive interactions."
    elif patch_name == "Stellarity_Mechanics_Patch":
        mod_id = "stellarity_x_true_ending_mechanics_patch"
        mod_name = "Stellarity x True Ending (Mechanics)"
        desc = "Advanced mechanics patch for Stellarity and True Ending. Enhances combat, logic, and interactions between the End overhaul and the new dragon fight."
    else:
        return None, None, None

    version = "1.0.0"
    author = "Void7676_"
    github_url = "https://github.com/orbital-pack-dev/Stellarity-x-True-Ending-Patch"
    
    # Custom links block
    description_extended = (
        desc
        + "\n\nRequired Dependencies:\n- Stellarity: https://modrinth.com/datapack/stellarity"
        + "\n- True Ending: https://modrinth.com/datapack/true-ending\n\nRecommended Resource Packs:\n- Stellarity RP: https://modrinth.com/resourcepack/stellarity-rp\n- Stellarity Music: https://modrinth.com/resourcepack/stellarity-music\n- Visual Effects Plus: https://modrinth.com/resourcepack/visual-effects-plus"
    )

    fabric_json = {
        "schemaVersion": 1,
        "id": mod_id,
        "version": version,
        "name": mod_name,
        "description": desc,
        "authors": [author],
        "contact": {
            "homepage": github_url,
            "sources": github_url
        },
        "license": "MIT",
        "icon": "pack.png",
        "environment": "*",
        "depends": {
            "stellarity": "*",
            "mr_true_ending": "*"
        },
        "custom": {
            "modmenu": {
                "links": {
                    "modmenu.github": github_url,
                    "Stellarity Mod": "https://modrinth.com/datapack/stellarity",
                    "True Ending Mod": "https://modrinth.com/datapack/true-ending"
                }
            }
        }
    }

    quilt_json = {
        "schema_version": 1,
        "quilt_loader": {
            "group": "ste.patch",
            "id": mod_id,
            "version": version,
            "metadata": {
                "name": mod_name,
                "description": desc,
                "contributors": {
                    author: "Owner"
                },
                "contact": {
                    "homepage": github_url,
                    "sources": github_url
                },
                "icon": "pack.png"
            },
            "intermediate_mappings": "net.fabricmc:intermediary",
            "depends": [
                {
                    "id": "stellarity",
                    "versions": "*"
                },
                {
                    "id": "mr_true_ending",
                    "versions": "*"
                }
            ]
        }
    }

    forge_toml = f"""modLoader = 'lowcodefml'
loaderVersion = '[40,)'
license = 'MIT'
showAsResourcePack = false
issueTrackerURL = '{github_url}/issues'

[[mods]]
modId = '{mod_id}'
version = '{version}'
displayName = '{mod_name}'
displayURL = '{github_url}'
description = '''
{description_extended}
'''
logoFile = 'pack.png'
authors = '{author}'
credits = 'Stellarity by kohara, True Ending by limesplatus'

[[dependencies.{mod_id}]]
modId = "stellarity"
mandatory = true
ordering = "AFTER"
side = "BOTH"

[[dependencies.{mod_id}]]
modId = "mr_limesplatus_ending"
mandatory = true
ordering = "AFTER"
side = "BOTH"
"""

    return json.dumps(fabric_json, indent=2), json.dumps(quilt_json, indent=2), forge_toml


def zip_directory(folder_path, zip_path, add_mod_jsons=False, patch_name=""):
    with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(folder_path):
            for file in files:
                file_path = os.path.join(root, file)
                # Ensure the arcname is relative to the folder_path so that 'data' is at the root of the zip
                arcname = os.path.relpath(file_path, folder_path)
                zipf.write(file_path, arcname)
        
        # Inject fabric, quilt, and forge mod metadata if requested
        if add_mod_jsons:
            fabric_content, quilt_content, forge_toml = generate_mod_jsons(patch_name)
            if fabric_content and quilt_content and forge_toml:
                zipf.writestr("fabric.mod.json", fabric_content)
                zipf.writestr("quilt.mod.json", quilt_content)
                zipf.writestr("META-INF/mods.toml", forge_toml)
                zipf.writestr("META-INF/neoforge.mods.toml", forge_toml)

def main():
    root_dir = os.path.dirname(os.path.abspath(__file__))
    
    # List of directories to zip
    directories_to_zip = [
        "Stellarity-5.5.5",
        "tru.e-ending-1.1.4d",
        "Stellarity_Compatibility_Patch",
        "Stellarity_Mechanics_Patch",
        "Stellarity-5.5.5-RP",
        "Stellarity_Cosmetic_RP"
    ]
    
    output_dir = os.path.join(root_dir, "Release_Builds")
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
        
    for dirname in directories_to_zip:
        dir_path = os.path.join(root_dir, dirname)
        if os.path.exists(dir_path):
            zip_name = dirname
            if dirname == "tru.e-ending-1.1.4d":
                zip_name = "True_Ending-1.1.4d"
                
            # Create .zip (for Datapack users)
            zip_path = os.path.join(output_dir, f"{zip_name}.zip")
            print(f"Zipping {dirname} -> {zip_path}")
            zip_directory(dir_path, zip_path, add_mod_jsons=False)

            # Create .jar (for Fabric/Quilt users) for the patches
            if dirname in ["Stellarity_Compatibility_Patch", "Stellarity_Mechanics_Patch"]:
                jar_path = os.path.join(output_dir, f"{zip_name}.jar")
                print(f"Packaging Mod {dirname} -> {jar_path}")
                zip_directory(dir_path, jar_path, add_mod_jsons=True, patch_name=dirname)
        else:
            print(f"Warning: Directory {dirname} not found at {dir_path}")

    print("Packaging complete. Check the 'Release_Builds' folder.")

if __name__ == "__main__":
    main()
