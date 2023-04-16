extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_mouse_entered():
	$AnimatedSprite2D.play(); 
	$Selector.visible=true;
	pass # Replace with function body.

func _on_mouse_exited():
	$AnimatedSprite2D.pause(); 
	$Selector.visible=false;
	pass # Replace with function body.
