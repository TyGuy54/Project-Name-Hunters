extends State
class_name Player_Gather

@export var entity: CharacterBody2D
@export var sprite: AnimatedSprite2D

var gather_time = 1.0
var timer = 0.0

func enter():
	timer = 0
	#entity.velocity = Vector2.ZERO
	print("Started gathering...")

func physics_update(delta):
	timer += delta
	if timer >= gather_time:
		if entity.current_gatherable and is_instance_valid(entity.current_gatherable):
			entity.current_gatherable.queue_free()
		print("Gathering complete.")
		print("You gathered: " + str(entity.current_gatherable))
		state_transition.emit(self, "idle")
