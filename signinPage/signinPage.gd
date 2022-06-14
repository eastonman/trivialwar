extends CanvasLayer
signal signinConfirm
signal signinBack
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func backend_callback(message: String):
	if message == "passed":
		emit_signal("confirmAccount")
	elif message == "denied":
		print("Login failed")
	else:
		print("ERROR: unexpected")

func _on_ConfirmButton_pressed():
	GlobalVar.userName = $UserName.text
	GlobalVar.passWord = $PassWord.text
	GlobalVar.backend_signup()
	emit_signal("signinConfirm")


func _on_BackButton_pressed():
	emit_signal("signinBack")
