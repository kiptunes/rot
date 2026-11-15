extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.sprite.play("move")
	player.particles.emitting = true

func physics_update(delta: float) -> void:
	var dir_x := Input.get_axis("left", "right")
	player.velocity.x = player.speed * dir_x
	player.velocity.y += player.gravity * delta
	player.flip_sprite()
	player.move_and_slide()

	if not player.is_on_floor():
		finished.emit(FALL)
	elif Input.is_action_just_pressed("up"):
		finished.emit(JUMP)
	elif Input.is_action_just_pressed("dash"):
		finished.emit(DASH)
	elif Input.is_action_just_pressed("fire"):
		finished.emit(CHARGE)
	elif is_equal_approx(dir_x, 0.0):
		finished.emit(IDLE)

func exit() -> void:
	player.particles.emitting=false
