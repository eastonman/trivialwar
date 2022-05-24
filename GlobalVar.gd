extends Node
var Difficulty
var score = 0
var GameLevel = 0 # 0, 1, 2 for easy normal hard

var screen_size

# The URL we will connect to.
export var websocket_url = "ws://localhost:8080/socket"

# Our WebSocketClient instance.
var _client = WebSocketClient.new()

func _ready():
	screen_size = get_viewport().get_visible_rect().size
	print("Screen size" + str(screen_size))
	
	# Initiate connection to the given URL.
	_client.connect("connection_established", self, "_connected")
	_client.connect("data_received", self, "_on_data_received")
	var err = _client.connect_to_url(websocket_url)
	if err != OK:
		print("Unable to connect")
		set_process(false)
	
func _connected(proto = ""):
	print("Connected to " + websocket_url)
	send_message("Hello world")
	send_message("Random req for JSON")
	
func _on_data_received():
	var data = _client.get_peer(1).get_packet().get_string_from_utf8()
	var leaderboard = get_node("/root/Main/RankingPage/LeaderBoard")
	leaderboard.display(data)
	# Print the received packet, you MUST always use get_peer(1).get_packet
	# to receive data from server, and not get_packet directly when not
	# using the MultiplayerAPI.
	print("Got data from server: ", data)

func send_message(message):
	_client.get_peer(1).put_packet(message.to_utf8())
	
	
	
func _process(delta):
	_client.poll()
	
func _exit_tree():
	_client.disconnect_from_host()
