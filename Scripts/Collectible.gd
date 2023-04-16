@tool
extends Area3D
class_name Collectible


@export var textures : Array[Texture2D]
@export_enum("rosemary", "flower", "pastinak") var pickup_type : int = 0

enum PickupType {
	ROSEMARY,
	FLOWER,
	PASTINAK,
}

var picked := false


func _ready():
	var mat = $PickUp.material_override.duplicate()
	mat.albedo_texture = textures[pickup_type]
	$PickUp.material_override = mat


func _on_body_entered(body):
	if picked:
		return

	if body is DogController:
		picked = true
		print("You picked me up!")
		GameState.pickups_collected.append(pickup_type)
		var tween = get_tree().create_tween()
		tween.tween_property(self, "scale", Vector3(0.01, 0.01, 0.01), 0.1)
		tween.tween_property(self, "scale", Vector3(0.5, 0.5, 0.5), 0.05)
		tween.tween_property(self, "scale", Vector3(0.01, 0.01, 0.01), 0.05)
		tween.tween_callback(self.queue_free)

