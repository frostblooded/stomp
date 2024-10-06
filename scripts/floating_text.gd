class_name FloatingText
extends Label

func _ready() -> void:
    var tween: Tween = create_tween()
    tween.tween_property(self, "position:y", -150, 1).as_relative()
    tween.tween_callback(queue_free)
