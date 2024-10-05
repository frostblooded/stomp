class_name StompLegFallingState
extends State

@export var leg: Leg

func _enter_tree() -> void:
    leg.hide()

func enter(_parent: Node2D) -> void:
    leg.show()

    var tween: Tween = create_tween()
    tween.set_parallel(true)
    tween.tween_property(leg, "position", Vector2.ZERO, 0.4).from(Vector2(300, 150))
    tween.tween_property(leg, "scale", Vector2(1, 1), 0.4).from(Vector2(2, 2))
    await tween.finished

    for area: Area2D in leg.area.get_overlapping_areas():
        var guy: Guy = area.owner as Guy

        if guy:
            guy.queue_free()
