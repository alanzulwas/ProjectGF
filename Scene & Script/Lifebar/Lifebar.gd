extends Control

func set_percent_value_int(player,value):
	if player == "Player1":
		$LifebarPlayer1.value = value
	if player == "Player2":
		$LifebarPlayer2.value = value
