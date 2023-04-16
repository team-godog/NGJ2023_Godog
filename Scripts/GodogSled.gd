extends Node
class_name GodogSled

@onready var steeringPositions = [$Positions/Positions_Left, $Positions/Positions_Middle, $Positions/Positions_Right]
@export var posTime : float;
@export var rotTime : float;
@export var remoteTransform : RemoteTransform3D;

var currentPosition :  Node3D;

func SetCurrentPosition(posID : int) -> void:
	currentPosition = steeringPositions[posID + 1];
	var posTween = get_tree().create_tween();
	posTween.tween_property($Visuals, "position", currentPosition.position, posTime);
	
	var rotTween = get_tree().create_tween();
	rotTween.tween_property($Visuals, "rotation", currentPosition.rotation, rotTime);

   
