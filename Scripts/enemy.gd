extends CharacterBody2D

const SPEED = 60
var direction = 1

@onready var ray_cast: RayCast2D = $RayCast
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = direction * SPEED
	
	move_and_slide()

func _process(delta: float) -> void:
	if ray_cast.is_colliding():
		scale.x *= -1
		direction *= -1
