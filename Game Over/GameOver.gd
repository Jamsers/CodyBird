extends CanvasLayer

export(NodePath) var high_score_label
export(NodePath) var current_score_label

signal main_menu

func update_menu():
	get_node(high_score_label).text = Data.high_score as String
	get_node(current_score_label).text = Data.current_score as String

func _main_menu():
	emit_signal("main_menu")
