class_name Stomp
extends Node2D

@export var shadow_sprite: Sprite2D
@export var leg: Leg

func _ready() -> void:
    position.x += Globals.get_current_foot_side_spawner_offset()

func can_stomp() -> bool:
    var dialogue_manager: DialogueManger = Helpers.get_dialogue_manager(self)
    return not dialogue_manager.is_showing_dialogue()
