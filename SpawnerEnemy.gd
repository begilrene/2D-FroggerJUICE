extends Node
const enemy_car_fast = preload("res://enemy_car_fast.tscn")
#const enemy_car = preload("res://Enemy_Car.tscn")
var timer = null
var delay = 1
var can_run = true;

func _ready():
	spawn()
	pass
	
func spawn():
	
	var position = Vector2(310,340)
	while (true ):
		print(delay);
		#if(Input.is_action_pressed("ui_right")):
		var enemy_fast = enemy_car_fast.instance()
		enemy_fast.set_position(position)
		get_node("Container").add_child(enemy_fast)
		#yield(timer, "timeout")
		yield(utils.create_timer(rand_range(1.5,2.5)), "timeout")
		#timer.start()
	pass



