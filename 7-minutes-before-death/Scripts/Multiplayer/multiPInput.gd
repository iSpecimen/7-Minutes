extends MultiplayerSynchronizer

var x_input_direction 
var y_input_direction 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if get_multiplayer_authority() != multiplayer.get_unique_id():
		set_process(false)
		set_physics_process(false)
		
	x_input_direction = Input.get_axis("Left", "Right")
	y_input_direction = Input.get_axis("Up", "Down")
	
	
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if $/root/Game.gameReady:
		x_input_direction = Input.get_axis("Left", "Right")
		y_input_direction = Input.get_axis("Up", "Down")
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
