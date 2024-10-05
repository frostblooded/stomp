class_name StateMachine
extends Node

@export var initial_state: State

@onready var _parent: Node2D = get_parent() as Node2D

var disabled: bool = false
var ready_to_process: bool = true
var current_state: State

func _ready() -> void:
	assert(initial_state)

	for child: State in get_children():
		child.transitioned.connect(transition)

	await set_current_state(initial_state)

func _process(delta: float) -> void:
	if disabled:
		return

	if not ready_to_process:
		return

	if current_state:
		current_state.state_process(delta, _parent)

func transition(new_state: State) -> void:
	if disabled:
		return

	await set_current_state(new_state)

func set_current_state(new_state: State) -> void:
	ready_to_process = false

	if current_state:
		await current_state.exit(_parent)

	current_state = new_state
	await current_state.enter(_parent)
	ready_to_process = true
