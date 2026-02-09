extends StaticBody2D
#extends Item
#class_name huh

@onready var interaction_area = $InteractionArea
@onready var sprite = $Sprite2D
@onready var popUp = $PopUp

@export var flag = 0

#@export var item : Item:
#	set(value):
#		item = value
#		item.node = self
#		#$Sprite2D.texture = value.icon
 
var enabled : bool = false:
	set(value):
		enabled = value
		#$Label.visible = value
		

# Called when the node enters the scene tree for the first time.
func _ready():
	enabled = false
	#name = item.title
	interaction_area.interact = Callable(self, "_read") # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _read():
	print("hello")
	#popUp.visible = true 
	#item.node = self
#	if item:
#		item.activate()
	#ChestManager.open_chest(self)
	await interaction_area.body_exited
#	if item:
#		item.de_activate()
	#popUp.visible = false
	#print("hello")
