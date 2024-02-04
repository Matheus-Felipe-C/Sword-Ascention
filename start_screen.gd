extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$controls/startBtn.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://Cenas/Fases/main.tscn")
	
	pass # Replace with function body.

func _on_quit_btn_pressed():
	get_tree().quit()
	pass # Replace with function body.





func _on_controlsbtn_pressed():
	var controlScreen = load("res://Cenas/controls_screen.tscn").instance()
	get_tree().current_scene.add_child(controlScreen)
	pass # Replace with function body.
