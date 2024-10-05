extends Node

func find_child_global(node: Node, child_name: String) -> Node:
    return node.get_tree().root.find_child(child_name, true, false)

func get_ui(node: Node) -> UI:
    return find_child_global(node, "UI")

func get_camera(node: Node) -> Camera2D:
    return find_child_global(node, "Camera")

func get_spawner_manager(node: Node) -> SpawnerManager:
    return find_child_global(node, "SpawnerManager")

func get_viewport_rect_around(position: Vector2) -> Rect2:
    var viewport_size: Vector2 = get_viewport().get_visible_rect().size
    var viewport_half_size: Vector2 = viewport_size / 2
    return Rect2(position - viewport_half_size, viewport_size)
