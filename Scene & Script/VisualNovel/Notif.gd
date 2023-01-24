extends MarginContainer

func _input(event):
	event = event
	if Input.is_key_pressed(KEY_ENTER):
		$".".visible = false
		$".".queue_free()
		get_parent().get_node("VideoPlayer").paused = false

	
