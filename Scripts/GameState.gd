extends Node

var pickups_collected = []

@export var woofs : Array[AudioStreamWAV]

@onready var woofer = $BarkSFX

func bark():
	woofer.stream = woofs.pick_random()
	woofer.play()
