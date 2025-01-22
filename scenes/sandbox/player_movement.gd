extends CharacterBody2D
class_name Player

@export var sprite : Sprite2D
@export var walking_speed : float = 200

var character_direction : Vector2

func _physics_process(_delta):
	var speed = walking_speed

	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")

	if character_direction.x > 0: 
		sprite.flip_h = false
	elif character_direction.x < 0:
		sprite.flip_h = true

	if character_direction:	
		velocity = character_direction.normalized() * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
		
	move_and_slide()
