extends Node
class_name GCD

@export_category("GCD Properties")
@export var global_cooldown_length_seconds : float = 2.50
@export var global_cooldown_queue_buffer_seconds : float = 0.4
@export var off_global_cooldown_queue_buffer_seconds : float = 0.15

var global_cooldown_timer : Timer
var queued_gcd : Skill

var total_skills = 2
var skills : Array[Skill] = []

func _ready():
	global_cooldown_timer = Timer.new()
	global_cooldown_timer.wait_time = global_cooldown_length_seconds
	global_cooldown_timer.autostart = false
	global_cooldown_timer.one_shot = true
	self.add_child(global_cooldown_timer)

	var temp_skill = Skill.new()
	temp_skill.input_map = "Skill_1"
	skills.append(temp_skill)

	temp_skill = Skill.new()
	temp_skill.input_map = "Skill_2"
	skills.append(temp_skill)

func _process(_delta):
	if is_gcd_queue_valid():
		queued_gcd = get_last_skill_pressed()
	
	if queued_gcd and (global_cooldown_timer.time_left == 0 or global_cooldown_timer.is_stopped() == true):
		execute_queued_gcd()
	

func execute_queued_gcd():
	queued_gcd.execute()
	queued_gcd = null
	global_cooldown_timer.start()

func get_last_skill_pressed() -> Skill:
	for skill in skills:
		if Input.is_action_just_pressed(skill.input_map):
			return skill
	
	return null

func is_gcd_queue_valid() -> bool:
	if global_cooldown_timer.is_stopped() == true:
		return true

	if global_cooldown_timer.time_left > global_cooldown_queue_buffer_seconds:
		return false
	

	return true

func is_off_gcd_queue_valid() -> bool:
	if global_cooldown_timer.is_stopped() == true:
		return false
	
	return true