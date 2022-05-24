extends "res://enemy/mob.gd"


func _init():
	speed = 700
	HP = 200
	
func _ready():
	add_to_group("CanShoot")

var bullet_scene = preload("res://bullet/EnemyBullet.tscn") 
func shoot():
	var bullet = bullet_scene.instance()
	bullet.position.x = position.x
	bullet.position.y = position.y
	bullet.speed = 1000
	# Add bullet
	return bullet
