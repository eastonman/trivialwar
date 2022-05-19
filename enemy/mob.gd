extends RigidBody2D


var speed = 500

func _process(delta):
	var velocity = Vector2.DOWN * speed
	position += velocity * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
