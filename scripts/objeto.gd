extends CharacterBody2D
const relentizacion = 800.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = move_toward(velocity.x, 0, relentizacion * delta)
	move_and_slide()
