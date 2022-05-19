extends Node

export(PackedScene) var mob_scene

func _ready():
	randomize()
	# Debug tesing purpose
	new_game()

func new_game():
	$MobTimer.start()
	
func game_over():
	$MobTimer.stop()



func _on_MobTimer_timeout():
	# Create mob
	var mob = mob_scene.instance()
	
	mob.position.x = rand_range(0, GlobalVar.screen_size.x)
	
	# Add mob to scene
	add_child(mob)
