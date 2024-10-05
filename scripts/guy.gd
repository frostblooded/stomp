class_name Guy
extends Node2D

@export var movement_speed: float = 100.0

var movement: Vector2 = Vector2.ZERO
var living_zone: Rect2

func _ready() -> void:
    var rand_x: float = randf() * 2 - 1
    var rand_y: float = randf() * 2 - 1
    movement = Vector2(rand_x, rand_y).normalized()

func _process(delta: float) -> void:
    if global_position.x <= living_zone.position.x or global_position.x >= living_zone.end.x:
        movement.x *= -1;
    if global_position.y <= living_zone.position.y or global_position.y >= living_zone.end.y:
        movement.y *= -1;

    global_position += movement * delta * movement_speed
