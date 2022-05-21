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

# Load elite scene for later instance
var elite_scene = preload("res://enemy/Elite.tscn")
func _on_MobTimer_timeout():
	if randf()>0.8:
		# Create elite
		var elite = elite_scene.instance()
		elite.position.x = rand_range(0, GlobalVar.screen_size.x)
		# Add elite to scene
		add_child(elite)
	else:
		# Create mob
		var mob = mob_scene.instance()
		
		mob.position.x = rand_range(0, GlobalVar.screen_size.x)
		
		# Add mob to scene
		add_child(mob)
