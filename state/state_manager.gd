extends Node
class_name State_Machine

@export var init_state: State

var state: Dictionary = {}
var current_state: State

func _ready() -> void:
	for child in get_children():
		if child is State:
			state[child.name.to_lower()] = child
			child.state_tranition.connect(_on_change_state)
	
	if init_state:
		init_state.enter()
		current_state = init_state

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)
		
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func _on_change_state(old_state: State, new_state_name: String) -> void:
	if old_state != current_state:
		print("invalid state change from: " + old_state.name + "currently in: " + current_state.name)
		return
		
	var new_state = state.get(new_state_name.to_lower())
	if !new_state: 
		print("new state is empty")
		return
		
	if current_state:
		current_state.exit()
	
	new_state.enter()
	
	current_state = new_state
