class_name Stomp
extends Node2D

@export var shadow_sprite: Sprite2D
@export var leg: Leg

func _ready() -> void:
    position.x += Globals.get_current_foot_side_spawner_offset()
