extends Node

var current_scene = null

func _reay():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	