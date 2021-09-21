extends Control

func set_percent_value_int(player,value):
	if player == "Player1":
		$LifebarPlayer1.value = value
	if player == "Player2":
		$LifebarPlayer2.value = value

func _ready():
	pass
	#get_node("/root/Gameplay").connect("score_round_P1",self,"_on_score_to_P1")
