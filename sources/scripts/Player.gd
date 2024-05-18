extends KinematicBody2D

export var DEBUG: bool = false
export var double_jump: bool = false 

const SPEED = 30
const DRAGGING_SPEED = 10
const GRAVITY = 12
const JUMPFORCE = -300
const SPEED_SLIDE = 30
const  VICTIM_GROUP_NAME = "victim"

var velocity = Vector2(0,0) # Скорость игрока по координатам x, y


var ui_left = 'ui_left'
var ui_right = 'ui_right'
var ui_up = 'ui_up'
var ui_dragging = 'ui_dragging'
var ui_grab = 'ui_grab'
var ui_thing_pull_out = 'thing_pull_out'
var ui_fuck = 'ui_fuck'

var grabbing_is_availiable=false

onready var sprite = get_node("PlayerSprite")
onready var availiability_state_label = get_node('AvailiabilityStatusesLabel')
onready var forvard_ray_cast = get_node("ForvardRayCast")
onready var drag_area = get_node("DragArea")
onready var drag_area_collision_shape = get_node("DragArea/CollisionShape2D")

var is_thing_pull_out = false


signal is_grabbing_victim
signal is_victim_good
signal is_dragging_victim(node)
signal change_position(node)
signal is_not_victim_grabbing



func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2.UP) # Vector2.UP - направелние снизу вверх. Внизу пол.
	velocity.y +=  GRAVITY
	velocity.x = lerp(velocity.x, 0, 0.3)
	victim_detect_listener()
	
	

func victim_is_safe():
	emit_signal("is_not_victim_grabbing")

func victim_detect_listener():
	#availiability_state_label.text = 'Victim Detect' if forvard_ray_cast.is_colliding() else ''
	grabbing_is_availiable = forvard_ray_cast.is_colliding()
	
	return forvard_ray_cast.is_colliding()

func toggle_thing_pull_out():
	self.is_thing_pull_out = not self.is_thing_pull_out


func change_velocity(direction):
	var direction_num = 1 if direction else -1
	self.velocity.x = self.SPEED * direction_num


func draging_move():
	self.velocity.x = self.DRAGGING_SPEED * (1 if self.sprite.flip_h else -1)


func change_direction(direction):
	self.change_velocity(direction)
	self.sprite.change_direction(direction)
	
	
func set_jump_up_velocity():
	self.velocity.y = self.JUMPFORCE

func current_flip_to_num():
	return 1 if self.sprite.flip_h else -1

func is_victim_grabing():
	if drag_area.get_overlapping_bodies():
		for body in drag_area.get_overlapping_bodies():
			if VICTIM_GROUP_NAME in body.get_groups():
				return true
	return false
				
