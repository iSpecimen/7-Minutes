extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var x_direction

@export var player_id := 1:
	set(id):
		player_id = id
		%InputSynchronizer.set_multiplayer_authority(id)
		add_to_group("player")

func _ready():
	#self.hide()
	pass
	
func _apply_animation(delta):
	return

func _apply_movement_input(delta):
	x_direction = %InputSynchronizer.x_input_direction
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var y_direction = %InputSynchronizer.y_input_direction
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	return

func _physics_process(delta: float) -> void:
	if multiplayer.is_server():
		_apply_movement_input(delta)
	move_and_slide()
	if self.name.length() > 1:
		get_node("/root/Game/Sprites/GuardianP2").global_position = self.global_position
		
		
		
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	# move_and_slide()
