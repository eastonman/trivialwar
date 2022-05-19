extends Node

var GameLevel = 0 # 0, 1, 2 for easy normal hard

var screen_size

func _ready():
	screen_size = get_viewport().get_visible_rect().size
	print(screen_size)
