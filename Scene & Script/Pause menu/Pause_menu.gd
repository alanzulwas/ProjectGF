extends Control

onready var selector_1 = $MainMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/SelectOption1/HBoxContainer/Selector
onready var selector_2 = $MainMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/SelectOption2/HBoxContainer/Selector
onready var selector_3 = $MainMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/SelectOption3/HBoxContainer/Selector

var currentPauseMenu
var current_selection = 0
var gamePaused = false

func _ready():
	set_visible(false)
	set_current_selection(0)

func _input(event):
	if get_node("/root/Gameplay").BattleOn :
		if event.is_action_pressed("ui_pause") and currentPauseMenu != "Option":
			$SelectedOption.play()
			set_visible(true)
			get_tree().paused = true
			currentPauseMenu = "Pause"
			gamePaused = true

		if gamePaused and currentPauseMenu == "Pause":
			if event.is_action_pressed("ui_down") or event.is_action_pressed("ui_down_P2") :
				$SelectOption.play()
				if current_selection < 2:
					current_selection += 1
					set_current_selection(current_selection)

			elif event.is_action_pressed("ui_up") or event.is_action_pressed("ui_up_P2") :
				$SelectOption.play()
				if current_selection > 0:
					current_selection -= 1
					set_current_selection(current_selection)

			elif event.is_action_pressed("ui_accept_P1") or event.is_action_pressed("ui_accept_P2"):
				$SelectedOption.play()
				gamePaused = false
				handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0 :
		get_tree().paused = false
		set_visible(false)
		currentPauseMenu = ""
	elif _current_selection == 1:
		$MainMenu.visible = false
		$Option.visible = true
		gamePaused = true
		currentPauseMenu = "Option"
		yield(get_tree().create_timer(0.4),"timeout")
	elif _current_selection == 2:
		ScorePlayer.sceneGameplay = ""
		ScorePlayer.P1_Chara = ""
		ScorePlayer.P2_Chara = ""
		ScorePlayer.Player1 = 0
		ScorePlayer.Player2 = 0
		currentPauseMenu = ""
		yield(get_tree().create_timer(0.4),"timeout")
		get_tree().paused = false
		self.queue_free()
		if get_tree().change_scene("res://Scene & Script/Menu Game/Menu_Game.tscn") != OK :
			print ("An unexpected error occured when trying to switch to the Readme scene")

func set_visible(is_visible):
	$PanelMenu.visible = is_visible
	$MainMenu.visible = is_visible

func set_current_selection(_current_selection):
	selector_1.text = ""
	selector_2.text = ""
	selector_3.text = ""
	if _current_selection == 0:
		selector_1.text = ">"
	elif _current_selection == 1:
		selector_2.text = ">"
	elif _current_selection == 2:
		selector_3.text = ">"

