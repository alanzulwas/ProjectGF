extends Area2D

export var isTP_A = false
export var isTP_B = false

export var notAbleTP = false

var TP_A
var TP_B

func _ready():
	TP_A = get_parent().get_node("TP_A")
	TP_B = get_parent().get_node("TP_B")

func _on_TP_body_entered(body):
	if !self.notAbleTP:
		if body.is_in_group("Player"):
			if self.isTP_A :
				body.global_position.x = TP_B.global_position.x
				body.global_position.y = TP_B.global_position.y
				self.TP_B.notAbleTP = true
				
			if self.isTP_B :
				body.global_position.x = TP_A.global_position.x
				body.global_position.y = TP_A.global_position.y
				self.TP_A.notAbleTP = true

func _on_TP_body_exited(body):
	if body.is_in_group("Player"):
		if self.TP_A.notAbleTP:
			self.TP_A.notAbleTP = false
		if self.TP_B.notAbleTP:
			self.TP_B.notAbleTP = false
