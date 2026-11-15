extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.y = -player.jump_impulse
	player.sprite.play("jump")

func physics_update(delta: float) -> void:
	var dir_x := Input.get_axis("left", "right")
	player.velocity.x = player.speed * dir_x
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	player.flip_sprite()

	if player.velocity.y >= 0:
		finished.emit(FALL)
	elif Input.is_action_just_pressed("dash"):
		finished.emit(DASH)
