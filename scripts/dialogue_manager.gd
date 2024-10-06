class_name DialogueManger
extends Node

@export var dialogue_rect: Control
@export var dialogue_label: Label

var current_dialogue: Dialogue

func _enter_tree() -> void:
    dialogue_rect.hide()

func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("stomp"):
        proceed_dialogue()

func start_dialogue(dialogue: Dialogue) -> void:
    if not dialogue:
        return

    if not dialogue.has_more_lines():
        return

    var ui: UI = Helpers.get_ui(self)
    ui.try_show_space_tutorial()

    current_dialogue = dialogue
    show_current_line()

func show_current_line() -> void:
    dialogue_rect.show()
    dialogue_label.text = current_dialogue.get_current_line()

func proceed_dialogue() -> void:
    if not current_dialogue:
        return

    var ui: UI = Helpers.get_ui(self)
    ui.complete_space_tutorial()

    current_dialogue.advance_lines()

    if not current_dialogue.has_more_lines():
        end_dialogue()
        return

    show_current_line()

func end_dialogue() -> void:
    dialogue_rect.hide()
    current_dialogue = null

func is_showing_dialogue() -> bool:
    return current_dialogue != null
