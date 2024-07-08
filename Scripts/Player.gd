extends CharacterBody2D

# Velocidad de movimiento del sprite
@export var dialogo_txt: PackedScene
var speed = 100
var Objeto = false
var play_dialogo = false
func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_key_pressed(KEY_F):
		if Objeto == true:
			var macro = dialogo_txt.instantiate()
			add_child(macro)
			Dialogos._dialogos()
			get_tree().get_nodes_in_group("dialogo")[0].dialogo()
			get_tree().get_nodes_in_group("dialogo")[0].control = true
			play_dialogo = true
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		$AnimationPlayer.play("Derecha")
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
		$AnimationPlayer.play("Izquierda")
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
		$AnimationPlayer.play("Abajo")
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
		$AnimationPlayer.play("Arriba")

	# Normalizar el vector de dirección para evitar movimiento más rápido en diagonal
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Mover el sprite
	position += direction * speed * delta
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.is_in_group("Objeto"):
		Objeto=true
		Dialogos.nom_obj=area.name


func _on_area_2d_area_exited(area):
	if area.is_in_group("Objeto"):
		Objeto=false
		Dialogos.nom_obj=""
