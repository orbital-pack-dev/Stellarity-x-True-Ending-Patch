<div align="center">

# Stellarity x True Ending Patch

[![Minecraft](https://img.shields.io/badge/Minecraft-1.21.11%20--%2026.1.2-D47A1E?style=for-the-badge&logo=minecraft&logoColor=D47A1E&labelColor=141419)](https://minecraft.wiki/)
[![Modrinth](https://img.shields.io/badge/Modrinth-Available-00AF5C?style=for-the-badge&logo=modrinth&logoColor=white&labelColor=141419)](https://modrinth.com/datapack/stellarity_x_true_ending_patch)
[![GitHub Stars](https://img.shields.io/github/stars/orbital-pack-dev/Stellarity-x-True-Ending-Patch?style=for-the-badge&logo=github&color=F59E0B&labelColor=141419)](https://github.com/orbital-pack-dev/Stellarity-x-True-Ending-Patch/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-33333E?style=for-the-badge&labelColor=141419)](https://github.com/orbital-pack-dev/Stellarity-x-True-Ending-Patch/blob/main/LICENSE)

**A high-precision compatibility layer unifying the two largest Ender Dragon boss overhauls.**

</div>

---

> [!WARNING]
> **STRICT LOAD ORDER REQUIRED:** This patch modifies internal tick schedules and boss state machines. It **must** load with the highest priority (on top of both original datapacks), otherwise scripts will conflict and break the fight.

> [!IMPORTANT]
> **VERSION SUPPORT:**
>
> * **Below 1.21.11:** **Unsupported.** Commands and datapack schema will fail to parse.
> * **Supported versions:** `1.21.11`, `26.1`, `26.1.1`, `26.1.2`.
> * **Above 1.21.11:** Functionally compatible, though minor snapshot quirks may occur.

---

## Overview

When running **Stellarity** and **True Ending** together out of the box, core boss fight routines collide: invulnerability barriers fail, crystal healing beams break, and dragon hitboxes drift out of sync during phase transitions.

This project synchronizes both mods into a single deterministic state machine, fixes command parsing quirks for server engines (Paper/Purpur), and prevents TPS drops caused by entity selector spam.

---

## Key Fixes & Features

* **Boss Phase Synchronization:** True Ending manages boss attack routines, flight behaviors, and phase progressions while respecting Stellarity's crystal invulnerability shields.
* **Tower & Crystal Mechanics:** Crystal heights are matched to Stellarity's custom obsidian towers, and True Ending's tower guardian phantoms remain active during combat.
* **Hitbox & Beam Alignments:** Fixed crystal healing beams firing off to empty coordinates `(~, 121, ~)` and resolved hitbox desync during flight animations.
* **Server Engine Fixes:** Resolved function parsing and portal generation bugs on modern Paper/Purpur implementations (Moonrise engine).

---

## Available Editions

* **Compatibility Patch (Standard):** Pure inter-mod stability. Merges original features, resolves engine conflicts, and leaves vanilla balance untouched.
* **Mechanics Patch (Hardcore):** All standard fixes plus increased difficulty:
  * Elytra flight disabled inside the arena.
  * Central portal emits dragon breath clouds if the boss drifts away.
  * Weakness I applied to all players.
  * Dragon triggers a Totem of Undying on lethal damage for a final phase push.
  * Selected attacks pull players toward the boss.

---

## Installation

The patch is provided in two convenient formats: **as a datapack (.zip)** and **as a global mod (.jar)** for Mod Loaders.

### 1. Required Dependencies (Install these first)

* **True Ending** (Version 1.1.4d) — *Datapack/Mod and Resource Pack*
* **Stellarity** (Version 5.5.5) — *Datapack/Mod and Resource Pack*

### 2. Installation Methods

**Method A: Dedicated Servers & Mod Loaders (Fabric / Quilt / Forge / NeoForge / Paper / Purpur)**
Download the patch in **.jar** format and place it into your server's (or client's) `mods/` folder.
*Mod loaders and modern server engines will automatically recognize and load it as a global datapack!*

**Method B: Classic Datapack (Vanilla)**
Download the patch in **.zip** format and place it into your world's `datapacks/` folder.

---

## Load Order Guide

To ensure functions override properly, maintain this exact hierarchy:

### Datapack Priority (`/datapack list`)

<img width="404" height="332" alt="image" src="https://github.com/user-attachments/assets/b24c379d-881d-434a-9ca5-0190554ed665" />

1. Stellarity_Compatibility_Patch or Stellarity_Mechanics_Patch — loads last
2. true-ending-1.1.4d
3. Stellarity-5.5.5

### Resource Packs
>
> [!NOTE]
> Enable **ONLY ONE** music resource pack (`True Ending: Ender Dragon Music` **OR** `Stellarity Music Pack`) to prevent audio tracks from overlapping.

---

## Compatibility Matrix

[![Fabric](https://img.shields.io/badge/Fabric-dbb687?style=flat-square&logo=fabric&logoColor=white)](https://fabricmc.net/) [![Quilt](https://img.shields.io/badge/Quilt-8d4be6?style=flat-square&logo=quilt&logoColor=white)](https://quiltmc.org/) [![Forge](https://img.shields.io/badge/Forge-dfa836?style=flat-square&logo=curseforge&logoColor=white)](https://forums.minecraftforge.net/) [![NeoForge](https://img.shields.io/badge/NeoForge-e67e22?style=flat-square&logo=neovim&logoColor=white)](https://neoforged.net/) ![](https://img.shields.io/badge/%7C-555555?style=flat-square) [![Vanilla](https://img.shields.io/badge/Vanilla-2ecc71?style=flat-square&logo=minecraft&logoColor=white)](https://www.minecraft.net/) [![Paper](https://img.shields.io/badge/Paper-e74c3c?style=flat-square&logo=purescript&logoColor=white)](https://papermc.io/) [![Purpur](https://img.shields.io/badge/Purpur-8e44ad?style=flat-square&logo=purpur&logoColor=white)](https://purpurmc.org/)

* **Singleplayer / Mod Loaders:** Fabric, Quilt, Forge, NeoForge (`1.21.11+`).
* **Dedicated Server Software:** Vanilla, Paper, Purpur (`1.21.11+` / `26.1.x`).

---

## Contributing & Bug Reports

Found an issue or want to contribute?

* Open a bug report in [GitHub Issues](https://github.com/orbital-pack-dev/Stellarity-x-True-Ending-Patch/issues).
* Submit improvements through a [Pull Request](https://github.com/orbital-pack-dev/Stellarity-x-True-Ending-Patch/pulls).

---

## Credits

* **Stellarity** — Created by [Kohara](https://modrinth.com/user/kohara).
* **True Ending** — Created by [limesplatus](https://modrinth.com/user/limesplatus).
* **Void7676_** — Patch architecture, synchronization logic, and maintenance.
