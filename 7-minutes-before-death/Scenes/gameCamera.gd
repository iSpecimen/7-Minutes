extends Camera2D

var targetP 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if targetP:
		self.global_position = get_node("/root/Game/Players/" + str(targetP)).global_position
	pass



	
