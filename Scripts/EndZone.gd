extends Area3D



func _on_body_entered(body):
	if(body is DogController):
		print("Dog")
		$/root/Menu.show_end();
