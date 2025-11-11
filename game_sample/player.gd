extends CharacterBody2D  

@export var speed: float = 400.0  # Movement speed (adjust as needed)
@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Vector2.ZERO  # Default no movement

	# Get input direction
	if Input.is_action_pressed("right"):
		direction.x += 1
		_animated_sprite.play("Right")
	if Input.is_action_pressed("left"):
		direction.x -= 1
		_animated_sprite.play("Left")
	if Input.is_action_pressed("down"):
		direction.y += 1
		_animated_sprite.play("Down")
	if Input.is_action_pressed("up"):
		direction.y -= 1
		_animated_sprite.play("Up")

	# Normalize direction to prevent diagonal speed boost
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Apply movement
	velocity = direction * speed
	move_and_slide()
