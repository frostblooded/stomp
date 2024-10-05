class_name StompPreparationState
extends State

@export var stomp_leg_falling_state: StompLegFallingState

@export var stomp: Stomp
@export var leg: Leg

func _enter_tree() -> void:
    stomp.shadow_sprite.hide()

func enter(_parent: Node2D) -> void:
    stomp.shadow_sprite.show()
    leg.hide()

    var ui: UI = Helpers.get_ui(self)
    ui.try_show_space_tutorial()

    var spawner_manager: SpawnerManager = Helpers.get_spawner_manager(self)
    var next_guy_spawner: GuySpawner = spawner_manager.get_current_spawner()
    var camera: Camera2D = Helpers.get_camera(self)
    camera.position = next_guy_spawner.global_position

    var tween: Tween = create_tween()
    tween.tween_property(stomp, "position", next_guy_spawner.global_position + Vector2(Globals.get_current_foot_side_spawner_offset(), 0), 0.4)

func state_process(_delta: float, _parent: Node) -> void:
    var time: float = Time.get_unix_time_from_system()
    stomp.shadow_sprite.offset.x = sin(time) * 30 + 20
    stomp.shadow_sprite.offset.y = cos(time) * 50

    if Input.is_action_just_pressed("stomp"):
        transitioned.emit(stomp_leg_falling_state)

func exit(_parent: Node2D) -> void:
    var ui: UI = Helpers.get_ui(self)
    ui.complete_space_tutorial()
