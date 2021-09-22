extends Control

onready var selector1 = $CenterContainer/VBoxContainer/CenterContainer2/Selection/Selection1/S/Selector
onready var selector2 = $CenterContainer/VBoxContainer/CenterContainer2/Selection/Selection2/S/Selector
onready var selector3 = $CenterContainer/VBoxContainer/CenterContainer2/Selection/Selection3/S/Selector
onready var selector4 = $CenterContainer/VBoxContainer/CenterContainer2/Selection/Selection4/S/Selector
onready var selector5 = $CenterContainer/VBoxContainer/CenterContainer2/Selection/Selection5/S/Selector

var current_selection = 0

func _ready():
	set_current_selection(0)

func _input(event):
	if event.is_action_pressed("ui_down") or event.is_action_pressed("ui_down_P2") :
		$SelectOption.play()
		if current_selection < 4:
			current_selection += 1
			set_current_selection(current_selection)
	
	elif event.is_action_pressed("ui_up") or event.is_action_pressed("ui_up_P2") :
		$SelectOption.play()
		if current_selection > 0:
			current_selection -= 1
			set_current_selection(current_selection)
	
	elif event.is_action_pressed("ui_accept"):
		$SelectedOption.play()
		handle_selection(current_selection)

func handle_selection(_current_selection):
	#var popupNode = load("res://Scene & Script/Menu Game/Pop up Menu/popup.tscn").instance()
	#popupNode.global_position.x = 320
	#popupNode.global_position.y = 192
	if _current_selection == 0 :
		$AnimationPlayer.play("notip")
	elif _current_selection == 1 :
		$AnimationPlayer.play("notip")
	elif _current_selection == 2 :
		$AnimationPlayer.play("notip")
	elif _current_selection == 3 :
		$AnimationPlayer.play("notip")
	elif _current_selection == 4:
		get_tree().quit()


func set_current_selection(_current_selection):
	selector1.text = ""
	selector2.text = ""
	selector3.text = ""
	selector4.text = ""
	selector5.text = ""
	if _current_selection == 0:
		selector1.text = ">"
	elif _current_selection == 1:
		selector2.text = ">"
	elif _current_selection == 2:
		selector3.text = ">"
	elif _current_selection == 3:
		selector4.text = ">"
	elif _current_selection == 4:
		selector5.text = ">"
