extends Node2D
class_name map
export(Array, NodePath) var DPS_Area
var RNG = RandomNumberGenerator.new()
var time
var tempIndexDPS = 0
var tes = false
var t

func _ready():
	RNG.randomize()
	time = RNG.randf_range(10, 15)
	t = time - 6
	for n in len(DPS_Area):
		get_node(DPS_Area[n]).get_child(0).disabled = true
	tes = false

func _process(delta):
	if get_node("/root/Gameplay").BattleOn:
		time -=delta
		
		var secs = fmod(time,60)
		var mins = fmod(time,60*60)/60
		
		var timed_passed = "%02d : %02d" % [mins,secs]
		tempIndexDPS = randi() % len(DPS_Area)
		if time < 0:
			tes = true
			get_node(DPS_Area[tempIndexDPS]).get_child(0).disabled = false
			RNG.randomize()
			time = RNG.randf_range(10, 15)
			t = time - 6
		var labelPath = get_node(DPS_Area[tempIndexDPS]).get_child(1)
		labelPath.text = timed_passed + ", " + str(tes)
		
		if t > time:
			get_node(DPS_Area[tempIndexDPS]).get_child(0).disabled = true
			tes = false
