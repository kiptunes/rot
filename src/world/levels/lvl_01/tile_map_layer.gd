extends TileMapLayer

@onready var sprites: Node2D = $Sprites
var infected_sprite = preload("res://src/entities/infected/infectedSprite.tscn")

func set_infected_tile(coords: Vector2i):
	var new_tile = infected_sprite.instantiate()
	sprites.add_child(new_tile)
	new_tile.position = map_to_local(coords)
