extends Node

# Array of room tilemaps.
@export var RoomTemplates : Array[PackedScene] = []

# Definitions for the current room, and the room to change to
@export var CurrentRoom : TileMapLayer
@export var NewRoom: TileMapLayer

# Boolean definitions for TESTING
@export var DebugEnabled : bool = true

# Definitions for the start and end positions of the animation
var StartPosition = Vector2(0,0)
var EndPosition = Vector2(0,0)

# Current Index of the RoomTemplates array
var RoomTemplatesArrayIndex = 0

# Function for loading new scene
func LoadRooms(RoomIndex: int) -> void:
	print("Loading Room...")
	
	# Instantiate a new Room, and find its Tilemap
	var NewRoom = RoomTemplates[RoomIndex].instantiate()
	var NewTileMap = NewRoom.find_child("TileMapLayer")
	
	
	print("Room Instantiated Correctly.\n Current Room is:{RoomTemplates[RoomIndex]}\n Current Room Index:{RoomIndex}")

	#
	pass

func ChangeRoom() -> void:
	if Input.is_action_pressed("change_room_debug"):
		print("Changing Room")
		
	pass

# Function for moving new scene onto old scene
func MoveScenes() -> void:
	pass

# Function for de-loading old scene
func DeleteScene() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
