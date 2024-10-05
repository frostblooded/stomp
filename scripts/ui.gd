class_name UI
extends CanvasLayer

@export var space_tutorial_texture: TextureRect

var done_space_tutorial: bool = false

func _enter_tree() -> void:
    space_tutorial_texture.hide()

func try_show_space_tutorial() -> void:
    if !done_space_tutorial:
        space_tutorial_texture.show()

func complete_space_tutorial() -> void:
    done_space_tutorial = true
    space_tutorial_texture.hide()
