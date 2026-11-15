class_name Player
extends CharacterBody2D

@export var speed : float = 80.0
@export var gravity : float = 540.0
@export var jump_impulse : float = 210.0

@onready var raycast : RayCast2D = $RayCast2D
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var particles : CPUParticles2D = $WalkParticles

func _process(delta: float) -> void:
	if raycast.is_colliding():
		if raycast.get_collider() is TileMapLayer:
			var tilemap: TileMapLayer = raycast.get_collider()
			var cell: Vector2i = tilemap.local_to_map(position+raycast.target_position)
			var data: TileData = tilemap.get_cell_tile_data(cell)
			if data: 
				var infected: bool = data.get_custom_data("infected")
				if not infected:
					infected = true
					tilemap.set_infected_tile(cell)
			
			

func flip_sprite() -> void:
	var noise_margin: float = 0.5
	if roundf(velocity.x) < noise_margin * -1:
		sprite.flip_h = true
	elif roundf(velocity.x) > noise_margin:
		sprite.flip_h = false
