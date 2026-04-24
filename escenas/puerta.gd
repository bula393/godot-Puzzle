extends StaticBody2D


var contraido: Vector2 = Vector2(1.0, 0.5) 
var original_scale_y: float
var original_pos_y: float
var sprite_height: float

func _ready():
	original_scale_y = $Sprite2D.scale.y
	original_pos_y = $Sprite2D.position.y
	sprite_height = $Sprite2D.get_rect().size.y * $Sprite2D.scale.y
	
	
func abrir_puerta():
	var tween = create_tween().set_parallel(true)
	var duracion = 10.0 / 60.0
	tween.tween_property($Sprite2D, "scale:y", 0.0, duracion)
	tween.tween_property($CollisionShape2D, "scale:y", 0.0, duracion)
	tween.tween_property($Sprite2D, "position:y", original_pos_y - (sprite_height / 2), duracion)
	tween.tween_property($CollisionShape2D, "position:y", original_pos_y - (sprite_height / 2), duracion)

func cerrar_puerta():
	var tween = create_tween().set_parallel(true)
	var duracion = 10.0 / 60.0
	tween.tween_property($Sprite2D, "scale:y", original_scale_y, duracion)
	tween.tween_property($CollisionShape2D, "scale:y", original_scale_y, duracion)
	tween.tween_property($Sprite2D, "position:y", original_pos_y, duracion)
	tween.tween_property($CollisionShape2D, "position:y", original_pos_y, duracion)

func _physics_process(_delta: float) -> void:
	if !get_node("../PALANCA").getCerrar(): 
		abrir_puerta()
	else:
		cerrar_puerta()
