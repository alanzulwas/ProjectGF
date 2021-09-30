extends Control

func set_percent_value_int(player,value):
	if player == "Player1":
		$LifebarPlayer1.value = value
	if player == "Player2":
		$LifebarPlayer2.value = value

func set_energy_value_int(player,value):
	if player == "Player1":
		if value == 3 :
			get_node("EnergyBar1/3").visible = true
			get_node("EnergyBar1/2").visible = true
			get_node("EnergyBar1/1").visible = true
		elif value == 2 :
			get_node("EnergyBar1/3").visible = false
			get_node("EnergyBar1/2").visible = true
			get_node("EnergyBar1/1").visible = true
		elif value == 1 :
			get_node("EnergyBar1/3").visible = false
			get_node("EnergyBar1/2").visible = false
			get_node("EnergyBar1/1").visible = true
		elif value == 0 :
			get_node("EnergyBar1/3").visible = false
			get_node("EnergyBar1/2").visible = false
			get_node("EnergyBar1/1").visible = false

	elif player == "Player2":
		if value == 3 :
			get_node("EnergyBar2/3").visible = true
			get_node("EnergyBar2/2").visible = true
			get_node("EnergyBar2/1").visible = true
		elif value == 2 :
			get_node("EnergyBar2/3").visible = false
			get_node("EnergyBar2/2").visible = true
			get_node("EnergyBar2/1").visible = true
		elif value == 1 :
			get_node("EnergyBar2/3").visible = false
			get_node("EnergyBar2/2").visible = false
			get_node("EnergyBar2/1").visible = true
		elif value == 0 :
			get_node("EnergyBar2/3").visible = false
			get_node("EnergyBar2/2").visible = false
			get_node("EnergyBar2/1").visible = false
