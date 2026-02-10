extends Node2D

var popUpOpen : bool = false
var allplayersconnected = false
var gameReady = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func becomeHost():
	print("Host Button Pressed")
	%MainMenuHUD.hide()
	MultiplayerManager.becomeHost()
	
func joinHostGame():
	print("Player 2 Button Pressed")
	%MainMenuHUD.hide()
	MultiplayerManager.joinHostGame()
	
func cutscene1():
	print("Starting First Cutscene for P1")
	get_node("/root/Game/Players/1/Cutscenes").play("Cutscene1")
	
