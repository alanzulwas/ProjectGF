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
	if get_node("/root/Gameplay").currentWinner == "Player1":
		ScorePlayer.Player1 += 1
		if ScorePlayer.Player1 < 2:
			TextBS.text = "Player 1\nTook The Round"
		else :
			TextBS.text = "Player 1\n Won"
	elif ScorePlayer.Player1 <= 1 and get_node("/root/Gameplay").currentWinner == "Player2":
		ScorePlayer.Player2 += 1
		if ScorePlayer.Player2 < 2:
			TextBS.text = "Player 2\nTook The Round"
		else :
			TextBS.text = "Player 2\n Won"

func _nextRound():
	if ScorePlayer.Player1 < 2 and ScorePlayer.Player2 < 2:
		get_node("/root/Gameplay").queue_free()
		if get_tree().change_scene("res://Scene & Script/Gameplay/Gameplay.tscn") != OK :
			print ("An unexpected error occured when trying to switch to the Readme scene")
	else :
		ScorePlayer.P1_Chara = ""
		ScorePlayer.P2_Chara = ""
		ScorePlayer.Player1 = 0
		ScorePlayer.Player2 = 0
		get_node("/root/Gameplay").queue_free()
		if get_tree().change_scene("res://Scene & Script/Menu Game/Menu_Game.tscn") != OK :
			print ("An unexpected error occured when trying to switch to the Readme scene")
