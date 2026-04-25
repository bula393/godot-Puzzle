extends Area2D

var activar = false
var disparado = false
var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func activarbomb () -> void:
	activar = true
	get_parent().get_node("personajePrincipal").disparar()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if activar and !disparado:
		position = get_parent().get_node("personajePrincipal").global_position
		position.x += 50 * get_parent().get_node("personajePrincipal").getDir()
	elif activar and disparado:
		position.x += delta * velocity.x
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("disparar"):
		disparado = true
		velocity.x = 100 * get_parent().get_node("personajePrincipal").getDir()
		get_parent().get_node("personajePrincipal").disparar()
	


func _on_body_entered(body: Node2D) -> void:
	if body.get_collision_layer_value(3) or body.get_collision_layer_value(9) and disparado:
		body.queue_free()
		queue_free()
