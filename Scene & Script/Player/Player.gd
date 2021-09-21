extends KinematicBody2D

const UP = Vector2(0, -1)
const DIRECTION_RIGHT = 1
const DIRECTION_LEFT = -1
const LONCAT = 500
const SPEED = 200

var state_machine
var jumlah_lompat = 0
var velocity = Vector2.ZERO
var playerFacing = 1
var direction = Vector2(DIRECTION_RIGHT, 1)
var Player = ""
var KnockBack = false

#Variable Input Hit
var combo = "NULL"
var AttackPoints = 3
var lagi_mukul = false
var lagi_jalan = false
var runHit = false
var dir = 0
var KnockBack_vector = Vector2.ZERO
var roll_vector = Vector2.LEFT
var playerInput = ""

#onready var _player1 = get_node("/root/Gameplay/Cam/Player1")
#onready var _player2 = get_node("/root/Gameplay/Cam/Player2")

var _player1
var _player2

onready var HP = 100 
onready var Lifebar = get_node("/root/Gameplay/Lifebars_and_Timer/Lifebar")

func _ready():
	if self == _player2:
		self.Player = "P2"
		self.global_position.x = 441.174
		self.global_position.y = 283.929
		self.global_scale.x = 1.5
		self.global_scale.y = 1.5
		self.playerInput = "_P2"
		set_direction(DIRECTION_LEFT)
	elif self == _player1 :
		self.Player = "P1"
		self.global_position.x = 160.071
		self.global_position.y = 283.929
		self.global_scale.x = 1.5
		self.global_scale.y = 1.5
		self.playerInput = ""
		set_direction(DIRECTION_RIGHT)
		
	var _nodePlayerGet = "State_" + Player
	self.state_machine = get_node(_nodePlayerGet).get("parameters/playback")
	self.KnockBack_vector = self.roll_vector

func HitTimerReset():
	self.AttackPoints = 3

func _lompat():
	self.velocity.y = - 500

func _hitTrue():
	self.lagi_mukul = true

func _hitFalse():
	self.lagi_mukul = false

func _hitAnimation(_value):
	self.lagi_mukul = _value

func _runHitTrue():
	self.runHit = true

func _runHitFalse():
	self.runHit = false

func _hurt(_value):
	self.KnockBack = _value

func _grafitasi():
	self.velocity.y += 25
	if self.velocity.y > 200:
		self.velocity.y = 200

func set_direction(hor_direction): #ide dari Godot Community pake : $".".scale.x = 1
	if hor_direction == 0:
		hor_direction = DIRECTION_RIGHT # default to right if param is 0
	var hor_dir_mod = hor_direction / abs(hor_direction) # get unit direction
	apply_scale(Vector2(hor_dir_mod * direction.x, 1)) # flip
	direction = Vector2(hor_dir_mod, direction.y) # update direction

func _jalan(_arah):
	self.velocity.x += 75 * _arah
	self.state_machine.travel("Run")
	self.dir = _arah
	self.lagi_jalan = true

func _situationPlayer(delta):
	#print(self.Player,", ",self.runHit,", ",self.KnockBack)
	if self.runHit and !self.KnockBack:
		self.velocity.x = clamp(self.velocity.x, -SPEED, SPEED)
		self.velocity.x += SPEED * self.dir
		self.velocity = move_and_slide(self.velocity, self.UP)
		self.velocity.x = lerp(self.velocity.x,self.dir*0,0.06)
	
	elif !self.runHit and self.KnockBack:
		state_machine.travel("Hurt")
		self.velocity = velocity.move_toward(Vector2.ZERO, 200 * delta)
		self.velocity = move_and_slide(self.velocity)
	
	elif !self.runHit and !self.KnockBack:
		self.velocity.x = clamp(self.velocity.x, -75, 75)
		_getInput()
		self.velocity = move_and_slide(self.velocity,self.UP)
		self.velocity.x = lerp(self.velocity.x,0,0.2)
 
func _process(delta):
	_grafitasi()
	_KnockBack_Way(self.dir)
	_situationPlayer(delta)
	_healthPlayer()

func _healthPlayer():
	Lifebar.set_percent_value_int(self.name,HP)
	if self.HP == 0 :
		if self.name == "Player1":
			get_node("/root/Gameplay").currentWinner = "Player2"
			ScorePlayer.Player2 += 1
		if self.name == "Player2":
			get_node("/root/Gameplay").currentWinner = "Player1"
			ScorePlayer.Player1 += 1

func _getInput():
	if get_node("/root/Gameplay").BattleOn:
		_inputMovement()
		_inputAir()
		_inputHit()

func _inputMovement():
	var ui_left = "ui_left" + self.playerInput
	var ui_right = "ui_right" + self.playerInput
	if Input.is_action_pressed(ui_left) and !self.lagi_mukul:
		set_direction(DIRECTION_LEFT)
		_jalan(-1)
	elif Input.is_action_pressed(ui_right) and !self.lagi_mukul:
		set_direction(DIRECTION_RIGHT)
		_jalan(1)
	else :
		if !lagi_mukul:
			state_machine.travel("Idle")
			lagi_jalan = false

func _inputAir():
	var ui_jump = "ui_jump" + self.playerInput
	if Input.is_action_just_pressed(ui_jump):
		if self.jumlah_lompat < 1:
			self.jumlah_lompat += 1
			_lompat()
	
	if !is_on_floor() and velocity.y < 0 :
		state_machine.travel("Jump")#jumpAnimation
	elif !is_on_floor() and velocity.y > 0 :
		state_machine.travel("Fall")#fallAnimation

	if is_on_floor():
		jumlah_lompat = 0

func _inputHit():
	var ui_hit = "ui_hit" + self.playerInput
	#if not BattleOn & lagi_mukul & jalan:
	if !self.lagi_mukul:
		if !self.lagi_jalan:
			if self.AttackPoints == 3 and self.state_machine.get_current_node() == "Idle":
				if Input.is_action_just_pressed(ui_hit):
					$HitTimerReset.start()
					self.AttackPoints -= 1
					self.state_machine.travel("Hit2")

			elif self.AttackPoints == 2 and self.state_machine.get_current_node() == "Idle":
				if Input.is_action_just_pressed(ui_hit):
					$HitTimerReset.start()
					self.state_machine.travel("Hit1")
					self.AttackPoints -= 1

			elif self. AttackPoints == 1 and self.state_machine.get_current_node() == "Idle":
				if Input.is_action_just_pressed(ui_hit):
					$HitTimerReset.start()
					self.state_machine.travel("Hit3")
					self.AttackPoints -= 1

		elif self.lagi_jalan and self.is_on_floor():
			if Input.is_action_just_pressed(ui_hit):
				self.state_machine.travel("Run-Hit")
				self.AttackPoints = 3
				
		if !self.is_on_floor() and Input.is_action_just_pressed(ui_hit):
				self.state_machine.travel("Jump-Hit")
				self.AttackPoints = 3

func _KnockBack_Way(_dir):
	var playerArea
	if self.Player == "P1":
		playerArea = _player2
	elif self.Player == "P2":
		playerArea = _player1
	
	if self.dir == 1:
		playerArea.KnockBack_vector = Vector2.RIGHT
	if self.dir == -1:
		playerArea.KnockBack_vector = Vector2.LEFT

func _on_AreaDmg_area_entered(area):
	var AreaHit
	var playerArea
	if self.Player == "P1":
		AreaHit = "AreaHit_P1"
		playerArea = _player1
	elif self.Player == "P2":
		AreaHit = "AreaHit_P2"
		playerArea = _player2
	
	if area.is_in_group(AreaHit):
		self.KnockBack = true
		self.HP -= 10
		self.velocity = playerArea.KnockBack_vector * 50
