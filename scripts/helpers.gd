extends Node

func find_child_global(node: Node, child_name: String) -> Node:
    return node.get_tree().root.find_child(child_name, true, false)

func get_ui(node: Node) -> UI:
    return find_child_global(node, "UI")

func get_camera(node: Node) -> Camera2D:
    return find_child_global(node, "Camera")

func get_camera_rect(node: Node) -> Rect2:
    var camera: Camera2D = Helpers.get_camera(node)
    var viewport_half_size: Vector2 = get_viewport().get_visible_rect().size / 2
    return Rect2(camera.position - viewport_half_size, camera.position + viewport_half_size)
