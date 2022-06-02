extends Area2D
signal hit
signal getSupply
export var speed = 480
var shootNum = 1
var screen_size
var player_height
var player_width
var HP = 2000
const HPMax = 2000
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func init():
	HP = HPMax

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	player_height=$Sprite.texture.get_height()
	player_width=$Sprite.texture.get_width()
	add_to_group("CanShoot")

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	if velocity.length() > 0 :
		velocity = velocity.normalized()*speed
	
	position += velocity * delta
	position.x = clamp(position.x, 0 , screen_size.x)
	position.y = clamp(position.y, 0 , screen_size.y)

var dragging = false
func _input(event):
	
	if event is InputEventMouseButton  and event.button_index == BUTTON_LEFT :
		if (event.position.x<position.x+0.75*player_width&&event.position.x>position.x-0.75*player_width)&&(event.position.y<position.y+0.75*player_height && event.position.y>position.y-0.75*player_height):
			position=event.position
			if not dragging and event.is_pressed():
				dragging = true
		if dragging and not event.is_pressed():
			dragging = false
	if event is InputEventMouseMotion and dragging:
		position = event.position

func _on_Player_hit(body):
	hide()
	print("Player hit")
	emit_signal("hit")
	$CollisionPolygon2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionPolygon2D.disabled = false

var bullet_scene = preload("res://bullet/PlayerBullet.tscn") 
func shoot():
#	var bullet = bullet_scene.instance()
#	bullet.position.x = position.x
#	bullet.position.y = position.y
#	bullet.speed = -1000
#	# Add bullet
#	return [bullet]
	return $BulletStrategy.straightShoot(shootNum,self)


func _on_Player_body_entered(body):
	if  body.is_in_group("PlayerBullet"):
		return
	elif(body.is_in_group("EnemyBullet")):
		HP -= body.damage
		body.queue_free()
	elif(body.is_in_group("props")):
		emit_signal("getSupply")
		if(body.is_in_group("blood")):
			if(HP+body.HP > HPMax):
				 HP = HPMax
			else:
				HP = HP+body.HP
			print("get blood props!\n")
			body.queue_free()
		elif(body.is_in_group("bullet")):
			print("get bullet props!\n")
			body.queue_free()
		elif(body.is_in_group("bomb")):
			print("get bomb props!\n")
			body.queue_free()
			get_tree().call_group("mobs","queue_free")
			get_tree().call_group("player_bullets","queue_free")
	if HP <= 0:
		hide()
		emit_signal("hit")
		$CollisionPolygon2D.set_deferred("disabled", true)
	pass # Replace with function body.
