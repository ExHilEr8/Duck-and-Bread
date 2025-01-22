extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_QUART)
	tween.tween_property(self, "zoom", Vector2(1, 1), 8)



