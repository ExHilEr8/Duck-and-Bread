extends Node2D
class_name HealthBarComponent

@export_category("General")
@export var health_component : HealthComponent
@export var health_bar : ProgressBar
@export var health_bar_label : Label

# Called when the node enters the scene tree for the first time.
func _ready():
	health_bar.max_value = health_component.health_max
	health_bar.min_value = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var label_text : String
	label_text = "%s/%s" % [health_bar.value, health_bar.max_value]
	health_bar_label.text = label_text

	health_bar.value = health_component.health_current
	
