# Gate.gd
extends StaticBody2D

@export var simpleGate = true

func _ready():
	print("Gate script is ready")

func _on_pressure_plate_body_entered(_body):
	if _body.name != self.name:
		pass
	
	if is_visible():
		hide()
		set_collision_layer_value(1, false)
		set_collision_mask_value(1, false)

func _on_pressure_plate_body_exited(_body):
	if _body.name != self.name:
		pass
	
	if not simpleGate:
		show()
		set_collision_layer_value(1, true)
		set_collision_mask_value(1, true)


func _on_area_2d_body_entered(body):
	pass # Replace with function body.
