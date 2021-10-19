extends Area2D

export(float) var gravity_max_strength
export(float) var gravity_pull
export(float) var jump_force
var current_gravity_force = 0
var is_flying = false

signal player_passed_pipes
signal player_crashed

func _process(delta):
	if is_flying:
		gravity_pull_down(delta)
		gravity_force(delta)

func _input(event):
	if event.is_action_pressed("jump") and is_flying:
		current_gravity_force = -jump_force

func start_flying():
	is_flying = true

func stop_flying():
	is_flying = false

func gravity_pull_down(delta):
	var force = current_gravity_force + (gravity_pull * delta)
	
	if force > gravity_max_strength:
		force = gravity_max_strength
	current_gravity_force = force

func gravity_force(delta):
	position.y += current_gravity_force * delta

func _hit_area(area):
	if area.get_groups().has("pipe"):
		emit_signal("player_crashed")
	elif area.get_groups().has("pass_area"):
		emit_signal("player_passed_pipes")
