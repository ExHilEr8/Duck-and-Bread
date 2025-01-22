extends Node
class_name GCD

@export_category("GCD Properties")
@export var global_cooldown_length_seconds : float = 2.50
@export var global_cooldown_queue_buffer_seconds : float = 0.4

var total_skills = 10
var skills : Array[Skill] = []
var skills_input_map : Array[String] = []

var global_cooldown_timer : Timer
var queued_gcd : Skill

func _ready():
	for skill in range(1, total_skills + 1):
		print(InputMap.action_get_events(str("Skill_", skill)))

func _process(_delta):
	queued_gcd = get_last_ability_pressed()
	

func execute_gcd(skill : Skill):
	return

func get_last_ability_pressed() -> Skill:
	return