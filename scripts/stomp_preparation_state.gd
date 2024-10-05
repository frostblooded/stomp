class_name StompPreparationState
extends State

@export var stomp_leg_falling_state: StompLegFallingState

@export var stomp: Stomp
@export var stomp_shadow_sprite: Sprite2D

func _enter_tree() -> void:
    stomp_shadow_sprite.hide()

func enter(_parent: Node2D) -> void:
    stomp_shadow_sprite.show()

    var ui: UI = Helpers.get_ui(self)
    ui.try_show_space_tutorial()

    var spawner_manager: SpawnerManager = Helpers.get_spawner_manager(self)
    var next_guy_spawner: GuySpawner = spawner_manager.get_current_spawner()
    var camera: Camera2D = Helpers.get_camera(self)
    camera.position = next_guy_spawner.global_position
    stomp.position = next_guy_spawner.global_position
    stomp.position.x += 136

func state_process(_delta: float, _parent: Node) -> void:
    var time: float = Time.get_unix_time_from_system()
    stomp_shadow_sprite.offset.x = sin(time) * 30 + 20
    stomp_shadow_sprite.offset.y = cos(time) * 50

    if Input.is_action_just_pressed("stomp"):
        transitioned.emit(stomp_leg_falling_state)

func exit(_parent: Node2D) -> void:
    var ui: UI = Helpers.get_ui(self)
    ui.complete_space_tutorial()
