extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.x = 0.0
	player.sprite.play("idle")

func physics_update(_delta: float) -> void:
	player.velocity.y += player.gravity * _delta
	player.move_and_slide()
	
	if not player.is_on_floor():
		finished.emit(FALL)
	elif Input.is_action_just_pressed("up"):
		finished.emit(JUMP)
	elif Input.is_action_just_pressed("dash"):
		finished.emit(DASH)
	elif Input.is_action_just_pressed("fire"):
		finished.emit(CHARGE)
	elif Input.get_axis("left", "right"):
		finished.emit(MOVE)
