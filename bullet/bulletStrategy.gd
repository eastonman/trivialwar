extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func straightShoot(shootNum,body):
	var bullets = []
	if(body.is_in_group("mobs")):
		var bullet_scene = load("res://bullet/EnemyBullet.tscn") 
		for i in range(shootNum):
			var bullet = bullet_scene.instance()
			bullet.position.x = body.position.x+ (i*2 - shootNum + 1)*100
			bullet.position.y = body.position.y
			bullet.speed = 1000
			bullets.append(bullet)
	else:
		var bullet_scene = load("res://bullet/PlayerBullet.tscn") 
		for i in range(shootNum):
			var bullet = bullet_scene.instance()
			bullet.position.x = body.position.x + (i*2 - shootNum + 1)*100
			bullet.position.y = body.position.y
			bullet.speed = -1000
			bullets.append(bullet)
	return bullets

func multiShoot(shootNum,body):
	var bullets = []
	if(body.is_in_group("mobs")):
		var bullet_scene = load("res://bullet/EnemyBullet.tscn") 
		for i in range(shootNum):
			var bullet = bullet_scene.instance()
			bullet.position.x = body.position.x+ (i*2 - shootNum + 1)*100
			bullet.position.y = body.position.y
			bullet.speed = 1000
			bullets.append(bullet)
	else:
		var bullet_scene = load("res://bullet/PlayerBullet.tscn") 
		for i in range(shootNum):
			var bullet = bullet_scene.instance()
			bullet.position.x = body.position.x+ (i*2 - shootNum + 1)*100
			bullet.position.y = body.position.y
			bullet.speed = -1000
			bullets.append(bullet)
	return bullets
