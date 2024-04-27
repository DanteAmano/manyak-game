extends KinematicBody2D

const SPEED = 80#180
const GRAVITY = 15
const JUMPFORCE = -500
const SPEED_SLIDE = 70


var velocity = Vector2(0,0) # Скорость игрока по координатам x, y
var double_jump 

var ui_left = 'ui_left'
var ui_right = 'ui_right'
var ui_up = 'ui_up'
var ui_grabbing = 'ui_grabbing'
var grabbing_is_availiable=false

onready var sprite = get_node("PlayerSprite")
onready var availiability_state_label = get_node('AvailiabilityStatusesLabel')
onready var forvard_ray_cast = get_node("ForvardRayCast")


func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2.UP) # Vector2.UP - направелние снизу вверх. Внизу пол.
	velocity.y +=  GRAVITY
	# Allows you to stop instead of sliding constantly
	# lerp interpolation
	# Interpolates the numbers x to 0, in 30% increments 
	velocity.x = lerp(velocity.x, 0, 0.3)
	victim_detect_listener()


func victim_detect_listener():
	availiability_state_label.text = 'Victim Detect' if forvard_ray_cast.is_colliding() else ''
	grabbing_is_availiable = forvard_ray_cast.is_colliding()
	
	return forvard_ray_cast.is_colliding()


func change_velocity(direction):
	var direction_num = 1 if direction else -1
	self.velocity.x = self.SPEED * direction_num
	
func change_direction(direction):
	self.change_velocity(direction)
	self.sprite.change_direction(direction)
	
	
func set_jump_up_velocity():
	self.velocity.y = self.JUMPFORCE
