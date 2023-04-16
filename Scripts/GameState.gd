extends Node

var pickups_collected = []

@export var woofs : Array[AudioStreamWAV]

@onready var woofer = $BarkSFX
@onready var music = $Music

func bark():
	woofer.stream = woofs.pick_random()
	woofer.pitch_scale = randf_range(0.8, 1.2)
	woofer.play()

func play_music():
	music.play()


