@tool
extends EditorScript



func _run():
	var combiner = get_scene().get_node("Level/CSGCombiner3D")
	var original = combiner.get_node("CSGPolygon3D_ORIGINAL");
	var laneSwitcher = preload("res://Scenes/LaneSwitcher.tscn");
	
	for node in combiner.get_children():
		if !node is Path3D:
			continue;
		var newCSG = original.duplicate();
		newCSG.name = "CSGPolygon_" + node.name;
		combiner.add_child(newCSG);
		newCSG.set_owner(get_scene());
		newCSG.path_node = NodePath(node.name);
		newCSG.global_position = node.global_position;
		newCSG.rotation = node.rotation
		newCSG.scale = node.scale
		node.transform = Transform3D()
		node.reparent(newCSG, false)
		node.set_owner(get_scene())
		
		var newLane = laneSwitcher.instantiate();
		newCSG.add_child(newLane);
		newLane.set_owner(get_scene())
		newLane.targetPath = NodePath("../" + node.name);
	
	print("done")
	
