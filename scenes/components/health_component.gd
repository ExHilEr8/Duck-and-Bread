extends Node2D
class_name HealthComponent

signal on_damaged
signal on_healed
signal on_health_changed

@export_category("Properties")
@export var health_max : int = 100 : 
	get:
		return health_max
	set(value):
		health_max = clamp(value, 0, INTEGER_MAX)

@onready var health_current : int = health_max : 
	get:
		return health_current
	set(value):
		health_current = clamp(value, 0, health_max)
		on_health_changed.emit()

const INTEGER_MAX = 9223372036854775807

func damage(dmg : int) -> void:
	health_current -= dmg
	on_damaged.emit()

func heal(heal_amount : int) -> void:
	health_current += heal_amount
	on_healed.emit()
