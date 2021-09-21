extends Control

#dari Tutorial
# const first_scene = preload("scene")
# dan seterusnya

onready var selector_1 = $MainMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/SelectOption1/HBoxContainer/Selector
onready var selector_2 = $MainMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/SelectOption2/HBoxContainer/Selector
onready var selector_3 = $MainMenu/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/SelectOption3/HBoxContainer/Selector

onready var node_panelMenu = $PanelMenu
onready var node_mainMenu = $MainMenu

var current_selection = 0
var gamePaused = false

func _ready():
	set_visible(false)
	set_current_selection(0)
	#get_node("/root/Gameplay/Sound_and_Bgmusic/Bgmusic").play()

func _input(event):
	if get_node("/root/Gameplay").BattleOn:
		if event.is_action_pressed("ui_pause"):
			$SelectedOption.play()
			set_visible(true)
			get_tree().paused = true
			gamePaused = true

		if gamePaused :
			if event.is_action_pressed("ui_down") or event.is_action_pressed("ui_down_2") :
				$SelectOption.play()
				if current_selection < 2:
					current_selection += 1
					set_current_selection(current_selection)
			
			elif event.is_action_pressed("ui_up") or event.is_action_pressed("ui_up_2") :
				$SelectOption.play()
				if current_selection > 0:
					current_selection -= 1
					set_current_selection(current_selection)
			
			elif event.is_action_pressed("ui_accept"):
				$SelectedOption.play()
				gamePaused = false
				handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0 :
		get_tree().paused = false
		set_visible(false)
	elif _current_selection == 2:
		#get_node("/root/Gameplay").queue_free()
		get_tree().quit()

func set_visible(is_visible):
	$PanelMenu.visible = is_visible
	$MainMenu.visible = is_visible
	pass

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
	pass
