extends Area2D
export var Velocity = Vector2(350,0);
func _ready():
	set_physics_process(true);
	pass
	
func _physics_process(delta):
	translate(Velocity * delta);
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Actor":
			get_tree().change_scene("World.tscn")
	if get_position().x-16 >= get_viewport().size.x:
		queue_free()
	pass