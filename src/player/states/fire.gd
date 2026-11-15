extends PlayerState


func enter(previous_state_path: String, data := {}) -> void:
	print("fhj")
	player.sprite.play("fire")
	await player.sprite.animation_finished
	finished.emit(IDLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_process(delta: float) -> void:
	pass
