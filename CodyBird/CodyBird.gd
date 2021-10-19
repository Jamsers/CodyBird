extends Node2D

export(float) var player_speed

export(NodePath) var main_menu
export(NodePath) var hud
export(NodePath) var game_over

export(NodePath) var scrolling_background
export(NodePath) var pipe_spawner
export(NodePath) var player

var is_playing = false

func _ready():
	_main_menu()

func _process(delta):
	if is_playing:
		get_node(pipe_spawner).scroll_right(player_speed * delta)
		get_node(scrolling_background).scroll_right(player_speed * delta)

func _main_menu():
	Data.load_score()
	is_playing = false
	
	get_node(main_menu).scale = Vector2(1, 1)
	get_node(hud).scale = Vector2(0, 0)
	get_node(game_over).scale = Vector2(0, 0)
	
	get_node(main_menu).update_menu()
	
	get_node(pipe_spawner).stop_spawning()
	get_node(player).stop_flying()

func _game_start():
	is_playing = true
	
	get_node(main_menu).scale = Vector2(0, 0)
	get_node(hud).scale = Vector2(1, 1)
	get_node(game_over).scale = Vector2(0, 0)
	
	get_node(pipe_spawner).start_spawning()
	get_node(player).start_flying()

func _game_over():
	Data.save_score()
	is_playing = false
	
	get_node(main_menu).scale = Vector2(0, 0)
	get_node(hud).scale = Vector2(0, 0)
	get_node(game_over).scale = Vector2(1, 1)
	
	get_node(game_over).update_menu()
	
	get_node(pipe_spawner).stop_spawning()
	get_node(player).stop_flying()

func _restart():
	get_tree().reload_current_scene()

func _player_add_score():
	Data.add_score()
