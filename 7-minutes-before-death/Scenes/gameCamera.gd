extends Camera2D

var targetP 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_multiplayer_authority() != multiplayer.get_unique_id():
		if targetP:
			self.global_position = get_node("/root/Game/Players/" + str(targetP)).global_position
			
			
			
			
	elif targetP:
		self.global_position = get_node("/root/Game/Players/1").global_position
	pass

func focusCamera() -> void:
	targetP = multiplayer.get_unique_id()
	print("Set Target to %s" % str(targetP))

	
