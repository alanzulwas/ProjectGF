extends Control

onready var dialouge = get_node("Dialouge").dialouge
var dialouge_index = 0
var finished
var active

var state = 1
var state_machine
var text = "State 0"

func _ready():
	state_machine = $State.get("parameters/playback")
	$Margin.visible = false
	$MarginChara.visible = false

func _input(event):
	event = event
	if active :
		if Input.is_action_just_pressed("ui_accept"):
			if finished == true:
				load_dialouge()
			else:
				$Margin/Textbox/Tween.stop_all()
				$Margin/Textbox/RichTextLabel.percent_visible = 1
				finished = true

func _finishNode():
	self.queue_free()
	if get_tree().change_scene("res://Scene & Script/Story Level/StoryLevel.tscn") != OK :
		print ("An unexpected error occured when trying to switch to the Readme scene")

func _on_VideoPlayer_finished():
	$Anima.play("Dialouge")
	$VideoPlayer.queue_free()

func load_dialouge():
	if dialouge_index < dialouge.size():
		active = true
		finished = false
		
		$Margin.visible = true
		$MarginChara.visible = true
		$Margin/Textbox/Name.text = dialouge[dialouge_index]["Nama"]
		if dialouge[dialouge_index]["Nama"] == "Ryan":
			$MarginChara/Jaka.modulate = Color(1, 1, 1, 0.5)
			$MarginChara/Ryan.modulate = Color(1, 1, 1, 1)
		elif dialouge[dialouge_index]["Nama"] == "Jaka":
			$MarginChara/Jaka.modulate = Color(1, 1, 1, 1)
			$MarginChara/Ryan.modulate = Color(1, 1, 1, 0.5)
		else:
			$MarginChara/Jaka.modulate = Color(1, 1, 1, 0.5)
			$MarginChara/Ryan.modulate = Color(1, 1, 1, 0.5)
		
		$Margin/Textbox/RichTextLabel.bbcode_text = dialouge[dialouge_index]["Dialog"]
		var textState = "Song" + str(dialouge[dialouge_index]["State"])
		print(textState)
		state_machine.travel(textState)
		
		$Margin/Textbox/RichTextLabel.percent_visible = 0
		$Margin/Textbox/Tween.interpolate_property(
			$Margin/Textbox/RichTextLabel, "percent_visible", 0, 1, 2,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Margin/Textbox/Tween.start()
	else:
		#$Margin/Textbox.visible = false
		active = false
		finished = true
	if dialouge_index < 31:
			dialouge_index += 1
	else :
		active = false
		state_machine.travel("Song6")

func _on_Tween_tween_all_completed():
	finished = true

func _last_dialouge():
	$Margin.visible = true
	$MarginChara.visible = true
	$Margin/Textbox/Name.text = "Jaka & Ryan"
	$MarginChara/Jaka.modulate = Color(1, 1, 1, 1)
	$MarginChara/Ryan.modulate = Color(1, 1, 1, 1)
	$Margin/Textbox/RichTextLabel.bbcode_text = dialouge[32]["Dialog"]
	var textState = "Song" + str(dialouge[dialouge_index]["State"])
	print(textState)
	$Margin/Textbox/RichTextLabel.percent_visible = 0
	$Margin/Textbox/Tween.interpolate_property(
		$Margin/Textbox/RichTextLabel, "percent_visible", 0, 1, 2,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$Margin/Textbox/Tween.start()


func _on_Button_pressed():
	$Notif.visible = false
	$Notif.queue_free()
	$VideoPlayer.paused = false
	pass # Replace with function body.
