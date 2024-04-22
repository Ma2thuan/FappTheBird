extends Node2D

class_name Ground

@export var speed = -150

@onready var sprite1 = $Ground1/Sprite2D
@onready var sprite2 = $Ground2/Sprite2D
@onready var sprite3 = $Ground3/Sprite2D



func _ready():
	sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()
	sprite3.global_position.x = sprite2.global_position.x + sprite2.texture.get_width()
	
	
func _process(delta):
	sprite1.global_position.x += speed * delta
	sprite2.global_position.x += speed * delta
	sprite3.global_position.x += speed * delta
	
	# Nếu Gorund1 rời màn hình ta dịch chuyển nó sang vị trí phải của Ground3 
	if sprite1.global_position.x < -sprite1.texture.get_width():
		sprite1.global_position.x = sprite3.global_position.x + sprite3.texture.get_width()
	
	# Nếu Gorund2 rời màn hình ta dịch chuyển nó sang vị trí phải của Ground1 
	if sprite2.global_position.x < -sprite2.texture.get_width():
		sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()
	
	# Nếu Gorund3 rời màn hình ta dịch chuyển nó sang vị trí phải của Ground2 
	if sprite3.global_position.x < -sprite3.texture.get_width() :
		sprite3.global_position.x = sprite2.global_position.x + sprite2.texture.get_width()
