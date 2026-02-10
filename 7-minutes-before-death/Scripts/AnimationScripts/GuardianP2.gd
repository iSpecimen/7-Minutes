extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.play()
	self.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if $/root/Game.gameReady and get_multiplayer_authority() != multiplayer.get_unique_id():
	#if $/root/Game.gameReady:
		#$"..".global_position = get_node("/root/Game/Players/" + str(get_multiplayer_authority())).global_position
	pass
