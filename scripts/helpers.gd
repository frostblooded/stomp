extends Node

func find_child_global(node: Node, child_name: String) -> Node:
    return node.get_tree().root.find_child(child_name, true, false)

func get_ui(node: Node) -> UI:
    return find_child_global(node, "UI")

func get_camera() -> Camera2D:
    return get_viewport().get_camera_2d()

func get_spawner_manager(node: Node) -> SpawnerManager:
    return find_child_global(node, "SpawnerManager")

func get_dialogue_manager(node: Node) -> DialogueManger:
    return find_child_global(node, "DialogueManager")

func get_score_manager(node: Node) -> ScoreManager:
    return find_child_global(node, "ScoreManager")

func get_viewport_rect_around(position: Vector2) -> Rect2:
    var viewport_size: Vector2 = get_viewport().get_visible_rect().size
    var viewport_half_size: Vector2 = viewport_size / 2
    return Rect2(position - viewport_half_size, viewport_size)

func play_camera_shake(intensity: float, camera: Camera2D) -> void:
    var noise: FastNoiseLite = FastNoiseLite.new()
    var cameraOffset: float = noise.get_noise_1d(Time.get_ticks_msec()) * intensity
    camera.offset = Vector2(cameraOffset, cameraOffset)

func create_camera_shake_tween(duration: float, intensity: float) -> Tween:
    var tween: Tween = create_tween()
    var camera: Camera2D = get_viewport().get_camera_2d()
    tween.tween_method(Helpers.play_camera_shake.bind(camera), intensity, 1, duration)
    return tween
