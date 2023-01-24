extends Node

var time
var isPlayerExist = false
var t

func _ready():
	time = 10.0

func _process(delta):
	if get_node("/root/Gameplay").BattleOn:
		if isPlayerExist:
			if time > 0 :
				if $TextureProgress.value > 0 :
					_takeDps()
					time -= delta
				else :
					self.visible = false
					self.get_child(0).get_child(0).disabled = true
					self.get_child(1).get_child(1).disabled = true
					pass
			else :
				time = 10.0
	
	_stateObstacleBreak()

func _takeDps():
	if $DPSObstacle.is_stopped():
		$DPSObstacle.start()
		$TextureProgress.value -= 3

func _stateObstacleBreak():
	if int($TextureProgress.value) / 3 == 0 :
		self.get_child(1).get_child(0).modulate.b = 0
	elif int($TextureProgress.value) / 2 == 0 :
		self.get_child(1).get_child(0).modulate.g = 0
	elif int($TextureProgress.value) / 1 == 0 :
		self.get_child(1).get_child(0).modulate.r = 0

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		isPlayerExist = true

func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		isPlayerExist = false
