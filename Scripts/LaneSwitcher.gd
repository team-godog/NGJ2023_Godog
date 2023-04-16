extends Area3D

@onready var game : Game = get_tree().root.get_child(0)
@export var targetPath : NodePath;
@export var targetSteering : int;


func _ready():
	$Sprite3D.free()

func _on_area_entered(area):
	if(area.get_parent() is GodogSled):
		var sled = area.get_parent() as GodogSled;
		if(game.currentSteeringPosition == targetSteering):
			game.SwitchToNewPath(get_node(targetPath));
