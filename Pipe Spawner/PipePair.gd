extends Node2D

export(float) var min_pass_size
export(float) var max_pass_size
export(float) var up_down_range
export(NodePath) var upper_pipe
export(NodePath) var lower_pipe
export(NodePath) var pass_area_collider

var random_generator = RandomNumberGenerator.new()

func _ready():
	var current_extents = get_node(pass_area_collider).shape.extents
	random_generator.randomize()
	var current_extents_y = random_generator.randf_range(min_pass_size, max_pass_size)
	current_extents = Vector2(current_extents.x, current_extents_y)
	get_node(pass_area_collider).shape.extents = current_extents
	
	get_node(upper_pipe).position.y -= current_extents.y/2
	get_node(lower_pipe).position.y += current_extents.y/2
	
	random_generator.randomize()
	position.y = random_generator.randf_range(-up_down_range, up_down_range)

func scroll_right(amount):
	position.x -= amount
