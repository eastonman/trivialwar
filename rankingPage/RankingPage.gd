extends CanvasLayer
signal restart_game
signal back_home

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	pass
	
func game_over_entrypoint():
	show_message("GAME OVER")

func show_message(text):
	$Message.text = text
	$Message.show()
	



func _on_MessageTimer_timeout():
	$Message.hide()

# MessageTimer is set to oneshot
# means do not need to stop after timeout
func _on_RestartButton_pressed():
	GlobalVar.score = 0
	$RestartButton.hide()
	$HomeButton.hide()
	emit_signal("restart_game")
	$MessageTimer.start()


func _on_HomeButton_pressed():
	GlobalVar.score = 0
	$RestartButton.hide()
	$HomeButton.hide()
	$Message.hide()
	emit_signal("back_home")
	$MessageTimer.start()
