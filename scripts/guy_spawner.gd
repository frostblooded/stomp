class_name GuySpawner
extends Node

@export var spawn_timer: Timer
@export var guy_scene: PackedScene

var guy_limit: int = 50

func _ready() -> void:
    spawn_timer.start()
    spawn_timer.timeout.connect(spawn)

func spawn() -> void:
    var currently_spawned_guys: int = get_tree().get_nodes_in_group("guys").size()
    if currently_spawned_guys >= guy_limit:
        return

    var camera_rect: Rect2 = Helpers.get_camera_rect(self)
    var new_guy: Node2D = guy_scene.instantiate()
    new_guy.position.x = randf_range(camera_rect.position.x, camera_rect.end.x)
    new_guy.position.y = randf_range(camera_rect.position.y, camera_rect.end.y)
    get_tree().root.add_child(new_guy)
