extends RigidBody2D
class_name MovableObject

@onready var animation = $AnimatedSprite2D as AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _integrate_forces(state):
	angular_velocity = 0
	rotation_degrees = 0
