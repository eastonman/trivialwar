extends "res://enemy//mob.gd"

var x_range=0.8

func _init():
	speed = 10
	HP = 1000

func _process(delta):
	if position.x<=0.5*(1-x_range)*get_viewport_rect().size.x||position.x>=0.5*(1+x_range)*get_viewport_rect().size.x:
		speed=-speed
	var velocity = Vector2.RIGHT * speed
	position += velocity * delta


func _on_Boss_body_entered(body):
	._on_Mob_body_entered(body)
	if HP <= 0:
		$BossBgmMusic.stop()
		GlobalVar.have_boss = 0
