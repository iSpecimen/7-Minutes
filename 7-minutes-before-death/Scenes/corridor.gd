extends Node2D

var blocks = 0
var corridor_block = preload("res://Scenes/corridor_block.tscn")
var start_block

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !$CorridorBlock:
		start_block = corridor_block.instantiate()
		start_block.name = "Corridor" + str(blocks)
		self.add_child(start_block)
		blocks+=1
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if blocks < 2:
		start_block = corridor_block.instantiate()
		start_block.name = "Corridor" + str(blocks)
		start_block.global_position = Vector2(64,-32)*20
		self.add_child(start_block)
		blocks+=1
	pass
