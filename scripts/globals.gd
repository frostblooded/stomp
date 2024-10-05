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
