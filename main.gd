extends Node

export(PackedScene) var mob_scene

func _ready():
	randomize()
	$FirstPage._ready()

func _process(delta):
	$ScoreLabel.text = "SCORE: "+str(GlobalVar.score)
	$LifeLabel.text = "LIFE: "+str($Player.HP)
	var mob_list = get_tree().get_nodes_in_group("mobs")
	for node in mob_list:
		if(node.HP <=0):
			if(node.is_in_group("boss")):
				$MusicController.bgmPlayCircle()
			var prop = node.getProp()
			if(prop!=null):
				add_child(prop)
			node.queue_free()

func new_game():
	$Player.init()
	$MusicController.bgmPlayCircle()
	#$BgmMusic.play()
	# Show palyer
	GlobalVar.score = 0
	$ScoreLabel.show()
	$LifeLabel.show()
	$Player.start($PlayerStartPosition.position)
	$MobTimer.start()
	$BulletTimer.start()
	get_tree().call_group("player_bullets","queue_free")
	get_tree().call_group("mobs","queue_free")
	get_tree().call_group("props","queue_free")
	
func game_over():
	$MusicController.bgmStop()
	#$BgmMusic.stop()
	$RankingPage/RestartButton.visible = true
	$RankingPage/HomeButton.visible = true
	$MobTimer.stop()
	$BulletTimer.stop()
	get_tree().call_group("boss","queue_free")
	GlobalVar.have_boss = 0

# Load elite scene for later instance
var elite_scene = preload("res://enemy/Elite.tscn")
var boss_scene = preload("res://enemy/Boss.tscn")

func _on_MobTimer_timeout():
	if GlobalVar.have_boss==0 && GlobalVar.score%20<=10 && GlobalVar.score%20>=9:
		GlobalVar.have_boss = 1
		var boss = boss_scene.instance()
		boss.position.x = 0.5*GlobalVar.screen_size.x
		add_child(boss)
		$MusicController.bgmStop()
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
	var can_shoot_list = get_tree().get_nodes_in_group("CanShoot")
	for node in can_shoot_list:
		var bullet = node.shoot()
		add_child(bullet)
	


func back_home():
	$ScoreLabel.hide()
	$LifeLabel.hide()
	$FirstPage/EasyButton.show()
	$FirstPage/NormalButton.show()
	$FirstPage/HardButton.show()
	$FirstPage._ready()
	get_tree().call_group("mobs","queue_free")
