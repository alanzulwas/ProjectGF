extends Node
onready var selector1 = $S1/Selector
onready var selector2 = $S2/Selector
onready var selector3 = $S3/Selector
#onready var selector4 = $CenterContainer/VBoxContainer/CenterContainer2/Selection/Selection4/S/Selector
#onready var selector5 = $CenterContainer/VBoxContainer/CenterContainer2/Selection/Selection5/S/Selector

var current_selection = 0

func _ready():
	set_current_selection(0)

func _input(event):
	if event.is_action_pressed("ui_right") or event.is_action_pressed("ui_right_P2") :
		$SelectOption.play()
		if current_selection < 2:
			current_selection += 1
			set_current_selection(current_selection)
	
	elif event.is_action_pressed("ui_left") or event.is_action_pressed("ui_left_P2") :
		$SelectOption.play()
		if current_selection > 0:
			current_selection -= 1
			set_current_selection(current_selection)
	
	elif event.is_action_pressed("ui_accept_P1") or event.is_action_pressed("ui_accept_P2"):
		handle_selection(current_selection)
	
	elif event.is_action_pressed("ui_decline_P1") or event.is_action_pressed("ui_decline_P2"):
		$SelectedOption.play()
		yield(get_tree().create_timer(0.4),"timeout")
		self.queue_free()
		if get_tree().change_scene("res://Scene & Script/Pick Character/PickChara.tscn") != OK :
			print ("An unexpected error occured when trying to switch to the Readme scene")

func handle_selection(_current_selection):
	if _current_selection == 0 :
		$SelectedOption.play()
		yield(get_tree().create_timer(0.4),"timeout")
		self.queue_free()
		ScorePlayer.pathMap = "map1"
	elif _current_selection == 1 :
		$SelectedOption.play()
		yield(get_tree().create_timer(0.4),"timeout")
		self.queue_free()
		ScorePlayer.pathMap = "map2"
	elif _current_selection == 2 :
		yield(get_tree().create_timer(0.4),"timeout")
		self.queue_free()
		ScorePlayer.pathMap = "map3"
#	elif _current_selection == 3 :
#		$AnimationPlayer.play("notip")
#	elif _current_selection == 4:
#		yield(get_tree().create_timer(0.3),"timeout")
#		get_tree().quit()
	if get_tree().change_scene("res://Scene & Script/Gameplay/Gameplay.tscn") != OK :
		print ("An unexpected error occured when trying to switch to the Readme scene")


func set_current_selection(_current_selection):
	selector1.text = ""
	selector2.text = ""
	selector3.text = ""
#	selector4.text = ""
#	selector5.text = ""
	if _current_selection == 0:
		selector1.text = ">"
	elif _current_selection == 1:
		selector2.text = ">"
	elif _current_selection == 2:
		selector3.text = ">"
#	elif _current_selection == 3:
#		selector4.text = ">"
#	elif _current_selection == 4:
#		selector5.text = ">"
