class_name StateMachine
extends Node

@export var initial_state: State

@onready var _parent: Node2D = get_parent() as Node2D

var disabled: bool = false

var current_state: State:
	set(val):
		if current_state:
			current_state.exit(_parent)

		current_state = val
		current_state.enter(_parent)

func _ready() -> void:
	assert(initial_state)

	for child: State in get_children():
		child.transitioned.connect(transition)

	current_state = initial_state

func _process(delta: float) -> void:
	if disabled:
		return

	if current_state:
		current_state.state_process(delta, _parent)

func transition(new_state: State) -> void:
	if disabled:
		return

	current_state = new_state
