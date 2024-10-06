class_name ScoreManager
extends Node

@export var score_label: Label
@export var score: int = 1000

func _ready() -> void:
    update_score_label()

func update_score_label() -> void:
    score_label.text = "Score: " + str(score)

func modify_score(value: int) -> void:
    score += value
    update_score_label()
