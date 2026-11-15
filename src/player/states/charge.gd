extends PlayerState
@export var timer: Timer;

func enter(previous_state_path: String, data := {}) -> void:
	player.sprite.play("charge")
	timer.start()


func physics_update(delta: float) -> void:
	if Input.is_action_just_pressed("up"): 
		timer.stop()
		finished.emit(JUMP)
	elif Input.is_action_just_pressed("dash"):
		timer.stop()
		finished.emit(DASH)
	elif Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
		timer.stop()
		finished.emit(MOVE)
	elif not Input.is_action_pressed("fire"):
		timer.stop()
		finished.emit(IDLE)

func _on_charge_timer_timeout() -> void:
	finished.emit(FIRE)
