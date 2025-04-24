extends State
class_name Player_Idle

@export var entitiy: CharacterBody2D
#@export var sprite: AnimatedSprite2D

func enter() -> void:
	entitiy.play_idle_animation()
	
func physics_update(delta) -> void:
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	
	if direction.length() != 0:
		print("Idle -> Move")
		state_tranition.emit(self, 'move')
		
	#if Input.is_action_just_pressed('attack'):
		#pass
