extends Control

onready var Character1 = load("res://Scene & Script/Pick Character/CharacterResource/jaka.tres")
onready var Character2 = load("res://Scene & Script/Pick Character/CharacterResource/ryan.tres")
onready var Player1_Character = get_node("Player1_Chara")
onready var Player2_Character = get_node("Player2_Chara")
onready var current_selection1 = 0
onready var current_selection2 = 1
onready var pickedP1 = false
onready var pickedP2 = false
var Player1 = ""
var Player2 = ""

func _ready():
	_set_current_selection("P1",current_selection1)
	_set_current_selection("P2",current_selection2)

func _update_character1(Chara):
	Player1_Character.texture = Chara.gambar
	if Chara.nama != "Ryan":
		Player1_Character.rect_scale.x = -1
		Player1_Character.rect_position.x = 256

func _update_character2(Chara):
	Player2_Character.texture = Chara.gambar
	if Chara.nama == "Ryan":
		Player2_Character.rect_scale.x = -1
		Player2_Character.rect_position.x = 560

func _set_current_selection(P,CuSe):
	if P == "P1":
		if CuSe == 0:
			$SelectorP1.rect_position.x = 176
			_update_character1(Character1)
		elif CuSe == 1:
			$SelectorP1.rect_position.x = 328
			_update_character1(Character2)
	elif P == "P2":
		if CuSe == 0:
			$SelectorP2.rect_position.x = 264
			_update_character2(Character1)
		elif CuSe == 1:
			$SelectorP2.rect_position.x = 416
			_update_character2(Character2)

func _input(event):
	#P1
	if event.is_action_pressed("ui_right") and current_selection1 < 1 and !pickedP1:
		$SelectOption.play()
		current_selection1 += 1
		_set_current_selection("P1",current_selection1)
	elif event.is_action_pressed("ui_left") and current_selection1 > 0 and !pickedP1:
		$SelectOption.play()
		current_selection1 -= 1
		_set_current_selection("P1",current_selection1)
	elif event.is_action_pressed("ui_accept_P1") and !pickedP1:
		$SelectedOption.play()
		_handle_selection("P1",current_selection1)

	#P2
	if event.is_action_pressed("ui_right_P2") and current_selection2 < 1 and !pickedP2:
		$SelectOption.play()
		current_selection2 += 1
		_set_current_selection("P2",current_selection2)
	elif event.is_action_pressed("ui_left_P2") and current_selection2 > 0 and !pickedP2:
		$SelectOption.play()
		current_selection2 -= 1
		_set_current_selection("P2",current_selection2)
	elif event.is_action_pressed("ui_accept_P2") and !pickedP2:
		$SelectedOption.play()
		_handle_selection("P2",current_selection2)

func _handle_selection(P,CuSe):
	if P == "P1":
		if CuSe == 0 and Player2 != "Jaka":
			$Player1_label/Label.text = str(Character1.nama)
			Player1 = str(Character1.nama)
			pickedP1 = true
		elif CuSe == 1 and Player2 != "Ryan":
			$Player1_label/Label.text = str(Character2.nama)
			Player1 = str(Character2.nama)
			pickedP1 = true
	elif P == "P2":
		if CuSe == 0 and Player1 != "Jaka" :
			$Player2_label/Label.text = str(Character1.nama)
			Player2 = str(Character1.nama)
			pickedP2 = true
		elif CuSe == 1 and Player1 != "Ryan":
			$Player2_label/Label.text = str(Character2.nama)
			Player2 = str(Character2.nama)
			pickedP2 = true

	if pickedP1 == true and pickedP2 == true:
		ScorePlayer.P1_Chara = Player1
		ScorePlayer.P2_Chara = Player2
		yield(get_tree().create_timer(0.4),"timeout")
		self.queue_free()
		if get_tree().change_scene("res://Scene & Script/Gameplay/Gameplay.tscn") != OK :
			print ("An unexpected error occured when trying to switch to the Readme scene")
