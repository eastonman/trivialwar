extends "res://bullet/abstract_bullet.gd"

func _init():
	direction = -1
	
func _ready():
	add_to_group("EnemyBullet")
