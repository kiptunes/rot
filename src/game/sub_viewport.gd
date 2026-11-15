extends Control
@onready var sub_vp = $SubViewport


func _input(event: InputEvent) -> void:
	sub_vp.push_input(event)
