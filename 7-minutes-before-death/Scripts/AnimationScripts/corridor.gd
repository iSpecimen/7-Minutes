extends Node2D

var blocks = 0
var voidblocks = 0
var corridor_block = preload("res://Scenes/corridor_block.tscn")
var void_blocks = preload("res://Scenes/void.tscn")
var P1_Lobby = preload("res://Scenes/p1Lobby.tscn")
var p1level 
var start_block
var void_block_start 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !$CorridorBlock:
		start_block = corridor_block.instantiate()
		start_block.name = "Corridor" + str(blocks)
		self.add_child(start_block)
		blocks+=1
	if !$void:
		void_block_start = void_blocks.instantiate()
		void_block_start.name = "void" + str(blocks)
		self.add_child(void_block_start)
		voidblocks+=1
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if blocks < 2:
		if $/root/Game.allplayersconnected:
			p1level = P1_Lobby.instantiate()
			start_block.global_position = Vector2(64,-32)*19
			$/root/Game/Map/P1Lobby.show()
			blocks = 1000 # Stop spawning new blocks.
			print("Players are Connected and lobby is ready to move.")
			$/root/Game/MainMenuCamera.focusCamera()
			$/root/Game.cutscene1()
			return
		
		start_block = corridor_block.instantiate()
		start_block.name = "Corridor" + str(blocks)
		start_block.global_position = Vector2(64,-32)*20
		self.add_child(start_block)
		blocks+=1
	if voidblocks < 2:
		void_block_start = void_blocks.instantiate()
		void_block_start.name = "Corridor" + str(voidblocks)
		void_block_start.global_position = Vector2(64,-32)*20
		$"/root/Game/MainMenuCamera".add_child(void_block_start)
		voidblocks+=1
	pass
