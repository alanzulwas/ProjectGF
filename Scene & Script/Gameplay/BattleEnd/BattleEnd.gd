extends CanvasLayer

onready var selector_1 = $MainMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/SelectOption1/HBoxContainer/Selector
onready var selector_2 = $MainMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/SelectOption2/HBoxContainer/Selector

var current_selection = 0

func _ready():
	set_current_selection(0) 

func _input(event):
	if event.is_action_pressed("ui_down") or event.is_action_pressed("ui_down_P2") :
		$SelectOption.play()
		if current_selection < 1:
			current_selection += 1
			set_current_selection(current_selection)
	
	elif event.is_action_pressed("ui_up") or event.is_action_pressed("ui_up_P2") :
		$SelectOption.play()
		if current_selection > 0:
			current_selection -= 1
			set_current_selection(current_selection)
	
	elif event.is_action_pressed("ui_accept_P1") or event.is_action_pressed("ui_accept_P2"):
		$SelectedOption.play()
		handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0:
		ScorePlayer.sceneGameplay = ""
		yield(get_tree().create_timer(0.4),"timeout")
		self.queue_free()
		if get_tree().change_scene("res://Scene & Script/Pick Character/PickChara.tscn") != OK :
			print ("An unexpected error occured when trying to switch to the Readme scene")
	if _current_selection == 1:
		ScorePlayer.sceneGameplay = ""
		yield(get_tree().create_timer(0.4),"timeout")
		get_tree().paused = false
		self.queue_free()
		if get_tree().change_scene("res://Scene & Script/Menu Game/Menu_Game.tscn") != OK :
			print ("An unexpected error occured when trying to switch to the Readme scene")

func set_current_selection(_current_selection):
	selector_1.text = ""
	selector_2.text = ""
	if _current_selection == 0:
		selector_1.text = ">"
	elif _current_selection == 1:
		selector_2.text = ">"
