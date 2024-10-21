extends CharacterBody2D

@onready var nav_agent: NavigationAgent2D = $"NavigationAgent2D"
var speed: int = 500

func _physics_process(delta):
	var mouse_pos: Vector2 = get_global_mouse_position()
	nav_agent.target_position = mouse_pos
	
	var target_pos: Vector2 = nav_agent.get_next_path_position()
	
	velocity = (target_pos - global_position).normalized()
	velocity = velocity * speed
	
	move_and_slide()
	
	var rot_to_target_pos: float = global_position.angle_to_point(target_pos)
	rotation = rot_to_target_pos + PI / 2
