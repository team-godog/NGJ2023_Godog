extends Area3D


func _on_body_entered(body):
	if body is DogController:
		$/root/Menu.show_end()
