extends Node
class_name State

signal state_tranition(old_state: State, new_state_name: String)

func enter() -> void:
	pass

func exit():
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(detla: float) -> void:
	pass
