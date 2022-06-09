extends CanvasLayer
signal multiPlay
signal singlePlay

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_MultiPlay_pressed():
	emit_signal("multiPlay")
	pass # Replace with function body.


func _on_SinglePlay_pressed():
	emit_signal("singlePlay")
	pass # Replace with function body.
