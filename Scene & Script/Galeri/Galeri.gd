extends Control

onready var selector1 = $MarginContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector2 = $MarginContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector

var current_selection = 0
var current_scene = ""

func _ready():
	current_scene = "galeri"
	set_current_selection(0)
	$PanelCredit.visible = false
	$PanelKarakter.visible = false
	$PanelKarakter_Info.visible = false

func _input(event):
	if current_scene == "galeri":
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
			_handle_selection(current_selection)
		elif event.is_action_pressed("ui_decline_P1") or event.is_action_pressed("ui_decline_P2"):
			$SelectedOption.play()
			yield(get_tree().create_timer(0.4),"timeout")
			self.queue_free()
			if get_tree().change_scene("res://Scene & Script/Menu Game/Menu_Game.tscn") != OK :
				print ("An unexpected error occured when trying to switch to the Readme scene")

func _handle_selection(_current_selection):
	if _current_selection == 0 :
		current_scene = "credit"
		yield(get_tree().create_timer(0.4),"timeout")
		$PanelCredit.visible = true
	if _current_selection == 1 :
		current_scene = "karakter"
		yield(get_tree().create_timer(0.4),"timeout")
		$PanelKarakter.visible = true

func set_current_selection(_current_selection):
	selector1.text = ""
	selector2.text = ""
	if _current_selection == 0:
		selector1.text = ">"
	elif _current_selection == 1:
		selector2.text = ">"
	pass
