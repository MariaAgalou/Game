extends Area2D

@onready var audio_player = $AudioStreamPlayer

var dialogue_triggered := false

func _on_body_entered(body):
	if dialogue_triggered:
		return
	if body.is_in_group("player"):  # Make sure your player is in "player" group
		dialogue_triggered = true
		show_dialogue()
		play_audio()

func show_dialogue():
	var dialogue_box = get_tree().get_first_node_in_group("DialogueBox")
	if dialogue_box:
		dialogue_box.show_text("THIS IS A TEST. THIS IS A TEST.")

func play_audio():
	if audio_player and not audio_player.playing:
		audio_player.play()

func _on_audio_stream_player_finished():
	# Hide dialogue when audio finishes
	var dialogue_box = get_tree().get_first_node_in_group("DialogueBox")
	if dialogue_box:
		dialogue_box.hide_text()
