extends Area2D

var HP = 100
var speed = 600

func _process(delta):
	var velocity = Vector2.DOWN * speed
	position += velocity * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_Mob_body_entered(body):
	if not body.is_in_group("PlayerBullet"):
		return
	HP -= body.damage
	body.queue_free()
	if HP <= 0:
		GlobalVar.score+=1
		queue_free()
	pass # Replace with function body.
