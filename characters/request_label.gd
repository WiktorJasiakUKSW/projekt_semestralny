extends Label

func _ready():
	text = get_parent().request
	position.x = get_parent().get_parent().position.x
	position.y = get_parent().get_parent().position.y
