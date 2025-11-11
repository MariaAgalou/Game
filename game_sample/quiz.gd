extends Area2D

@onready var audio_player = $AudioStreamPlayer

var quiz_triggered := false

func _on_body_entered(body):
	if quiz_triggered:
		return
	if body.is_in_group("player"):  # Make sure your player is in "player" group
		quiz_triggered = true
		play_audio()

func play_audio():
	if audio_player and not audio_player.playing:
		audio_player.play()

func _on_audio_stream_player_finished():
	var popup = get_tree().get_first_node_in_group("Window")
	popup.show()
	
	
