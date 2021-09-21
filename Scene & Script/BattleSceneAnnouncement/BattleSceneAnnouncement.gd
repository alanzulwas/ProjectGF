extends AnimationPlayer

onready var TextBS = $Text

func _PreBattleScene():
	TextBS.text = "Ready\nFor The Battle"
	$Sound_and_Bgmusic/PreBattleAudio.play()
	$Sound_and_Bgmusic/ReadyForTheBattle_Announcement.play()

func _AnnoucementSound(_value):
	if _value == "Fight":
		$Sound_and_Bgmusic/Fight_Announcement.play()
	elif _value == "GameOver":
		$Sound_and_Bgmusic/GameOver_Announcement.play()

func _PostBattleScene():
	var Text
	if get_node("/root/Gameplay").currentWinner == "Player1":
		Text = "Player 1"
	elif get_node("/root/Gameplay").currentWinner == "Player2":
		Text = "Player 2"
	TextBS.text = Text + "\nWin The Round"

func _ready():
	pass
