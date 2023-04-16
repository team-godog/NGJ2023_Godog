extends Area3D


var picked := false


func _on_body_entered(body):
	if picked:
		return

	if body is DogController:
		picked = true
		print("You picked me up!")
		var tween = get_tree().create_tween()
		tween.tween_property(self, "scale", Vector3(0.01, 0.01, 0.01), 0.1)
		tween.tween_property(self, "scale", Vector3(0.5, 0.5, 0.5), 0.05)
		tween.tween_property(self, "scale", Vector3(0.01, 0.01, 0.01), 0.05)
		tween.tween_callback(self.queue_free)

