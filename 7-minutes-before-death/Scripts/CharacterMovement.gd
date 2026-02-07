extends CharacterBody2D

@export var speed = 400

func GetInput():
	var InputDirection = Input.get_vector("left", "right", "up", "down")
	velocity = InputDirection * speed

func _physics_process(_delta):
	GetInput()
	move_and_slide()
