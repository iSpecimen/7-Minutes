extends Control

func _input(event):
	if visible and event.is_action_pressed("interact"):
		close()

func close():
	visible = false
	get_tree().paused = false
