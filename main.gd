extends Node

export(PackedScene) var mob_scene

func _ready():
	randomize()
	

func new_game():
	# Show palyer
	$Player.start($PlayerStartPosition.position)
	$MobTimer.start()
	
func game_over():
	$RankingPage/restartButton.visible = true
	$MobTimer.stop()



func _on_MobTimer_timeout():
	# Create mob
	var mob = mob_scene.instance()
	
	mob.position.x = rand_range(0, GlobalVar.screen_size.y)
	
	# Add mob to scene
	add_child(mob)
