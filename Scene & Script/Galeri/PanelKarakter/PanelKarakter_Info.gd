extends ColorRect

onready var galeri = get_node("/root/Galeri")

func _input(event):
	if galeri.current_scene == "karakterInfo":
		if event.is_action_pressed("ui_decline_P1") or event.is_action_pressed("ui_decline_P2"):
			$SelectedOption.play()
			yield(get_tree().create_timer(0.4),"timeout")
			galeri.get_node("PanelKarakter_Info").visible = false
			galeri.current_scene = "karakter"
			$Jaka.visible = false
			$Ryan.visible = false
