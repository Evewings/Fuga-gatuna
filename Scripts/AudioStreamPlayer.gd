extends AudioStreamPlayer

func _ready():
	var audio_player = $AudioStreamPlayer
	audio_player.autoplay = true
	audio_player.loop = true
	audio_player.play()
