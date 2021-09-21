extends Node2D

# Untuk Pick Character
# Ada 2 Scene yaitu, Scene Gameplay dan Scene Pick Chara
# di Scene Gameplay,   Load semua node karakter untuk inisiasi Karakter - karakternya
#                      Buat variable penentu "pick character" untuk mendapatkan info karakter yang dipilih (pickChara1 , pickChara2)
# di Scene Pick Chara, Buat pick chara itu sendiri dan ambil 'variable pickChara' dari scene Gameplay untuk inisiasi variable


var Player1 = load("res://Scene & Script/Player/Player.tscn").instance()
var Player2 = load("res://Scene & Script/Player/Player2.tscn").instance()
var Cam = load("res://Scene & Script/Camera/Cam.tscn").instance()
export var time = 16
var BattleOn

onready var currentWinner = "NoWinner"
onready var TimerGame = $Lifebars_and_Timer/T1/T11/TimerText

func _ready():
	_inisiasiPlayer()
	_inisiasiCamera()
	Cam.add_child(Player1)
	Cam.add_child(Player2)
	add_child(Cam)
	_preBattle()

func _process(delta):
	_inisiasiScore()
	if time < 1 and BattleOn:
		BattleOn = false
		$BattleSceneCanvas/BattleSceneAnnouncement.play("PostBattleScene")
		set_process(false)
	
	if currentWinner !=  "NoWinner":
		BattleOn = false
		$BattleSceneCanvas/BattleSceneAnnouncement.play("PostBattleScene")
		set_process(false)
	
	if BattleOn:
		time -=delta
		
		var secs = fmod(time,60)
		var mins = fmod(time,60*60)/60
		
		var timed_passed = "%02d : %02d" % [mins,secs]
		TimerGame.text = timed_passed

func _inisiasiCamera():
	Cam.name = "Cam"
	Cam.process_mode = 0
	Cam.position.y = -96

func _inisiasiPlayer():
	Player1.name = "Player1"
	Player2.name = "Player2"
	Player1._player1 = Player1
	Player1._player2 = Player2
	Player2._player1 = Player1
	Player2._player2 = Player2

func _inisiasiScore():
	get_node("Lifebars_and_Timer/Lifebar/ScoreP1").text = "Score : " + str(ScorePlayer.Player1)
	get_node("Lifebars_and_Timer/Lifebar/ScoreP2").text = "Score : " + str(ScorePlayer.Player2)

func _preBattle():
	$BgMusic.play()
	$BgMusic.stream_paused = true
	TimerGame.visible = false
	BattleOn = false
	$BattleSceneCanvas/BattleSceneAnnouncement.play("PreBattleScene")
	yield(get_tree().create_timer(7.05), "timeout")
	$BgMusic.stream_paused = false
	TimerGame.visible = true
	BattleOn = true
