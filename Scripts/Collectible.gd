extends Area3D


func _on_body_entered(body):
	if body is DogController:
		print("You picked me up!")
		var tween = get_tree().create_tween()
		tween.tween_property(self, "scale", Vector3(0.01, 0.01, 0.01), 0.4)
		tween.tween_callback(self.queue_free)

