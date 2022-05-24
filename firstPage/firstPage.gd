extends CanvasLayer
signal start_game

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	show_message("Trivial War")

func show_message(text):
	$Message.text = text
	$Message.show()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EasyButton_pressed():
	GlobalVar.Difficulty="easy"
	$EasyButton.hide()
	$NormalButton.hide()
	$HardButton.hide()
	emit_signal("start_game")
	$MessageTimer.start()

func _on_NormalButton_pressed():
	GlobalVar.Difficulty="normal"
	$EasyButton.hide()
	$NormalButton.hide()
	$HardButton.hide()
	emit_signal("start_game")
	$MessageTimer.start()


func _on_HardButton_pressed():
	GlobalVar.Difficulty="hard"
	$EasyButton.hide()
	$NormalButton.hide()
	$HardButton.hide()
	emit_signal("start_game")
	$MessageTimer.start()


func _on_MessageTimer_timeout():
	$Message.hide()


