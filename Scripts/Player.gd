extends CharacterBody2D

const SPEED = 100.0
const PUSH = 50
var is_dead = false

@onready var animation = $animation as AnimatedSprite2D
	
func _ready():
	animation.play("idle")
	
func death():
	is_dead = true
	animation.play("death")	
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Cenas/game_over.tscn")

func _physics_process(_delta):
	if is_dead:
		return
	
	velocity = Vector2()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed('up'):
		animation.play('run')
		velocity.y -= 1
	if Input.is_action_pressed('down'):
		animation.play('run')
		velocity.y += 1
	if Input.is_action_pressed('left'):
		animation.play('run')
		animation.flip_h = true
		velocity.x -= 1
	if Input.is_action_pressed('right'):
		animation.play('run')
		animation.flip_h = false
		velocity.x += 1
	
	velocity = velocity.normalized() * SPEED
	
	if move_and_slide():
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			var collision_collider = collision.get_collider()
			if collision_collider is MovableObject:
				if !Input.is_anything_pressed():
					break
				collision_collider.apply_force(collision.get_normal() * -PUSH)
# Para o player e roda a animação de idle
func _input(event):
	if is_dead:
		return
	if event is InputEventKey and event.pressed == false:
		velocity = Vector2()
		animation.play('idle')
