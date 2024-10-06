class_name Dialogue
extends Resource

@export var lines: Array[String]
var current_line_idx: int = 0

func advance_lines() -> void:
    current_line_idx += 1

func get_current_line() -> String:
    return lines[current_line_idx]

func has_more_lines() -> bool:
    return current_line_idx <= lines.size() - 1
