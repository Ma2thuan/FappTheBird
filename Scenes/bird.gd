extends CharacterBody2D

class_name Bird

@export var jump_force = -300
@export var gravity = 900.0
@export var rotation_speed = 2

@onready var animation_player = $AnimationPlayer

var max_speed = 400
var is_started = false


func _ready():
	velocity = Vector2.ZERO
	animation_player.play("idle")

func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		if !is_started:
			animation_player.play("flap_wing")
			is_started = true
		jump()
		
	if !is_started:
		return
	velocity.y += gravity * delta
	
	# Lấy tốc độ nhỏ nhất và nếu tộc độ vượt quá max speed thì lấy max speed 
	velocity.y = min(velocity.y , max_speed)
	
	move_and_collide(velocity * delta)
	
	rotate_bird()
	
func jump():
	velocity.y = jump_force
	rotation = deg_to_rad(-30)



func rotate_bird():
	
	#Quay chim khi rớt xuống ;)))
	if (velocity.y > 0 and rad_to_deg(rotation) < 90):
		rotation += rotation_speed * deg_to_rad(1)
	
	#quay lên khi bay lên	
	elif velocity.y < 0 and rad_to_deg(rotation) > -30:
		rotation -= rotation_speed * deg_to_rad(1)
	
