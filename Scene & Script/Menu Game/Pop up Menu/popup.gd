extends Control

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		self.queue_free()
