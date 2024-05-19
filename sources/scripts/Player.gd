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
onready var fuck_area = get_node("FuckArea")
onready var fuck_area_collision_shape = get_node("FuckArea/CollisionShape2D")

var is_thing_pull_out = false


var grabed_victim_body: VictimActorBase


func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2.UP) # Vector2.UP - направелние снизу вверх. Внизу пол.
	velocity.y +=  GRAVITY
	velocity.x = lerp(velocity.x, 0, 0.3)
	victim_detect_listener()
	

func victim_detect_listener():
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


func toggle_victim_detector(value):
	drag_area_collision_shape.disabled = not value

func toggle_fuck_detector(value):
	fuck_area_collision_shape.disabled = not value

func _on_DragArea_body_entered(body):
	if body is VictimActorBase:
		body.command.set_is_grabbing_victim()
		self.grabed_victim_body = body

func _on_DragArea_body_exited(body):
	if body is VictimActorBase:
		body.command.set_is_victim_good()
		self.grabed_victim_body = null

func start_draging_victim():
	if grabed_victim_body:
		grabed_victim_body.command.set_is_dragging_victim(self)

func moving_victim():
	if grabed_victim_body:
		grabed_victim_body.command.change_position(self)


func _on_FuckArea_body_entered(body):
	if body is VictimActorBase:
		body.command.set_fucking_victim()


func _on_FuckArea_body_exited(body):
	if body is VictimActorBase:
		body.command.set_is_victim_good()
