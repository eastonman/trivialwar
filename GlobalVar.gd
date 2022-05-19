extends Node

var GameLevel = 0 # 0, 1, 2 for easy normal hard

var screen_size

func _ready():
	screen_size = OS.get_screen_size()
	print(screen_size)
