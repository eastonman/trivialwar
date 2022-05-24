extends Node
var Difficulty
var score = 0
var have_boss = 0
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
	var err = _client.connect_to_url(websocket_url)
	if err != OK:
		print("Unable to connect")
		set_process(false)
	
func _connected(proto = ""):
	print("Connected to " + websocket_url)
	send_message("Hello world")

func send_message(message):
	_client.get_peer(1).put_packet(message.to_utf8())
	
func _process(delta):
	_client.poll()
