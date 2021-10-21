extends Node2D

var Jaka = load("res://Scene & Script/Player/Jaka.tscn").instance()
var Ryan = load("res://Scene & Script/Player/Ryan.tscn").instance()
var Player1
var Player2
var Cam = load("res://Scene & Script/Camera/Cam.tscn").instance()
export var time = 16
var BattleOn
var TimeOn
var preBattle

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
	_gameCondition(delta)
	if !preBattle:
		bgm(ScorePlayer.bgm)

func _gameCondition(delta):
	if ScorePlayer.sceneGameplay == "Training":
		$Lifebars_and_Timer/T1/T11/TimerText.visible = false
	else:
		if time < 1 :
			TimeOn = false
			if Player1.HP >= 1 and Player2.HP >= 1 :
				Player1.HP -= 0.1
				Player2.HP -= 0.1
			else:
				BattleOn = false
				$BattleSceneCanvas/BattleSceneAnnouncement.play("PostBattleScene")
				set_process(false)

		if currentWinner !=  "NoWinner":
			BattleOn = false
			$BattleSceneCanvas/BattleSceneAnnouncement.play("PostBattleScene")
			set_process(false)

		if TimeOn:
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
	if ScorePlayer.P1_Chara == "Jaka":
		Player1 = Jaka
	elif ScorePlayer.P1_Chara == "Ryan":
		Player1 = Ryan
	if ScorePlayer.P2_Chara == "Jaka":
		Player2 = Jaka
	elif ScorePlayer.P2_Chara == "Ryan":
		Player2 = Ryan
	Player1.name = "Player1"
	Player2.name = "Player2"
	Player1.get_node("AreaHit").add_to_group("AreaHit_P2")
	Player2.get_node("AreaHit").add_to_group("AreaHit_P1")
	Player1._player1 = Player1
	Player1._player2 = Player2
	Player2._player1 = Player1
	Player2._player2 = Player2

func _inisiasiScore():
	get_node("Lifebars_and_Timer/Lifebar/ScoreP1").text = "Score : " + str(ScorePlayer.Player1)
	get_node("Lifebars_and_Timer/Lifebar/ScoreP2").text = "Score : " + str(ScorePlayer.Player2)

func _preBattle():
	if ScorePlayer.sceneGameplay != "Training":
		$BgMusic.play()
		$BgMusic.stream_paused = true
		preBattle = true
		TimerGame.visible = false
		BattleOn = false
		TimeOn = false
		$BattleSceneCanvas/BattleSceneAnnouncement.play("PreBattleScene")
		yield(get_tree().create_timer(7.05), "timeout")
		$BgMusic.stream_paused = false
		TimerGame.visible = true
		BattleOn = true
		TimeOn = true
		preBattle = false
		if ScorePlayer.bgm:
			$BgMusic.volume_db = 1
	else :
		$BattleSceneCanvas/BattleSceneAnnouncement/Panel.visible = false
		$BgMusic.stream_paused = false
		TimerGame.visible = true
		BattleOn = true
		TimeOn = true

func bgm(activated):
	if activated:
		$BgMusic.stream_paused = true
	elif !activated:
		$BgMusic.stream_paused = false
