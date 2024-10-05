class_name GuySpawner
extends Node2D

@export var guy_scene: PackedScene
@export var guys_count_to_spawn: int = 30
var spawned_guys: Array[Guy]

func _ready() -> void:
    var spawn_boundaries: Rect2 = Helpers.get_viewport_rect_around(global_position)

    for i: int in guys_count_to_spawn:
        var new_guy: Guy = guy_scene.instantiate()
        new_guy.global_position.x = randf_range(spawn_boundaries.position.x, spawn_boundaries.end.x)
        new_guy.global_position.y = randf_range(spawn_boundaries.position.y, spawn_boundaries.end.y)
        new_guy.living_zone = spawn_boundaries
        get_tree().root.add_child.call_deferred(new_guy)
        spawned_guys.push_back(new_guy)
