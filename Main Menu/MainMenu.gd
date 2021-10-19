extends CanvasLayer

export(NodePath) var high_score_label

signal start_game

func update_menu():
	get_node(high_score_label).text = Data.high_score as String

func _start_game():
	emit_signal("start_game")
