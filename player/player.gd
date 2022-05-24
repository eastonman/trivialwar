extends Area2D
signal hit
export var speed = 480
var screen_size
var player_height
var player_width
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	player_height=$Sprite.texture.get_height()
	player_width=$Sprite.texture.get_width()

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
	var bullet = bullet_scene.instance()
	bullet.position.x = position.x
	bullet.position.y = position.y
	bullet.speed = -1000
	# Add bullet
	return bullet
	
