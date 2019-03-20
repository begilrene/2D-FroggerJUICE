extends KinematicBody2D

export var velocity = Vector2();
export var speed = 5000;
const IDLE_SPEED = 500
var is_ani_started = false;
export var lives = 3;
signal my_signal;
var PlayerAnimNode
var anim = ""
var animNew = ""



func _ready():
	set_physics_process(true)
	
	PlayerAnimNode = get_node("Visible")
	pass

func _physics_process(delta):
	var velocity = Vector2()
	
	if (Input.is_action_pressed("ui_up")):
		velocity.y += -1
	if (Input.is_action_pressed("ui_down")):
		velocity.y += 1
	if (Input.is_action_pressed("ui_left")):
		velocity.x += -1
	if (Input.is_action_pressed("ui_right")):
		velocity.x += 1;
			
	#yield(self, "my_signal")
	velocity = velocity.normalized()*speed*delta
	velocity = move_and_slide(velocity, Vector2(0,0))
	
	if(velocity.length() > IDLE_SPEED*0.09):
		if(Input.is_action_pressed("ui_up")):
			anim = "Jump";
			#$Visible.flip_v = true;
		if(Input.is_action_pressed("ui_down")):
			anim = "Jump";
			$Visible.flip_v = false;
		if(Input.is_action_pressed("ui_left")):
			anim = "Jump";
			$Visible.flip_h = true;
		if(Input.is_action_pressed("ui_right")):
			anim = "Jump";
			$Visible.flip_h = false;
	else:
		anim = "Idle";
		
	if anim != animNew:
		animNew = anim
		PlayerAnimNode.play(anim)
	pass
	

func _on_Visible_animation_finished():
	is_ani_started = false;
	emit_signal("my_signal")
	pass # replace with function body
