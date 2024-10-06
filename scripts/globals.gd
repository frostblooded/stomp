extends Node

enum FootSide {
    Left,
    Right
}

var current_foot_side: FootSide = FootSide.Right
const SPAWNER_FOOT_OFFSET: float = 250

func switch_foot_side() -> void:
    match current_foot_side:
        FootSide.Right:
            current_foot_side = FootSide.Left
        _:
            current_foot_side = FootSide.Right

func get_current_foot_side_spawner_offset() -> float:
    match current_foot_side:
        FootSide.Right:
            return SPAWNER_FOOT_OFFSET
        _:
            return -SPAWNER_FOOT_OFFSET

func get_current_foot_side_collision_x_scale() -> float:
    match current_foot_side:
        FootSide.Right:
            return 1
        _:
            return -1

func get_current_foot_fall_offset() -> Vector2:
    var offset: Vector2 = Vector2(400, 150)

    if should_flip_foot_sprite():
        offset.x *= -1
    
    return offset

func should_flip_foot_sprite() -> bool:
    return current_foot_side == FootSide.Left
