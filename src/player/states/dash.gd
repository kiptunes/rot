extends PlayerState

@export var dash_timer: Timer;

func enter(previous_state_path: String, data := {}) -> void:
	var dir_x : float = -1 if player.sprite.flip_h else 1
	var multiplier: float = 1.8;
	player.sprite.play("dash")
	dash_timer.start()
	player.velocity.x = player.speed * dir_x * multiplier
	player.velocity.y = 0;


func physics_update(delta: float) -> void:
	player.flip_sprite()
	player.move_and_slide()



func _on_dash_timer_timeout() -> void:
	if player.is_on_floor():
		finished.emit(FALL)
	elif Input.get_axis("left", "right"):
		finished.emit(MOVE)
	else: 
		finished.emit(IDLE)
