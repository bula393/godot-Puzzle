extends StaticBody2D
var cerrar = true


func cambiarSprite() -> void: 
	if cerrar:
		$Sprite2D.texture= load("res://assets/palancaA.png")
	else :
		$Sprite2D.texture = load("res://assets/palancaB.png")
	

func setCerrar() -> void:
	cerrar = !cerrar
	cambiarSprite()

func getCerrar() -> bool:
	return cerrar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
