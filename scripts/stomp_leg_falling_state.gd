class_name StompLegFallingState
extends State

@export var stomp: Stomp
@export var leg: Leg
@export var leg_fall_audio_player: AudioStreamPlayer2D

@export var stomp_preparation_state: StompPreparationState

func _enter_tree() -> void:
    leg.hide()

func enter(_parent: Node2D) -> void:
    leg.show()

    var leg_fall_tween: Tween = create_tween()
    leg_fall_tween.set_parallel(true)
    leg_fall_tween.tween_property(leg, "position", Vector2.ZERO, 0.6).from(Globals.get_current_foot_fall_offset())
    leg_fall_tween.tween_property(leg, "scale", Vector2(1, 1), 0.6).from(Vector2(4, 4))
    await leg_fall_tween.finished

    for area: Area2D in leg.area.get_overlapping_areas():
        var guy: Guy = area.owner as Guy

        if guy:
            guy.die()
    
    Helpers.create_camera_shake_tween(1, 10)
    leg_fall_audio_player.play()

    await get_tree().create_timer(1).timeout

    var spawner_manager: SpawnerManager = Helpers.get_spawner_manager(self)
    spawner_manager.advance_spawner()
    var next_guy_spawner: GuySpawner = spawner_manager.get_current_spawner()

    Globals.switch_foot_side()
    stomp.shadow_sprite.flip_h = Globals.should_flip_foot_sprite()
    stomp.leg.sprite.flip_h = Globals.should_flip_foot_sprite()

    var camera: Camera2D = Helpers.get_camera()
    camera.position = next_guy_spawner.global_position

    stomp.leg.hide()

    var leg_move_tween: Tween = create_tween()
    leg_move_tween.tween_property(stomp, "position", next_guy_spawner.global_position + Vector2(Globals.get_current_foot_side_spawner_offset(), 0), 0.4)
    await leg_move_tween.finished

    transitioned.emit(stomp_preparation_state)
