extends CharacterBody2D

var speed = 0
var walk_speed = 100
var run_speed = 150
var accel = 400
var friction = 800

var rolling = false
var roll_timer = 0.0
var roll_speed = 400
var roll_duration = 0.3  # Duration in seconds
var roll_direction = Vector2.ZERO

var stamina = 50
var health = 50

var last_move_dir = Vector2.LEFT

@export var animation: AnimatedSprite2D

func play_idle_animation() -> void:
	var dir = last_move_dir

	if dir.y < 0:
		animation.play("idle_up")
	elif dir.y > 0:
		animation.play("idle_down")
	elif dir.x != 0:
		animation.flip_h = dir.x < 0
		animation.play("idle_side")

func play_movement_animation(dir: Vector2) -> void:
	if dir.y < 0:
		animation.play("walk_up")
	elif dir.y > 0:
		animation.play("walk_down")
	elif dir.x != 0:
		animation.flip_h = dir.x < 0
		animation.play("walk")


#func handle_run():
	#if Input.is_action_pressed('run'):
		#speed = run_speed
	#else:
		#speed = walk_speed
#
#
#func roll(direction: Vector2, delta):
	#if not rolling:
		#rolling = true
		#roll_direction = direction.normalized()
		#roll_timer = roll_duration
		#dodge_roll.play("dodge_roll")
		#
	#velocity = roll_direction * roll_speed
	#roll_timer -= delta
	#if roll_timer <= 0:
		#rolling = false
		#velocity = Vector2.ZERO
