class_name GuySpawner
extends Node2D

@export var guy_scene: PackedScene
@export var politician_guy_scene: PackedScene
@export var banker_guy_scene: PackedScene
@export var activist_guy_scene: PackedScene

@export var guys_count_to_spawn: int = 30
@export var politician_guys_count_to_spawn: int = 0
@export var banker_guys_count_to_spawn: int = 0
@export var activist_guys_count_to_spawn: int = 0

@export var stomps_to_advance: int = 1
@export var dialogue: Dialogue
@export var multiple_stomps_dialogue: Dialogue

@onready var spawn_boundaries: Rect2 = Helpers.get_viewport_rect_around(global_position)

func _ready() -> void:
    for i: int in guys_count_to_spawn:
        spawn_guy(guy_scene)

    for i: int in politician_guys_count_to_spawn:
        spawn_guy(politician_guy_scene)

    for i: int in banker_guys_count_to_spawn:
        spawn_guy(banker_guy_scene)

    for i: int in activist_guys_count_to_spawn:
        spawn_guy(activist_guy_scene)
    
func spawn_guy(scene: PackedScene) -> void:
    var new_guy: Guy = scene.instantiate()
    new_guy.global_position.x = randf_range(spawn_boundaries.position.x + 5, spawn_boundaries.end.x - 5)
    new_guy.global_position.y = randf_range(spawn_boundaries.position.y + 5, spawn_boundaries.end.y - 5)
    new_guy.living_zone = spawn_boundaries
    get_tree().root.add_child.call_deferred(new_guy)
