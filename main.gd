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
	
	# Get a randomized spawn point
	var mob_spawn_location = get_node("MobSpawnPath/MobSpawnPosition")
	mob_spawn_location.offset = randi()
	
	mob.position = mob_spawn_location.position
	
	# Add mob to scene
	add_child(mob)
