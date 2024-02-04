@tool
extends Area2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer as AnimationPlayer
@export var next_scene : PackedScene

func _on_body_entered(body):
	teleport()

func _get_configuration_warnings():
	if not next_scene:
		return ["The next scene property can't be empty"]
	else:
		return []

func teleport():
	anim_player.play("fade_in")
	await anim_player.animation_finished
	get_tree().change_scene_to_packed(next_scene)
