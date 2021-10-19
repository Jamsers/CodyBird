extends Node2D

export(PackedScene) var pipe_pair_scene
export(NodePath) var spawn_timer
export(float) var spawn_offset

func scroll_right(amount):
	get_tree().call_group("pipe_pair", "scroll_right", amount)

func start_spawning():
	var current_wait_time = get_node(spawn_timer).wait_time
	get_node(spawn_timer).start(-current_wait_time)

func stop_spawning():
	get_node(spawn_timer).stop()

func _spawn():
	var pipe_pair = pipe_pair_scene.instance()
	pipe_pair.position = Vector2(spawn_offset, 0)
	add_child(pipe_pair)

func _remove_pipepair(area):
	if area.get_groups().has("pipe_pair"):
		area.queue_free()
