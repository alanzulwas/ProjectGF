extends MarginContainer

onready var selector_1 = $CenterContainer/VBoxContainer/CenterContainer/HBoxContainer3/Selector
onready var selector_2 = $CenterContainer/VBoxContainer/CenterContainer2/HBoxContainer3/Selector
onready var bgmAct = $CenterContainer/VBoxContainer/CenterContainer/HBoxContainer3/OptionName2

var current_selection = 0

func _ready():
	if ScorePlayer.bgm :
			bgmAct.text = "OFF"
	elif !ScorePlayer.bgm :
			bgmAct.text = "ON"
	set_current_selection(0)

func _input(event):
	if get_node("/root/Gameplay/PauseMenu/Pause_menu").currentPauseMenu == "Option":
		if event.is_action_pressed("ui_down") or event.is_action_pressed("ui_down_P2") :
			get_node("/root/Gameplay/PauseMenu/Pause_menu/SelectOption").play()
			if current_selection < 1:
				current_selection += 1
				set_current_selection(current_selection)

		elif event.is_action_pressed("ui_up") or event.is_action_pressed("ui_up_P2") :
			get_node("/root/Gameplay/PauseMenu/Pause_menu/SelectOption").play()
			if current_selection > 0:
				current_selection -= 1
				set_current_selection(current_selection)

		elif event.is_action_pressed("ui_accept_P1") or event.is_action_pressed("ui_accept_P2"):
			get_node("/root/Gameplay/PauseMenu/Pause_menu/SelectedOption").play()
			yield(get_tree().create_timer(0.4),"timeout")
			handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0 :
		if !ScorePlayer.bgm :
			bgmAct.text = "OFF"
			ScorePlayer.bgm = true
		elif ScorePlayer.bgm :
			bgmAct.text = "ON"
			ScorePlayer.bgm = false
	elif _current_selection == 1:
		get_node("/root/Gameplay/PauseMenu/Pause_menu").currentPauseMenu = "Pause"
		get_node("/root/Gameplay/PauseMenu/Pause_menu").gamePaused = true
		get_node("/root/Gameplay/PauseMenu/Pause_menu/MainMenu").visible = true
		get_node("/root/Gameplay/PauseMenu/Pause_menu/Option").visible = false

func set_current_selection(_current_selection):
	selector_1.text = ""
	selector_2.text = ""
	if _current_selection == 0:
		selector_1.text = ">"
	elif _current_selection == 1:
		selector_2.text = ">"
