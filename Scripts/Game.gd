extends Node
class_name Game

@export var introAnim = true

@export var godogSled : GodogSled;
@export var godogSledPathFollow : PathFollow3D;
var currentPath : Path3D;
var currentProgressAlongPath : float = 0;
@export var speed : float = 10;
var currentSteeringPosition : int = 0;

func _ready():
	
	godogSled.remoteTransform.remote_path = $CameraScene.get_path();
	currentPath = godogSledPathFollow.get_parent();
	
	if introAnim:
		$CameraScene/AnimationPlayer.animation_finished.connect(_on_intro_animation_finished)
		$CameraScene/AnimationPlayer.play("level_overview")
	else:
		# Start right away.
		godogSled.process_mode = Node.PROCESS_MODE_ALWAYS

func _on_intro_animation_finished(anim_name: StringName):
	godogSled.process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta):
	CalculateSteering();
	MoveDog(delta);

func CalculateSteering():

	if Input.is_action_just_pressed("move_left"):
		if(currentSteeringPosition != -1):
			currentSteeringPosition -= 1;

	if Input.is_action_just_pressed("move_right"):
		if(currentSteeringPosition != 1):
			currentSteeringPosition += 1;
			
	godogSled.SetCurrentPosition(currentSteeringPosition);


func MoveDog(delta : float):
	currentProgressAlongPath += speed * delta;
	godogSledPathFollow.progress = currentProgressAlongPath;

func SwitchToNewPath(path : Path3D):
	currentPath = path;
	godogSled.reparent(currentPath);
	currentProgressAlongPath = 0;
	currentSteeringPosition = 0;
	godogSled.SetCurrentPosition(currentSteeringPosition);
	
