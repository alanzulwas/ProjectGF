extends Node2D

var Jaka = load("res://Scene & Script/Player/Jaka.tscn").instance()
var Ryan = load("res://Scene & Script/Player/Ryan.tscn").instance()
var Player1 = Jaka
var Player2 = Ryan
var Cam = load("res://Scene & Script/Camera/Cam.tscn").instance()
export var time = 16
var BattleOn

onready var currentWinner = "NoWinner"

func _ready():
	_inisiasiPlayer()
	_inisiasiCamera()
	Cam.add_child(Player1)
	Cam.add_child(Player2)
	add_child(Cam)
	_preBattle()

func _process(delta):
	delta = delta
	_inisiasiScore()
	if time < 1 and BattleOn:
		BattleOn = false
		set_process(false)

	if currentWinner !=  "NoWinner":
		BattleOn = false
		set_process(false)

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
	BattleOn = true
