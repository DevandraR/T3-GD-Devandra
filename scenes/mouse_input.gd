extends Node2D

@onready var audio_player = $AudioStreamPlayer2D2  # Get the AudioStreamPlayer


func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			print("Left mouse button clicked!")
			audio_player.play()  # Play sound
