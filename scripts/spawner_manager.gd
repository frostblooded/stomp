class_name SpawnerManager
extends Node2D

var spawners: Array[GuySpawner]
var current_spawner_idx: int = 0

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
