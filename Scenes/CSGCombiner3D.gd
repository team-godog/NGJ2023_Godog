@tool
extends CSGCombiner3D


@export var run: bool = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(run):
		var n = Node.new()
		n.owner = ge
		add_child(n)
		run = false;
		print("It Ran")
