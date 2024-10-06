class_name StompPreparationState
extends State

@export var stomp_leg_falling_state: StompLegFallingState

@export var stomp: Stomp

var initial_stomp_position: Vector2

func _enter_tree() -> void:
    stomp.shadow_sprite.hide()

func enter(_parent: Node2D) -> void:
    stomp.shadow_sprite.show()

    var ui: UI = Helpers.get_ui(self)
    ui.try_show_space_tutorial()

    var spawner_manager: SpawnerManager = Helpers.get_spawner_manager(self)
    var current_spawner: GuySpawner = spawner_manager.get_current_spawner()
    initial_stomp_position = current_spawner.global_position + Vector2(Globals.get_current_foot_side_spawner_offset(), 0)

    var dialogue_manager: DialogueManger = Helpers.get_dialogue_manager(self)
    dialogue_manager.start_dialogue(current_spawner.dialogue)

func state_process(_delta: float, _parent: Node) -> void:
    var time: float = Time.get_unix_time_from_system()
    stomp.position.x = initial_stomp_position.x + sin(time) * 30
    stomp.position.y = initial_stomp_position.y + cos(time) * 50

    if Input.is_action_just_pressed("stomp"):
        if stomp.can_stomp():
            transitioned.emit(stomp_leg_falling_state)

func exit(_parent: Node2D) -> void:
    var ui: UI = Helpers.get_ui(self)
    ui.complete_space_tutorial()
