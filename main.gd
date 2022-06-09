extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var main_game_scene = preload("res://MainGame.tscn")
func _on_ChoosePVP_multiPlay():
	GlobalVar.is_multiplayer_mode = true
	var mainGame = main_game_scene.instance()
	add_child(mainGame)
	remove_child($ChoosePVP)
	pass # Replace with function body.


func _on_ChoosePVP_singlePlay():
	GlobalVar.is_multiplayer_mode = false
	var mainGame = main_game_scene.instance()
	add_child(mainGame)
	remove_child($ChoosePVP)
	pass # Replace with function body.
