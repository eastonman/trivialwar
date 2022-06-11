extends Node2D

var bossBgmMusic_playing = 0
var bgmMusic_playing = 0
var successMusic_playing = 0	#didn't use
var startOver_playing = 0
var BulletHitMusic_playing = 0	#didn't use

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func bossBgmPlayCircle():
	bossBgmMusic_playing = 1
	$BossBgmMusic.play()
func bossBgmStop():
	bossBgmMusic_playing = 0
	$BossBgmMusic.stop()

func bgmPlayCircle():
	bgmMusic_playing = 1
	$BgmMusic.play()
func bgmStop():
	bgmMusic_playing = 0
	$BgmMusic.stop()

func startOverPlayCircle():
	startOver_playing = 1
	$StartOver.play()
func startOverStop():
	startOver_playing = 0
	$StartOver.stop()

func _on_BgmMusic_finished():
	if(bgmMusic_playing == 1):
		$BgmMusic.play()


func _on_BossBgmMusic_finished():
	if(bossBgmMusic_playing == 1):
		$BossBgmMusic.play()


func _on_StartOver_finished():
	if(startOver_playing == 1):
		$StartOver.play()

func successMusicPlay():
	$SuccessMusic.play()
func successMusicStop():
	$SuccessMusic.stop()

func bulletHitMusicPlay():
	if($BulletHitMusic.is_playing()==false):
		$BulletHitMusic.play()
func bulletHitMusicStop():
	$BulletHitMusic.stop()

func getSupplyMusicPlay():
	if($GetSupplyMusic.is_playing()==false):
		$GetSupplyMusic.play()
func getSupplayMusicStop():
	$GetSupplyMusic.stop()

func _on_FirstPage_startOver_play():
	startOverPlayCircle()


func _on_FirstPage_startOver_stop():
	startOverStop()


func _on_RankingPage_successMusic_Play():
	successMusicPlay()


func _on_RankingPage_successMusic_Stop():
	successMusicStop()


func _on_Player_getSupply():
	getSupplyMusicPlay()
