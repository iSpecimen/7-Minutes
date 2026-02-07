extends StaticBody2D

# Set the interaction_area to be active when the game starts
@onready var interaction_area = $InteractionArea
<<<<<<< Updated upstream
@onready var sprite = $Sprite2D
=======

# The 'Rooms' Node, the main Parent Node
@export var ParentRoom : Node2D
@export var SceneToLoad : PackedScene 

# Variables for Room Start and End Position
@export var NewSceneSpawnPosition : Vector2
@export var NewSceneEndPosition : Vector2
@export var OldSceneEndPosition: Vector2

# Variables for the room to load and free
var RoomToLoadNode : Node2D
var RoomToFree : Node2D

# Function to Initiate a new copy of the room to load
func InstantiateRoom(RoomToLoad : PackedScene):
	# Instantiate a copy of the scene to load
	var NewRoomNode = RoomToLoad.instantiate()
	RoomToLoadNode = NewRoomNode.get_child(1)
	add_child(RoomToLoadNode)
	RoomToLoadNode.position = NewSceneEndPosition

func FreeRoom(RoomToFree : Node2D):
	pass

func TransitionRooms():
	pass
>>>>>>> Stashed changes

# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area.interact = Callable(self, "_read") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _read():
<<<<<<< Updated upstream
	print("hello")
	pass
	#print("hello")
=======
	InstantiateRoom(SceneToLoad)
	print("Room Instantiated!!")
	TransitionRooms()
	print("Rooms Changed!!")
	FreeRoom(RoomToFree)
	print("Old Room Deleted!!")
>>>>>>> Stashed changes
	
