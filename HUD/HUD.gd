extends CanvasLayer

export(NodePath) var score_label

func _ready():
	_score_changed(0)
	Data.connect("score_changed", self, "_score_changed")

func _score_changed(score):
	get_node(score_label).text = score as String
