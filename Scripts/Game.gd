extends Node

@export var introAnim = true

func _ready():
	if introAnim:
		$CameraScene/AnimationPlayer.animation_finished.connect(_on_intro_animation_finished)
		$CameraScene/AnimationPlayer.play("level_overview")
	else:
		# Start right away.
		$Godog.process_mode = Node.PROCESS_MODE_ALWAYS

func _on_intro_animation_finished(anim_name: StringName):
	$Godog.process_mode = Node.PROCESS_MODE_ALWAYS
