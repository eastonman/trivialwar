extends CanvasLayer
signal restart_game

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	show_message("GAME OVER")

func show_message(text):
	$Message.text = text
	$Message.show()
	



func _on_MessageTimer_timeout():
	$Message.hide()

func _on_restartButton_pressed():
	$restartButton.hide()
	emit_signal("restart_game")
	$MessageTimer.start()
