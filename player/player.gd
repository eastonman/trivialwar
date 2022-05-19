extends Area2D
signal hit
export var speed = 480
var screen_size
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

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
		if (event.position.x<position.x+50&&event.position.x>position.x-50)&&(event.position.y<position.y+50 && event.position.y>position.y-50):
			position=event.position
			if not dragging and event.is_pressed():
				dragging = true
		if dragging and not event.is_pressed():
			dragging = false
	if event is InputEventMouseMotion and dragging:
		position = event.position

func _on_Player_body_entered(body):
	hide()
	print("Player hit")
	emit_signal("hit")
	$CollisionPolygon2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionPolygon2D.disabled = false
