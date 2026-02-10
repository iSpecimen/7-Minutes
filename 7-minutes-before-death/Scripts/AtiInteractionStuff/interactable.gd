extends Node2D

@export var ui_scene: PackedScene

var player_in_range := false
var ui_instance: Control

func _ready():
	if ui_scene:
		ui_instance = ui_scene.instantiate()
		get_tree().root.add_child(ui_instance)
		ui_instance.visible = false

func _input(event):
	if player_in_range and event.is_action_pressed("interact"):
		toggle_ui()

func toggle_ui():
	if not ui_instance:
		return

	ui_instance.visible = !ui_instance.visible
	get_tree().paused = ui_instance.visible

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		print("Player Entered Interact Area")
		player_in_range = true
		$InteractUITest.visible = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		print("Player Left Interact Area")
		player_in_range = false
		$InteractUITest.visible = false
