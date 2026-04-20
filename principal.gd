extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0
var direccionViendo = "right"
var bala_scene = preload("res://empuje.tscn")
var balaActiva = null

func _ready() -> void:
	$Sprite2D.play("quieto")
	$Sprite2D.z_index = 10 

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		controlDireccionViendo(direction)
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if not is_on_floor():
		if velocity.y < 0:
			$Sprite2D.play("subir")
	elif direction :
		$Sprite2D.play("run")
	elif balaActiva == null:
		$Sprite2D.play("quieto")

	move_and_slide()
	if balaActiva != null and velocity.x != 0:
			if balaActiva.getDireccion() == direccionViendo:
				balaActiva.position.x += velocity.x  * delta
			else:
				balaActiva.queue_free()


func controlDireccionViendo(direccion : float)-> void:
	if direccion>0:
		direccionViendo = "right"
		$Sprite2D.flip_h = false 
	else:
		direccionViendo = "left"
		$Sprite2D.flip_h = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("empuje") and balaActiva == null:
		balaActiva = bala_scene.instantiate()
		get_parent().add_child(balaActiva)
		balaActiva.setModo("empujar")
		calcularposition(balaActiva)
		$Sprite2D.play("empuje")
		await get_tree().create_timer(0.5).timeout
		if balaActiva != null:
			balaActiva.queue_free()
	if event.is_action_pressed("atraer") and balaActiva == null:
		balaActiva = bala_scene.instantiate()
		get_parent().add_child(balaActiva)
		balaActiva.setModo("atraer")
		calcularposition(balaActiva)
		$Sprite2D.play("empuje")
		await get_tree().create_timer(0.5).timeout
		if balaActiva != null:
			balaActiva.queue_free()

			
func calcularposition(balaActiva : Area2D) -> void:
	var tamañoSumar = $CollisionShape2D.shape.get_rect().size.x / 2 + balaActiva.get_node("CollisionShape2D").shape.get_rect().size.x / 2
	var posicionSalida  = global_position
	posicionSalida.y -= 15
	if direccionViendo == "left":
		posicionSalida.x -= tamañoSumar 
	elif direccionViendo == "right":
		posicionSalida.x +=  tamañoSumar 
	balaActiva.global_position = posicionSalida
	balaActiva.setDireccion(direccionViendo)
			
			


	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() # Elimina el objeto para ahorrar recursos
	print("YOU WIN" + name)
