extends StaticBody2D

@export var ui_scene: PackedScene

var player_in_range := false
var pop_up_UI: Control

func _ready():
	pass

func _input(event):
	if player_in_range and event.is_action_pressed("interact"):
		toggle_ui()
		

func toggle_ui():
	if $/root/Game.popUpOpen:
		$/root/Game.popUpOpen = false
		print("Toggle UI Off")
		$/root/Game/MainMenuCamera/Boards.hide()
		$InteractLabel.hide()
	else:
		$/root/Game.popUpOpen = true
		print("Toggle UI On")
		$/root/Game/MainMenuCamera/Boards.show()
		$InteractLabel.show()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		print("Player Entered Interact Area")
		player_in_range = true
		$InteractLabel.show()

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		print("Player Left Interact Area")
		player_in_range = false
		$InteractLabel.hide()
		if $/root/Game.popUpOpen:
			$/root/Game.popUpOpen = false
			print("Left Popup Area")
			$/root/Game/MainMenuCamera/Boards.hide()
