extends Button


func _on_mouse_entered():
	$AnimatedSprite2D.play()
	$Selector.visible = true


func _on_mouse_exited():
	$AnimatedSprite2D.pause()
	$Selector.visible = false
