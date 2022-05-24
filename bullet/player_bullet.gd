extends Node2D

var speed = 0
var damage = 50


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	var velocity = Vector2.UP * abs(speed)
	position += velocity * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

