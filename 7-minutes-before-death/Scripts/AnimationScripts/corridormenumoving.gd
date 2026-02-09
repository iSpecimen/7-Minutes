extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.global_position += Vector2(-64, 32)*0.075
	if self.global_position.x < -1280:
		self.queue_free()
		$"..".blocks+= -1
	pass
