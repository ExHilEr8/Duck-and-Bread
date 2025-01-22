extends Camera2D
class_name CameraController

@export_category("General")
@export var camera_sensitivity : int = 50 :
	get():
		return camera_sensitivity
	set(value):
		camera_sensitivity = clamp(value, 0, 100)

@export_category("Dependencies")
@export var player_reference : Player

var viewport_size : Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	viewport_size = get_viewport().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_direction := (player_reference.get_global_position() + get_global_mouse_position()).normalized()
	position = player_reference.get_global_position() + (mouse_direction * camera_sensitivity)