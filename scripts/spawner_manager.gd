class_name SpawnerManager
extends Node2D

var spawners: Array[GuySpawner]
var current_spawner_idx: int = 0
var stomps_at_current_spawner: int = 0

func _enter_tree() -> void:
    for child: Node in get_children():
        if child is GuySpawner:
            spawners.push_back(child as GuySpawner)

func get_current_spawner() -> GuySpawner:
    return spawners[current_spawner_idx]

func advance_spawner() -> void:
    if current_spawner_idx + 1 >= spawners.size():
        return

    current_spawner_idx += 1
    stomps_at_current_spawner = 0

func register_stomp() -> void:
    stomps_at_current_spawner += 1

func can_advance_spawner() -> bool:
    return stomps_at_current_spawner == get_current_spawner().stomps_to_advance

func spawner_should_process(checked_spawner: GuySpawner) -> bool:
    for i: int in spawners.size():
        var spawner: GuySpawner = spawners[i]

        if spawner == checked_spawner:
            return abs(i - current_spawner_idx) <= 1

    return true
