extends Area3D

func _on_body_entered(body):
	print(body)
	if(body is DogController):
		GameState.dog_reached_death();
