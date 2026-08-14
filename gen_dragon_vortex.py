import math, os

OUT = "/home/claude/vortex_gen/out"
NS = "stellarity"
FUNC_DIR = f"{OUT}/data/{NS}/function/vfx/dragon_vortex"
os.makedirs(FUNC_DIR, exist_ok=True)

TOTAL_TICKS = 80         # 4 секунды при 20 tps
KEYFRAME_STEP = 4        # обновление геометрии раз в 4 тика (5 кадров/сек хватает, частицы сами доигрывают)
TURNS = 2.5               # оборотов спирали по всей высоте
STRANDS = 3
POINTS_PER_STRAND = 26
HEIGHT = 4.0
BASE_RADIUS = 1.6
ROTATION_PER_TICK = math.radians(14)
OBJ = "stlr.vortex"

def envelope(progress):
    if progress < 0.15:
        e = progress / 0.15
    elif progress > 0.8:
        e = (1.0 - progress) / 0.2
    else:
        e = 1.0
    return max(0.05, min(1.0, e))

frame_ticks = list(range(0, TOTAL_TICKS, KEYFRAME_STEP))

for tick in frame_ticks:
    progress = tick / float(TOTAL_TICKS)
    env = envelope(progress)
    radius = round(BASE_RADIUS * (0.55 + 0.45 * env), 4)
    cur_height = round(HEIGHT * (0.4 + 0.6 * env), 4)
    rotation_offset = tick * ROTATION_PER_TICK
    phase_step = (2 * math.pi) / STRANDS

    lines = [f"# кадр t={tick}  radius={radius}  height={cur_height}  envelope={round(env,3)}"]

    for i in range(POINTS_PER_STRAND):
        p = i / float(POINTS_PER_STRAND)
        y = round(cur_height * p, 4)
        angle = TURNS * 2 * math.pi * p + rotation_offset
        for s in range(STRANDS):
            phase = s * phase_step
            x = round(radius * math.cos(angle + phase), 4)
            z = round(radius * math.sin(angle + phase), 4)
            lines.append(f"particle minecraft:dragon_breath ~{x} ~{y} ~{z} 0 0 0 0 1 normal")

    for i in range(0, POINTS_PER_STRAND, 3):
        p = i / float(POINTS_PER_STRAND)
        y = round(cur_height * p + 0.3, 4)
        lines.append(f"particle minecraft:end_rod ~ ~{y} ~ 0.05 0.05 0.05 0.005 1 normal")

    if tick % 16 == 0 and tick > 0:
        shimmer_y = round(cur_height * 0.6, 4)
        lines.append(f"particle minecraft:enchanted_hit ~ ~{shimmer_y} ~ 0.4 0.4 0.4 0 5 normal")

    if tick == frame_ticks[-1]:
        lines.append("particle minecraft:end_rod ~ ~2.2 ~ 0.6 0.6 0.6 0.02 20 normal")
        lines.append("particle minecraft:dragon_breath ~ ~1.0 ~ 0.8 0.3 0.8 0.01 15 normal")
        lines.append("particle minecraft:enchanted_hit ~ ~1.5 ~ 0.5 0.5 0.5 0 10 normal")

    with open(f"{FUNC_DIR}/frame_{tick}.mcfunction", "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

# tick.mcfunction — диспетчер
tick_lines = [
    "# диспетчер: раз в 4 тика вызывает нужный frame_N, всего 80 тиков (4 сек)",
]
for tick in frame_ticks:
    tick_lines.append(f"execute if score #t {OBJ} matches {tick} run function {NS}:vfx/dragon_vortex/frame_{tick}")
tick_lines.append(f"scoreboard players add #t {OBJ} 1")
tick_lines.append(f"execute if score #t {OBJ} matches ..{TOTAL_TICKS - 1} run schedule function {NS}:vfx/dragon_vortex/tick 1t")
tick_lines.append(f"execute if score #t {OBJ} matches {TOTAL_TICKS}.. run scoreboard players reset #t {OBJ}")

with open(f"{FUNC_DIR}/tick.mcfunction", "w", encoding="utf-8") as f:
    f.write("\n".join(tick_lines) + "\n")

# start.mcfunction
start_lines = [
    f"scoreboard objectives add {OBJ} dummy",
    f"scoreboard players set #t {OBJ} 0",
    f"function {NS}:vfx/dragon_vortex/tick",
]
with open(f"{FUNC_DIR}/start.mcfunction", "w", encoding="utf-8") as f:
    f.write("\n".join(start_lines) + "\n")

# stop.mcfunction — на случай если нужно оборвать эффект досрочно (сброс диспетчера)
stop_lines = [
    f"scoreboard players reset #t {OBJ}",
]
with open(f"{FUNC_DIR}/stop.mcfunction", "w", encoding="utf-8") as f:
    f.write("\n".join(stop_lines) + "\n")

print("frames:", len(frame_ticks))
print("lines per typical frame:", len(open(f"{FUNC_DIR}/frame_{frame_ticks[5]}.mcfunction").readlines()))
print("total particle-lines across all frames:",
      sum(len(open(f"{FUNC_DIR}/frame_{t}.mcfunction").readlines()) - 1 for t in frame_ticks))
