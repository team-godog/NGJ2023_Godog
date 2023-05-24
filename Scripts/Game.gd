extends Node

@export var introAnim = true

func _ready():
	if introAnim:
		$CameraScene/AnimationPlayer.animation_finished.connect(_on_intro_animation_finished)
		$CameraScene/AnimationPlayer.play("level_overview")
	else:
		# Start right away.
		start()

func _on_intro_animation_finished(_anim_name: StringName):
	start()

func start():
	$Godog.process_mode = Node.PROCESS_MODE_INHERIT
	GameState.play_music()
