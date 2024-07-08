extends CanvasLayer

var numero_dialogo = 0
var velocidad_dialogo = 0.03
var control = false

# Llamado cuando el nodo entra en el árbol de la escena por primera vez.
func _ready():
	pass # Puedes inicializar variables u otros nodos aquí.

# Llamado en cada frame. 'delta' es el tiempo transcurrido desde el frame anterior.
func _process(_delta):
	if control:
		if Input.is_key_pressed(KEY_F):
			dialogo()

func dialogo():
	if numero_dialogo < Dialogos.dialogo.size():
		var rich_text_label = $Control/RichTextLabel
		var tween = $Tween
		
		# Verificar que rich_text_label y tween no son nulos
		if rich_text_label == null:
			print("Error: RichTextLabel no encontrado")
			return
		if tween == null:
			print("Error: Tween no encontrado")
			return
		
		rich_text_label.bbcode_text = Dialogos.dialogo[numero_dialogo]
		rich_text_label.visible_characters = 0
		var duracion = velocidad_dialogo * Dialogos.dialogo[numero_dialogo].length()

		# Si el tween ya está en ejecución, deténlo primero
		if tween.is_active():
			tween.stop_all()
		
		# Interpolación de la propiedad visible_characters
		tween.tween_property(
			rich_text_label, "visible_characters", 0, Dialogos.dialogo[numero_dialogo].length(), duracion,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		tween.start()
	else:
		numero_dialogo = 0
		var player1 = get_tree().get_nodes_in_group("Player1")[0]
		player1.play_dialogo = false
		get_tree().get_nodes_in_group("GUI")[0].queue_free()
	
	numero_dialogo += 1
