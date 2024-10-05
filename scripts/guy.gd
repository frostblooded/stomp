class_name Guy
extends Node2D

@export var movement_speed: float = 100.0

var movement: Vector2 = Vector2.ZERO

func _ready() -> void:
    var rand_x: float = randf() * 2 - 1
    var rand_y: float = randf() * 2 - 1
    movement = Vector2(rand_x, rand_y).normalized()

func _process(delta: float) -> void:
    var camera_rect: Rect2 = Helpers.get_camera_rect(self)

    if position.x <= camera_rect.position.x or position.x >= camera_rect.end.x:
        movement.x *= -1;
    if position.y <= camera_rect.position.y or position.y >= camera_rect.end.y:
        movement.y *= -1;

    position += movement * delta * movement_speed
