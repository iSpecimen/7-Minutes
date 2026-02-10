extends Node

const SERVER_PORT = 8080
const SERVER_IP = "127.0.0.1"

var multiplayer_scene = preload("res://Scenes/multiplayerInstance.tscn")

var _players_spawn_node
var spawn_point = [Vector2(-62,42), Vector2(20,-10)]

func becomeHost():
	print("Hosting..")
	
	_players_spawn_node = get_tree().get_current_scene().get_node("Players")
	
	
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(SERVER_PORT)
	_add_player_to_game(1)
	multiplayer.multiplayer_peer = server_peer
	
	multiplayer.peer_connected.connect(_add_player_to_game)
	multiplayer.peer_disconnected.connect(_del_player)
	
	
	
func joinHostGame():
	print("Joining as Player 2..")
	var client_peer = ENetMultiplayerPeer.new()
	client_peer.create_client(SERVER_IP, SERVER_PORT)
	
	multiplayer.multiplayer_peer = client_peer
	
	

func _add_player_to_game(id: int):
	print("Player %s joined the game!" % id)
	var targetPlayer = multiplayer_scene.instantiate()
	targetPlayer.player_id = id
	targetPlayer.name = str(id)
	if id == 1:
		targetPlayer.global_position = spawn_point[1]
		get_tree().get_current_scene().get_node("Sprites/Gurney/GurneyP1").frame = 1
	else:
		targetPlayer.global_position = spawn_point[0]
		get_tree().get_current_scene().get_node("Sprites/GuardianP2/guaP2").show()
		print("All Players have joined.")
		$/root/Game.allplayersconnected = true
	
	_players_spawn_node.add_child(targetPlayer, true)
	
func _del_player(id: int):
	print("Player %s left the game!" % id)
	if not _players_spawn_node.has_node(str(id)):
		return
	_players_spawn_node.get_node(str(id)).queue_free()
