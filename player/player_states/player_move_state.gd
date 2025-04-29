extends State
class_name Player_Move

@export var entitiy: CharacterBody2D
@export var sprite: AnimatedSprite2D

func enter() -> void:
	print("Entered Move")
	entitiy.speed = entitiy.walk_speed

func physics_update(delta: float) -> void:
	var input_dir = Input.get_vector("left", "right", "up", "down")
	
	if input_dir != Vector2.ZERO:
		entitiy.last_move_dir = input_dir.normalized()
		entitiy.play_movement_animation(entitiy.last_move_dir)
		
		var target_velocity = entitiy.walk_speed * entitiy.last_move_dir
		entitiy.velocity = entitiy.velocity.move_toward(target_velocity, delta * entitiy.accel)
	else:
		entitiy.velocity = entitiy.velocity.move_toward(Vector2.ZERO, delta * entitiy.friction)

	entitiy.move_and_slide()

	if entitiy.velocity.length() == 0:
		state_transition.emit(self, "idle")
