extends ColorRect

onready var galeri = get_node("/root/Galeri")

onready var selector1 = $Jaka/Selector
onready var selector2 = $Ryan/Selector
onready var selector3 = $Jaka2/Selector
onready var selector4 = $Ryan2/Selector

var current_selection = 0

func _ready():
	set_current_selection(current_selection)

func _input(event):
#	if current_selection != 0 and current_selection != 1:
#		if event.is_action_pressed("ui_up") or event.is_action_pressed("ui_up_P2"):
#			$SelectOption.play()
#			if current_selection == 2:
#				current_selection = 0
#				set_current_selection(current_selection)
#			elif current_selection == 3:
#				current_selection = 1
#				set_current_selection(current_selection)
#	if current_selection != 2 and current_selection != 3:
#		if event.is_action_pressed("ui_down") or event.is_action_pressed("ui_down_P2"):
#			$SelectOption.play()
#			if current_selection == 0:
#				current_selection = 2
#				set_current_selection(current_selection)
#			elif current_selection == 1:
#				current_selection = 3
#				set_current_selection(current_selection)
	if galeri.current_scene == "karakter":
		if current_selection != 0 and current_selection != 2:
			if event.is_action_pressed("ui_left") or event.is_action_pressed("ui_left_P2"):
				$SelectOption.play()
				if current_selection == 1:
					current_selection = 0
					set_current_selection(current_selection)
				elif current_selection == 3:
					current_selection = 2
					set_current_selection(current_selection)
		if current_selection != 1 and current_selection != 3:
			if event.is_action_pressed("ui_right") or event.is_action_pressed("ui_right_P2"):
				$SelectOption.play()
				if current_selection == 0:
					current_selection = 1
					set_current_selection(current_selection)
				elif current_selection == 2:
					current_selection = 3
					set_current_selection(current_selection)

		if event.is_action_pressed("ui_accept_P1") or event.is_action_pressed("ui_accept_P2"):
			$SelectedOption.play()
			_handle_selection(current_selection)

		if event.is_action_pressed("ui_decline_P1") or event.is_action_pressed("ui_decline_P2"):
			$SelectedOption.play()
			yield(get_tree().create_timer(0.4),"timeout")
			galeri.get_node("PanelKarakter").visible = false
			galeri.current_scene = "galeri"

func _handle_selection(_current_selection):
	galeri.current_scene = "karakterInfo"
	if _current_selection == 0:
		galeri.get_node("PanelKarakter_Info").visible = true
		galeri.get_node("PanelKarakter_Info/Jaka").visible = true
	elif _current_selection == 1:
		galeri.get_node("PanelKarakter_Info").visible = true
		galeri.get_node("PanelKarakter_Info/Ryan").visible = true
	elif _current_selection == 2:
		galeri.get_node("PanelKarakter_Info").visible = true
	elif _current_selection == 3:
		galeri.get_node("PanelKarakter_Info").visible = true

func set_current_selection(_current_selection):
	selector1.text = ""
	selector2.text = ""
	selector3.text = ""
	selector4.text = ""
	if _current_selection == 0:
		selector1.text = ">"
	elif _current_selection == 1:
		selector2.text = ">"
	elif _current_selection == 2:
		selector3.text = ">"
	elif _current_selection == 3:
		selector4.text = ">"
