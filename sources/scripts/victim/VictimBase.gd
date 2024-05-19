extends KinematicBody2D

class_name VictimActorBase

export var duration_walking: int
export var duration_idle: int
export var DEBUG: bool = false
export var flip_h: bool = false

const SPEED = 13
const GRAVITY = 15
const JUMPFORCE = -500
const SPEED_SLIDE = 30

onready var sprite = get_node("PlayerSprite")

var fsm: VictimStateMachine
var command: VictimCommand = VictimCommand.new()

var velocity = Vector2(0,0) # Скорость игрока по координатам x, y


func _ready():
	command.actor = self
	self.sprite.flip_h = self.flip_h


func get_duration_walking():
	if duration_walking != 0:
		return duration_walking
	return _random_generate_from_range(1,7)
	
func get_duration_idle():
	if duration_idle != 0:
		return duration_idle
	return _random_generate_from_range(1,3)

	
func _random_generate_from_range(from, to):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	return rng.randi_range(from, to)

func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2.UP) # Vector2.UP - направелние снизу вверх. Внизу пол.
	velocity.y +=  GRAVITY
	velocity.x = lerp(velocity.x, 0, 0.3)


func change_direction():
	self.sprite.flip_h = not self.sprite.flip_h
	return 1 if self.sprite.flip_h else -1
