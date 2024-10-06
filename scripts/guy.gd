class_name Guy
extends Node2D

@export var movement_speed: float = 100.0
@export var death_particles: CPUParticles2D
@export var sprite: Sprite2D
@export var death_splatter_scene: PackedScene
@export var death_audio_player: AudioStreamPlayer2D
@export var death_score_modification: int = -10

var movement: Vector2 = Vector2.ZERO
var living_zone: Rect2

func _ready() -> void:
    var rand_x: float = randf_range(-0.95, 0.95)
    var rand_y: float = randf_range(-0.95, 0.95)
    movement = Vector2(rand_x, rand_y).normalized()

func _process(delta: float) -> void:
    if global_position.x <= living_zone.position.x and movement.x <= 0:
        movement.x *= -1
    if global_position.x >= living_zone.end.x and movement.x >= 0:
        movement.x *= -1

    if global_position.y <= living_zone.position.y and movement.y <= 0:
        movement.y *= -1
    if global_position.y >= living_zone.end.y and movement.y >= 0:
        movement.y *= -1

    global_position += movement * delta * movement_speed
    sprite.flip_h = movement.x <= 0

func die() -> void:
    sprite.hide()

    var score_manager: ScoreManager = Helpers.get_score_manager(self)
    score_manager.modify_score(death_score_modification)

    death_audio_player.pitch_scale = randf_range(0.8, 1.2)
    death_audio_player.play()

    var new_splatter: Sprite2D = death_splatter_scene.instantiate()
    new_splatter.position = position
    new_splatter.rotation = randf_range(0, 2 * PI)
    get_tree().root.add_child(new_splatter)

    death_particles.emitting = true
    await death_particles.finished

    await death_audio_player.finished
    queue_free()
