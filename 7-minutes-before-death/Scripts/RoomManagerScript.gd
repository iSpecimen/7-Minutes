extends Node

@export var RoomTemplates: Array[PackedScene] = []
@export var DebugEnabled: bool = true

# Drag your RoomRoot node into this in the inspector, or use a NodePath.
@export var RoomRootPath: NodePath

var RoomTemplatesArrayIndex := 0
var current_room_instance: Node = null
var CurrentRoom: TileMapLayer = null

func _ready() -> void:
	if RoomTemplates.is_empty():
		push_warning("RoomTemplates is empty.")
		return

	_load_room(RoomTemplatesArrayIndex)

func next_room() -> void:
	if RoomTemplates.is_empty():
		return

	RoomTemplatesArrayIndex += 1
	if RoomTemplatesArrayIndex >= RoomTemplates.size():
		RoomTemplatesArrayIndex = 0 # wrap (or clamp if you prefer)

	_load_room(RoomTemplatesArrayIndex)

func _load_room(index: int) -> void:
	var room_root := get_node(RoomRootPath) as Node
	if room_root == null:
		push_error("RoomRootPath is not set or invalid.")
		return

	# Remove old room instance (if any)
	if current_room_instance != null and is_instance_valid(current_room_instance):
		current_room_instance.queue_free()
		current_room_instance = null
		CurrentRoom = null

	# Instance the new room scene
	var packed := RoomTemplates[index]
	if packed == null:
		push_error("RoomTemplates[%d] is null." % index)
		return

	current_room_instance = packed.instantiate()
	room_root.add_child(current_room_instance)

	# Find a TileMapLayer inside the instanced scene
	# Option A: If you know the exact path, use get_node("TileMapLayer")
	# Option B (more flexible): find the first TileMapLayer anywhere under it
	CurrentRoom = current_room_instance.find_child("TileMapLayer", true, false) as TileMapLayer

	if CurrentRoom == null:
		push_error("No TileMapLayer found in RoomTemplates[%d]." % index)
		return

	if DebugEnabled:
		print("Loaded room index:", index, " instance:", current_room_instance.name, " layer:", CurrentRoom.name)
