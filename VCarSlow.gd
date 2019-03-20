extends Area2D

export var Velocity = Vector2(0,350);
func _ready():
	set_physics_process(true);
	pass
	
func _physics_process(delta):
	translate(Velocity * delta);
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Actor":
			get_tree().change_scene("World2.tscn")
	if get_position().y-16 >= get_viewport().size.x:
		queue_free()
	pass