extends Node

export(PackedScene) var mob_scene

func _ready():
	randomize()

func _process(delta):
	$ScoreLabel.text = str(GlobalVar.score)

func new_game():
	# Show palyer
	GlobalVar.score = 0
	$ScoreLabel.show()
	$Player.start($PlayerStartPosition.position)
	$MobTimer.start()
	$BulletTimer.start()
	get_tree().call_group("player_bullets","queue_free")
	get_tree().call_group("mobs","queue_free")
	
func game_over():
	$RankingPage/RestartButton.visible = true
	$RankingPage/HomeButton.visible = true
	$MobTimer.stop()
	$BulletTimer.stop()

# Load elite scene for later instance
var elite_scene = preload("res://enemy/Elite.tscn")
func _on_MobTimer_timeout():
	if randf()>0.8:
		# Create elite
		var elite = elite_scene.instance()
		elite.position.x = rand_range(0, GlobalVar.screen_size.x)
		match GlobalVar.Difficulty:
			"easy":	
				elite.speed = 600
				elite.HP = 200
			"normal":
				elite.speed = 800
				elite.HP = 300
			"difficult":
				elite.speed = 1000
				elite.HP = 400
		# Add elite to scene
		add_child(elite)
	else:
		# Create mob
		var mob = mob_scene.instance()
		
		mob.position.x = rand_range(0, GlobalVar.screen_size.x)
		match GlobalVar.Difficulty:
			"easy":
				mob.speed = 500
				mob.HP = 100
			"normal":
				mob.speed = 700
				mob.HP = 150
			"difficult":
				mob.speed = 900
				mob.HP = 200
		# Add mob to scene
		add_child(mob)


func _on_BulletTimer_timeout():
	var bullet = $Player.shoot()
	add_child(bullet)
	


func back_home():
	$ScoreLabel.hide()
	$FirstPage/EasyButton.show()
	$FirstPage/NormalButton.show()
	$FirstPage/HardButton.show()
	$FirstPage._ready()
