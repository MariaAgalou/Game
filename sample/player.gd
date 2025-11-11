extends CharacterBody2D  

@export var speed: float = 200.0  # Movement speed (adjust as needed)

func _physics_process(delta):
	var direction = Vector2.ZERO  # Default no movement

	# Get input direction
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1

	# Normalize direction to prevent diagonal speed boost
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Apply movement
	velocity = direction * speed
	move_and_slide()
