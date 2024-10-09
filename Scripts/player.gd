extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var prev_direction = 1

@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var attack_zone: Area2D = $AttackZone

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		audio_player.play()
		animation_player.play("Jump");
		
	if Input.is_action_just_pressed("attack"):
		animation_player.play("Attack");

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if (direction != 0 && prev_direction != direction):
		scale.x *= -1
		prev_direction = direction
	
	if direction:
		velocity.x = direction * SPEED
		if animation_player.current_animation != "Attack" && (animation_player.current_animation != "Jump" && is_on_floor()):
			animation_player.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if animation_player.current_animation != "Attack" && (animation_player.current_animation != "Jump" && is_on_floor()):
			animation_player.play("Iddle")

	move_and_slide()
