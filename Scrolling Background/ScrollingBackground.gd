extends Node2D

export(NodePath) var left_background
export(NodePath) var right_background
export(float) var swap_offset

func scroll_right(amount):
	get_node(left_background).position.x -= amount
	get_node(right_background).position.x -= amount

func _swap_background(area):
	if area.get_groups().has("background"):
		var right_background_x = get_node(right_background).position.x
		get_node(left_background).position.x = right_background_x + swap_offset
		
		var left_background_holder = left_background
		left_background = right_background
		right_background = left_background_holder
